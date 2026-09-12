A Saga transaction is an architectural pattern that aims to ensure data consistency in distributed transactions, especially in scenarios where these transactions depend on continuous execution across multiple microservices or have a long duration before being fully completed, and where any partial execution is undesirable.


Within a Saga Pattern implementation, a Saga has a sequential characteristic, in which the transaction depends on several microservices to be completed, with steps that must be executed one after the other, in an ordered and distributed manner.

The implementation of these steps can vary between choreographed and orchestrated approaches, which will be explored further below. Regardless of the approach chosen, the main objective is to manage transactions involving data in different microservices and databases, or that are long-running, and to ensure that all steps are executed without losing consistency and control. In case of failure of any of the components due to system errors or invalid data inputs, the system must have the ability to notify all participants in the saga to compensate for the transaction by performing a rollback of all steps already executed.


### The problem of dealing with distributed transactions

A distributed transaction is one that needs to occur across multiple systems and databases to be completed. By definition, it requires multiple participants writing and committing their data to be successful, and reporting the write status to whoever is coordinating the transaction.

Let's imagine the order system of a large e-commerce company. The main function of this system is to receive an order request and execute all the necessary actions to ensure the complete fulfillment of that order, from the request to the delivery. To do this, it needs to interact with various microservices relevant to this hypothetical flow, such as Order Service, Payment Service, Inventory Service, Delivery Service, and a Notification Service, which notifies the customer of all stages of the order.

> Example of an initial distributed process:

https://fidelissauro.dev/assets/images/system-design/saga-problema-distribuido-1.drawio.png


In a complex architecture with multiple interconnected services, each isolated domain needs to guarantee a part of the execution sequence for the request to be completed successfully. As the number of components increases, so does the complexity, increasing the likelihood of failures and inconsistencies.

Imagine that, during the execution of these steps, one of the services fails for some non-systemic reason in terms of resilience, such as a missing item in stock or the receipt of invalid information by the inventory service. In these situations, it may be impossible to continue calls to subsequent services, such as the delivery service, even if critical steps, such as payment processing, have already been successfully completed. In this case, knowing and undoing the previous steps can become a complex problem.

This scenario represents a serious distributed consistency problem. Without adequate mechanisms, the system can end up in an inconsistent state, where payment has been made, but the order has not been completed. The Saga Pattern seeks to solve exactly this type of problem, ensuring that, even in case of failures, the system maintains data integrity and returns to a consistent state across all services that make up the transaction.

### The problem of dealing with long transactions

In many scenarios, complex processes require a slightly longer period to be fully completed. For example, a request within a system that needs to go through several execution steps can take anywhere from milliseconds to weeks or months to be completely finalized.

The waiting time between the execution of a microservice and the subsequent service can intentionally vary due to factors such as scheduling, external stimuli, grouping of records within periods, and others. Examples of this include installment payment control, financial scheduling, consolidation of digital product usage allowances, grouping of requests for batch processing, invoice closing, and control of system resource usage by its clients.

Managing the lifecycle of these long-term transactions represents a significant architectural challenge, especially in terms of consistency and completion. It is necessary to create mechanisms that allow for end-to-end transaction control in complex scenarios, monitoring all stages the transaction has gone through, and determining and managing the current state of the transaction in a transparent and sustainable way. The Saga Pattern solves these problems by decomposing long transactions into a series of smaller, independent transactions, each managed by a specific microservice. This facilitates consistency assurance and failure recovery in terms of operational resilience.

### The Saga Transaction Proposal

The Saga pattern, when applied to asynchronous approaches, eliminates the need for synchronous and prolonged locks, such as in the case of Two-Phase Commit (2PC), which is computationally expensive and can become a performance bottleneck in distributed environments. These types of long locks are also difficult to restore in case of failures.

There are two main models for implementing the Saga Pattern: the Orchestrated Model and the Choreographed Model. Each has different architectural characteristics regarding the coordination and communication of Saga transactions. The choice between the models depends on the specific needs of how the system was designed and, above all, should take into account the complexity of the transactions.

### Orchestrated Model

The Orchestrated Model proposes the existence of a centralized orchestration component that manages the execution of sagas. The orchestrator is responsible for initiating the saga, coordinating the sequence of transactions, monitoring responses, and managing the compensation flow in case of failures. It acts as a 'control plane' that sends commands to the participating microservices and waits for responses to decide on the next steps or to continue the saga.

> Example of the Orchestrated Model:

https://fidelissauro.dev/assets/images/system-design/saga-orquestrado-circulo.png

Consider that, to complete a purchase order transaction, you need to trigger and await confirmation responses from a series of domains such as payments, inventory, notifications, and deliveries. These are many distributed components, each with its own limitations, scalability capabilities, usage modes, and contracts, all of which need to be triggered sequentially and logically for the transaction to be completed. Assuming an asynchronous approach, an orchestrator uses the command/response pattern to trigger these microservices and, based on the response from each, trigger the next microservice in the saga, compensate for operations already performed in case of failure, or complete and terminate the saga. An orchestrator can also work synchronously if necessary; however, resilience mechanisms that are already "native" to messaging, such as backoffs, retries, and DLQs, must be implemented manually to ensure healthy resilience in the saga's execution.

So, the orchestrator's role is basically to assemble a "saga map," with all the steps that need to be completed to finalize it, send messages and events to the respective microservices, and, based on their responses, proceed and stimulate the next step of the saga until it is fully complete or compensate for operations already performed in case of failure.

### Saga Transaction Command/Response Model

In modern implementations of the Saga Pattern, particularly in the orchestrated model, many of the interactions between saga participants occur asynchronously and reactively. In this approach, the saga orchestrator (or a requesting service, outside the Saga Pattern) sends a command to another microservice to perform an action and waits for the response in a blocking or semi-blocking manner before proceeding to the next step of the saga.

> Asynchronous Flow Command and Response Model

https://fidelissauro.dev/assets/images/system-design/saga-command-response.drawio.png

This assumes that the exposed services need to provide an action topic and another for the responses to that action, so that the orchestrator or requesting service knows where to send the command and where to wait for the completion response, whether successful or not.

### Choreographed Model

The choreographed model, unlike the orchestrated model which proposes a centralized component that knows all the steps of the saga, proposes that microservices should know the next and previous services. This means that the saga is executed in a service mesh approach, where, in a complex case, a microservice, when it is called and finishes its process, knows the next microservice and the protocol it uses to expose its functionalities. This microservice is responsible for executing the next step and so on until the saga is completed.

https://fidelissauro.dev/assets/images/system-design/saga-coreografado.drawio.png

The same logic is applied in compensation and rollback operations, where the service that failed is required to notify the previous one or activate a "panic button" so that the entire previous chain reverts to the steps already confirmed.

https://fidelissauro.dev/assets/images/system-design/saga-coreografado-compensacao.drawio.png

### Architectural Adoptions

#### State Machines in the Saga Model

In distributed architectures, maintaining the state of all the steps of a saga must complete until it is considered finished is perhaps the most critical concern. This type of control allows us to identify which sagas are still pending or have failed and at what step this happened, enabling the creation of monitoring mechanisms, retries, saga summaries, error compensation, etc.

























## Links

https://fidelissauro.dev/saga-pattern/
