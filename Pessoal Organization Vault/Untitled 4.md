reply.log.info("-----------------------------------------------------------------------------------");

reply.log.info(

`Iniciando execução de fluxo: processId: ${body.payload?.processId ?? "<not specified>"} taskId: ${body.taskId} | flowStepId: ${body.flowStepId} | grupo: ${session.groupId} | usuário: ${session.userId}`,

);

reply.log.info(`Payload recebido: ${JSON.stringify(body.payload)}`);