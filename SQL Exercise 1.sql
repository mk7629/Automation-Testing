/* Section 1 */
/* No. 1*/
Select * 
From EMPLOYEES;

/* No. 2*/
Select employee_id, first_name, last_name, phone_number, department_id  
From EMPLOYEES;

/* No. 3*/
Select department_id, department_name, manager_id as "MNG_ID"
From DEPARTMENTS;

/* No. 4 */
Select concat(concat(last_name, ' '), job_id) as "EMPLOYEE_AND_TITLE"
From EMPLOYEES;

/* No. 5 */
Select concat(concat(last_name, ' '), first_name) as "FULL_NAME",
       concat(concat(phone_number, '-'), email) as "CONTACT_DETAILS"
From EMPLOYEES;

/* Section 2 */
/* No. 6*/
Select first_name, department_id
From EMPLOYEES
Where last_name = 
(Select last_name 
From EMPLOYEES
Where last_name = 'De Haan');

/* No. 7*/
Select * 
From DEPARTMENTS
Where DEPARTMENT_NAME = 'Sales';

/* No. 8*/
Select first_name, last_name, department_id, salary 
From EMPLOYEES 
Where salary > 9700;

/* No. 9*/
Select * 
From EMPLOYEES
Where hire_date < '01-Jan-02';

/* No. 10*/
Select employee_id, first_name, job_id, department_id 
From EMPLOYEES
Where DEPARTMENT_ID in ('20', '60', '80');

/* No. 11*/
Select employee_id, first_name, job_id, department_id 
From EMPLOYEES
Where DEPARTMENT_ID not in ('20', '60', '80');

/* No. 12*/
Select first_name, salary
From EMPLOYEES
Where first_name like '%e';

/* No. 13*/
Select last_name, department_id 
From EMPLOYEES 
Where last_name Like '_i%';

/* No. 14*/
Select first_name, hire_date, salary, department_id 
From EMPLOYEES 
Where first_name not like '%a%'
Order by department_id;

/* No. 15*/
Select *
From EMPLOYEES
Where DEPARTMENT_ID is NULL;

/* No. 16*/
Select last_name, job_id, hire_date 
From employees 
Where hire_date between '12-Dec-05' and '17-Apr-08'
Order by hire_date DESC;

/* No. 17*/
Select first_name, salary 
From employees 
Where commission_PCT is NULL;

/* No. 18*/
Select first_name, salary, manager_id
From employees 
Where manager_id is not null;

/* No. 19*/
Select last_name, salary 
From EMPLOYEES 
Where salary > 12000;

/* No. 20*/
Select Concat(Concat(first_name,' '), last_name) as "Full_Name", salary
From EMPLOYEES 
Where salary NOT Between 7000 and 15000
Order By "Full_Name" ASC;

/* Bonus */
Select Concat(Concat(first_name,' '), last_name) , hire_date, commission_PCT, Phone_Number, salary 
From employees 
Where salary > 10000
OR Phone_Number LIKE '__5%'
Order by first_name DESC;

