INFO [10:31:02]: -----------------------------------------------------------------------------------
INFO [10:31:02]: Iniciando execução de fluxo: processId: cc3ad18e-02e3-4cf3-9a10-5c9232c0250d taskId: 53de1624-b14e-4d0a-9364-8fd132ffd804 | flowStepId: 17493259-c888-457f-b209-cf7d59c0ed3d | grupo: 67d18b20-6a66-4daa-aaf8-a8f97b0efffe | usuário: 0373a555-bcda-46f1-a620-7e3e1faccddc
INFO [10:31:02]: Payload recebido: {"origin":"Liminar","dateSubpoena":"2026-06-10T03:00:00.000Z","deadlineCompliance":"2026-06-10T03:00:00.000Z","details":"cc3ad18e-02e3-4cf3-9a10-5c9232c0250d/","obligationsAttachments":["7ecc8320-09e2-493e-95d9-2fbf08d5b1e3"],"validated":"Sim","observation":null,"teamServiceId":"213c1f27-973c-47b7-8050-1d25464ca9f9","hasDeadline":true,"deadline":"2026-06-10T03:00:00.000Z","urgent":false,"obfId":"14974a7f-c796-440b-9160-bc366b49e4b4","processId":"cc3ad18e-02e3-4cf3-9a10-5c9232c0250d","valuesWithoutFormat":{"hasDeadline":true,"deadline":"2026-06-10T03:00:00.000Z","urgent":false,"origin":"Liminar","dateSubpoena":"2026-06-10T03:00:00.000Z","deadlineCompliance":"2026-06-10T03:00:00.000Z","details":"cc3ad18e-02e3-4cf3-9a10-5c9232c0250d/","obligationsAttachments":[{"name":"anexo-bcd62569.pdf","id":"7ecc8320-09e2-493e-95d9-2fbf08d5b1e3","fileId":"7ecc8320-09e2-493e-95d9-2fbf08d5b1e3","s3Path":"67d18b20-6a66-4daa-aaf8-a8f97b0efffe/53155775420267064732/anexo-bcd62569.pdf","description":"Sentença"}],"teamServiceId":{"value":"213c1f27-973c-47b7-8050-1d25464ca9f9","label":"Atendimento"},"matter":{"label":"Ambiental","value":"ac9cc1dc-8c13-4f41-9ce0-d7e3b68c1fd4"},"validated":"Sim","observation":""}}
DEBUG [10:31:05]: 
┌────────────────────────────────────────────────────────┐
│  STEP DEBUG
├────────────────────────────────────────────────────────┤
│  Tarefa   Validar obrigação de fazer
│  taskId   53de1624-b14e-4d0a-9364-8fd132ffd804
│  stepId   17493259-c888-457f-b209-cf7d59c0ed3d
├─ Actions 12/15 ────────────────────────────────────────┤
│  ✓   0  validate-fields
│  ✓   1  check-entity-existence
│  ✓   2  check-entity-existence
│  ✓   3  define-deadline
│  ✓   4  evaluate-branch
│  ✓   5  validate-fields
│  ✗   5  validate-fields  [Não executada]
│  ✓   6  validate-team-group
│  ✗   6  update-data  [Não executada]
│  ✓   7  update-data
│  ✗   7  create-task  [Não executada]
│  ✓   8  define-deadline
│  ✓   9  define-deadline
│  ✓  10  create-task
│  ✓  10  create-task
├────────────────────────────────────────────────────────┤
│  Branches  1A
│  Tempo     3242.13ms
└────────────────────────────────────────────────────────┘
INFO [10:31:05]: -----------------------------------------------------------------------------------
INFO [10:31:05]: Iniciando execução de fluxo: processId: cc3ad18e-02e3-4cf3-9a10-5c9232c0250d taskId: 53de1624-b14e-4d0a-9364-8fd132ffd804 | flowStepId: 17493259-c888-457f-b209-cf7d59c0ed3d | grupo: 67d18b20-6a66-4daa-aaf8-a8f97b0efffe | usuário: 0373a555-bcda-46f1-a620-7e3e1faccddc
INFO [10:31:05]: Payload recebido: {"origin":"Liminar","dateSubpoena":"2026-06-10T03:00:00.000Z","deadlineCompliance":"2026-06-10T03:00:00.000Z","details":"cc3ad18e-02e3-4cf3-9a10-5c9232c0250d/","obligationsAttachments":["7ecc8320-09e2-493e-95d9-2fbf08d5b1e3"],"validated":"Sim","observation":null,"teamServiceId":"213c1f27-973c-47b7-8050-1d25464ca9f9","hasDeadline":true,"deadline":"2026-06-10T03:00:00.000Z","urgent":false,"obfId":"14974a7f-c796-440b-9160-bc366b49e4b4","processId":"cc3ad18e-02e3-4cf3-9a10-5c9232c0250d","valuesWithoutFormat":{"hasDeadline":true,"deadline":"2026-06-10T03:00:00.000Z","urgent":false,"origin":"Liminar","dateSubpoena":"2026-06-10T03:00:00.000Z","deadlineCompliance":"2026-06-10T03:00:00.000Z","details":"cc3ad18e-02e3-4cf3-9a10-5c9232c0250d/","obligationsAttachments":[{"name":"anexo-bcd62569.pdf","id":"7ecc8320-09e2-493e-95d9-2fbf08d5b1e3","fileId":"7ecc8320-09e2-493e-95d9-2fbf08d5b1e3","s3Path":"67d18b20-6a66-4daa-aaf8-a8f97b0efffe/53155775420267064732/anexo-bcd62569.pdf","description":"Sentença"}],"teamServiceId":{"value":"213c1f27-973c-47b7-8050-1d25464ca9f9","label":"Atendimento"},"matter":{"label":"Ambiental","value":"ac9cc1dc-8c13-4f41-9ce0-d7e3b68c1fd4"},"validated":"Sim","observation":""}}
DEBUG [10:31:07]: 
┌────────────────────────────────────────────────────────┐
│  STEP DEBUG
├────────────────────────────────────────────────────────┤
│  Tarefa   Validar obrigação de fazer
│  taskId   53de1624-b14e-4d0a-9364-8fd132ffd804
│  stepId   17493259-c888-457f-b209-cf7d59c0ed3d
├─ Actions 12/15 ────────────────────────────────────────┤
│  ✓   0  validate-fields
│  ✓   1  check-entity-existence
│  ✓   2  check-entity-existence
│  ✓   3  define-deadline
│  ✓   4  evaluate-branch
│  ✓   5  validate-fields
│  ✗   5  validate-fields  [Não executada]
│  ✓   6  validate-team-group
│  ✗   6  update-data  [Não executada]
│  ✓   7  update-data
│  ✗   7  create-task  [Não executada]
│  ✓   8  define-deadline
│  ✓   9  define-deadline
│  ✓  10  create-task
│  ✓  10  create-task
├────────────────────────────────────────────────────────┤
│  Branches  1A
│  Tempo     2139.28ms
└────────────────────────────────────────────────────────┘



---



---



---



