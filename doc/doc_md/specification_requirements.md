# Employee Availability System

This system provides ability for employees to set their available dates and times to let know
employer whe they are available for job.

Employer can search for employees by time and assing them to particular jobs

## Employee

Attributes

* Name
* Surname
* Date of birth
* Email
* age
* Image
* Type (waiter, porter, driver, bartender) can be multiple types

Behaviour

* Create account
* Edit profile
* Delete profile
* Select Available date and time
* Change Available date and time (this is not possible one day before availability is due)
* Remove Available date and time (this is not possible one day before availability is due)
* list selected dates and times
* list actual jobs (filter by date, time, assignment)

## Employer

Attributes

* Name
* Surname
* Date of birth
* Email
* age
* Image
* Position
* Access Level

Behaviour

* Create employee account
* Create jobs
* Edit jobs
* Delete jobs
* List employees availability
* List employees by Jobs date and time
* Assign Employee to job (Email notification to employee)
* remove Employee from job (Email notification to employee)
