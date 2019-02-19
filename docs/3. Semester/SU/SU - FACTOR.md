# System Definition

## FACTOR

> See page 40-41 in OOAD

##### F - Functionality

The system functions that support the application-domain tasks.

##### A - Application domain

Those parts of an organization that administrate, monitor, or control a problem domain.

##### C - Conditions

The conditions under which the system will be developed and used.

##### T - Technology

Both the technology used to develop the system and the technology on which the system will run.

##### O - Objects

The main objects in the problem domain.

##### R - Responsibility
The system's overall responsibility in relation to its context.



# Wiums

## System Definition
After analyzing the case study at Wiums Renseri, the problem with the current
system is order management being done manually by hand. A modern system,
that keeps track of order information, could reduce the number of human errors
and potentially increase productivity. Modelling the company’s desired situation
and looking at existing solution had confirmed the possible solution being a computerized order management system. This results in the following FACTOR criterion.

### FACTOR

**Functionality**: Hold information about orders, customers and products. The system should be able to print tags for tracking orders. Assist the employees in
administrating customers and payments. Support managers by generating sales
statistics, and facilitate payments.

**Application domain**: Employees such as managers, the receptionist and the people in the production are all part of the application domain, because they either
monitor, administrate or control orders, by using the system. The credit card
terminal will also interact with the system, by receiving transaction amount and
confirming if a transaction is accepted. Therefore, it is also a part of the application
domain.

**Conditions**: The system should be developed in close cooperation with Wiums
Renseri, to understand the appropriate steps of the process. The employees should
have knowledge about the processes in Wiums Renseri, in order to understand the
systems sequential steps.

**Technology**: The system will be based on a modern computer with a monitor. A
receipt printer and waterproof label printer should be supported by the system,
as to make it possible to print receipts and tags for the textiles. Furthermore,
scanners will be needed to scan the tags. A credit card terminal should help
facilitate payments.

**Objects**: The most important objects are products, orders and customers.

**Responsibility**: Tool that assist in order administration, by maintaining information about products, orders and customers. Notifies customers of order completion, and passing relevant information to e-conomic.

## Definition

Using the FACTOR model the following system definition is made:

A computerized system used to assist in order management, by allowing the employees to
monitor and register new orders and keep track of payments and pricing of products, as well
as tracking individual orders at certain stages of service. The system should also be able to
print notes, tags and receipts for these orders, as well as handle customer notifications of
completed orders and support integration with e-conomic.
The system should primarily serve as a tool to improve the order management process,
by maintaining information about orders, products and customers. Secondarily, it should
serve as a tool to automate filling out invoices in e-conomic for business customers, as
well as generating statistics from all sales. The system should be based on regular modern
PCs and monitors, a receipt printer, a waterproof label printer, a credit card terminal and
several scanners for the tags. The system should be developed in close cooperation with
Wiums Renseri and it should be assumed that employees are experienced in the processes
at Wiums Renseri.