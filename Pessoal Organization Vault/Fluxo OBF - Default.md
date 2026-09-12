
Tarefas:

1 - Validar obrigação de fazer (validate-obf-default)
 -> Validated = Nao
    2 - Revisar OBF (review-obf-default)
 -> Validated = Sim
    2.1 - OBF - Realizar Atendimento (perform-service-obf-default)
      -> requiresAdditionalInformation = Sim
	      3 - Fornecer Informações Complementares (supplement-information-obf-default)
	  -> requiresAdditionalInformation = Nao
    2.2 - Ciência nova OBF - `SEM AÇÃO`



Backups:

### 1 - Validar obrigação de fazer (validate-obf-default)

{
  "route": "obf/validate",
  "service": "submitDefaultObfForm",
  "queriesToInvalidate": [
    "obf-details"
  ]
}

### 2 - Revisar OBF (review-obf-default)

{
  "route": "obf/resendValidation",
  "service": "submitDefaultObfForm",
  "queriesToInvalidate": [
    "obf-details"
  ]
}


### 3 - OBF - Realizar Atendimento (perform-service-obf-default)

{
  "route": "obf/additionalInformation",
  "service": "submitDefaultObfForm",
  "queriesToInvalidate": [
    "obf-details"
  ]
}


### 4 - Fornecer Informações Complementares (supplement-information-obf-default)

{
  "route": "obf/provideAdditionalInformation",
  "service": "submitDefaultObfForm",
  "queriesToInvalidate": [
    "obf-details"
  ]
}

### 5 - Validar Cumprimento da OBF (validate-obf-compliance-default)

{
  "route": "obf/validatedObligation",
  "service": "submitDefaultObfForm",
  "queriesToInvalidate": [
    "obf-details"
  ]
}

### 6 - Revisar Atendimento da OBF(review-obf-service-default)

{
  "route": "obf/additionalInformation",
  "service": "submitDefaultObfForm",
  "queriesToInvalidate": [
    "obf-details"
  ]
}