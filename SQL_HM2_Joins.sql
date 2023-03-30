-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary 
from employees join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, salary.monthly_salary  from employees
join employee_salary
on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id  
where salary.monthly_salary < 2000;
      
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. ЗП есть, но не понятно кто её получает.
select salary.monthly_salary, employee_salary.employee_id as employee  
from salary
left join employee_salary
on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employee_salary.employee_id as employee  
from salary
left join employee_salary
on salary.id = employee_salary.salary_id
where monthly_salary < 2000 and employee_salary.employee_id is null 

-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name
from employees
left join employee_salary on employees.id = employee_salary.employee_id
where employee_salary.salary_id is null;

-- 6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name 
from employees
join roles on employees.id = roles.id

-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name 
from employees join roles 
on employees.id = roles.id 
where role_name like '%Java%';

-- 8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles.role_name 
from employees join roles 
on employees.id = roles.id 
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name 
from employees join roles 
on employees.id = roles.id 
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name 
from employees join roles 
on employees.id = roles.id 
where role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name 
from employees join roles 
on employees.id = roles.id 
where role_name like '%Automation QA%';

--  12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, salary.monthly_salary
from employees join employee_salary ON employees.id = employee_salary.employee_id
join salary ON employee_salary.salary_id = salary.id
join roles_employee ON employees.id = roles_employee.employee_id
join roles ON roles_employee.role_id = roles.id
where roles.role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, salary.monthly_salary
from employees join employee_salary ON employees.id = employee_salary.employee_id
join salary ON employee_salary.salary_id = salary.id
join roles_employee ON employees.id = roles_employee.employee_id
join roles ON roles_employee.role_id = roles.id
where roles.role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, salary.monthly_salary
from employees join employee_salary ON employees.id = employee_salary.employee_id
join salary ON employee_salary.salary_id = salary.id
join roles_employee ON employees.id = roles_employee.employee_id
join roles ON roles_employee.role_id = roles.id
where roles.role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select salary.monthly_salary, roles.role_name 
from salary join roles 
on salary.id = roles.id 
where roles.role_name like '%Java developer%';

-- 16. Вывести зарплаты Python разработчиков
select salary.monthly_salary, roles.role_name 
from salary join roles 
on salary.id = roles.id 
where roles.role_name like '%Python developer%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary
from employees join salary  
on salary.id = employees.id
join roles on roles.id = salary.id 
where roles.role_name like '%Junior Python developer%'


-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary
from employees join salary  
on salary.id = employees.id
join roles on roles.id = salary.id 
where roles.role_name like '%Middle JavaScript developer%'

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary
from employees join salary  
on salary.id = employees.id
join roles on roles.id = salary.id 
where roles.role_name like '%Senior Java developer%'

-- 20. Вывести зарплаты Junior QA инженеров
select salary.monthly_salary, roles.role_name 
from salary join roles 
on salary.id = roles.id
where roles.role_name like '%Junior QA%'

-- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG(salary.monthly_salary)
from salary
join roles ON salary.id = roles.id
where roles.role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков    
select SUM (salary.monthly_salary) from salary
inner join employee_salary 
on salary.id = employee_salary.employee_id
join employees 
on employees.id = employee_salary.employee_id
join roles_employee 
on employees.id = roles_employee.employee_id
join roles
on roles_employee.role_id = roles.id
where role_name like '%JavaScript developer%'

-- 23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary) from salary
join roles on salary.id = roles.id
where roles.role_name like '%QA%'

-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from salary 
join roles on salary.id = roles.id 
where roles.role_name like '%QA%'

-- 25. Вывести количество QA инженеров
select count(roles.role_name) from roles
join roles_employee on roles.id = roles_employee.role_id
WHERE role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(roles.role_name) from roles
join roles_employee on roles.id = roles_employee.role_id 
WHERE role_name like '%Middle%';

-- 27. Вывести количество разработчиков
SELECT COUNT(role_name)
FROM roles
JOIN roles_employee re ON e.id = re.employee_id
JOIN roles r ON re.role_id = r.id
WHERE r.role_name = '%Developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM (salary.monthly_salary) from salary
inner join employee_salary 
on salary.id = employee_salary.employee_id
join employees 
on employees.id = employee_salary.employee_id
join roles_employee 
on employees.id = roles_employee.employee_id
join roles
on roles_employee.role_id = roles.id
where role_name like '%developer%'

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
join salary on salary.id = roles_employee.employee_id 
order by employee_name asc

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
join salary on salary.id = roles_employee.employee_id 
where salary.monthly_salary between 1700 and 2300
order by monthly_salary asc

 -- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
join salary on salary.id = roles_employee.employee_id 
where salary.monthly_salary < 2300
order by monthly_salary asc


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees
join roles_employee on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
join salary on salary.id = roles_employee.employee_id 
where salary.monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc
