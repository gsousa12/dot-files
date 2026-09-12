export async function orchestratorDefaultProcessClosure({
  values,
  data,
  taskId,
  formData,
  valuesWithoutFormat,
  formFields,
  processId,
  stepInfo,
  url,
}) {
  let body = { ...values }

  let customFieldsData = {}
  formFields.forEach(field => {
    if (field.saveInsideCustomFields) {
      customFieldsData[field.name] = valuesWithoutFormat[field.name]
      delete body[field.name]
    }
  })

  body['customFields'] = { ...customFieldsData }

  const payload = { ...body, processClosureId: data.id, processId }

  const requestBody = {
    taskId,
    flowStepId: stepInfo.id,
    payload,
  }

  const response = await axios.post(`${URL_FLOWS}/${url}`, requestBody)
  if (!response.data?.success) {
    throw new Error(response?.data?.message || 'Erro ao enviar formulário')
  }

  await acceptTask(taskId, formData)
}


![[Pasted image 20260527144831.png|697]]