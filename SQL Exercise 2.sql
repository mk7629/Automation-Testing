/* SQL Exercise 2 */

/* Section 1 */
/* No.1 */
Select Count(*)
From EMPLOYEES;

/* No.2 */
Select Min(salary), Max(salary), Avg(salary)
From EMPLOYEES;

/* No.3 */
Select department_id, Avg(salary)
From EMPLOYEES
Group by DEPARTMENT_ID;

/* No.4 */
Select department_id, Avg(salary)
From EMPLOYEES
Where DEPARTMENT_ID In ('50', '80')
Group by DEPARTMENT_ID;

/* No.5 */
Select job_id, Count(*)
From EMPLOYEES
Group By job_id;

/* No.6 */
Select job_id, Count(*) 
From EMPLOYEES
Group By job_id
Having Count(*) > 2;

/* No.7 */
Select manager_id, Max(salary)
From EMPLOYEES 
Group By manager_id;

/* No.8 */
Select manager_id, Max(salary)
From EMPLOYEES 
Group By manager_id
Having Max(salary) > 10000;

/* No.9 */
Select job_id, Min(salary)
From EMPLOYEES 
Group By job_id
Having Min(salary) > 7000;

/* Section 2 */
/* No.10 */
Select EMPLOYEES.first_name, EMPLOYEES.last_name, EMPLOYEES.department_id, DEPARTMENTS.DEPARTMENT_NAME
From EMPLOYEES
      Inner Join DEPARTMENTS
      On EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

/* No.11 */
Select EMPLOYEES.first_name, EMPLOYEES.last_name, EMPLOYEES.department_id, DEPARTMENTS.DEPARTMENT_NAME
From EMPLOYEES
      Inner Join DEPARTMENTS
      On EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
Where DEPARTMENTS.DEPARTMENT_ID IN (50, 90);

/* No.12 */
Select department_name, city, state_province
From LOCATIONS
    Inner Join DEPARTMENTS
    On LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID;

/* No.13 */
Select Concat(Concat(first_name, ' '), last_name) AS "FULL_NAME", department_name, city, state_province 
From EMPLOYEES 
    Inner Join DEPARTMENTS 
    On DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
    Inner Join LOCATIONS 
    On LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID;
    
/* No.14 */
Select Concat(Concat(first_name, ' '), last_name) AS "FULL_NAME", department_name, city, state_province 
From EMPLOYEES 
    Inner Join DEPARTMENTS 
    On DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
    Inner Join LOCATIONS 
    On LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID
Where last_name Like '%a%';

/* No.15 */
Select first_name, salary 
From EMPLOYEES
Where salary > 
    (Select salary
    From EMPLOYEES
    Where EMPLOYEE_ID = 103);

/* No.16 */
Select department_id, department_name
From DEPARTMENTS
Where location_id = Any
      (Select location_id
      From DEPARTMENTS
      Where DEPARTMENT_ID = 90);
    
/* No.17 */
Select last_name, hire_date 
From EMPLOYEES
Where hire_date > 
    (Select hire_date
    From EMPLOYEES
    Where employee_id = 101);
    
/* No.18 */  
Select department_id, department_name
From DEPARTMENTS 
      Inner Join locations
      On DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
Where city = 'Toronto';

/* No.19 */  
Select first_name, salary, department_id
From EMPLOYEES
Where salary > Any
      (Select Avg(salary)
      From EMPLOYEES);

/* No.20 */  
Select first_name, salary, department_id 
From EMPLOYEES
Where salary = Any
      (Select salary
      From EMPLOYEES
      Where department_id = 20);

/* Bonus */ 
Select first_name, last_name, salary,
(Case
    When salary between 0 and 5000 Then 'salary grade level is A'
    When salary between 5001 and 15000 Then 'salary grade level is B'
    When salary between 15001 and 20000 Then 'salary grade level is C'
    Else 'salary grade level is D' 
End) as SAL_RANKS
From EMPLOYEES;

