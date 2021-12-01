select * from employees;

select * from salary;

select * from employee_salary;

select * from roles;

select * from roles_employee;

-- Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id;

-- Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id and salary.monthly_salary < 2000;

-- Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from employee_salary
left join employees 
on employee_salary.employee_id = employees.id where employees.id is null;

-- Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select * from employee_salary
left join employees 
on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
where employees.id is null and salary.monthly_salary < 2000;

-- Найти всех работников кому не начислена ЗП.
select * from employees left join employee_salary
on employees.id = employee_salary.employee_id where employee_salary.salary_id is null;

-- Вывести всех работников с названиями их должности.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id;

-- Вывести имена и должность только Java разработчиков.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Java developer%';

-- Вывести имена и должность только Python разработчиков.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Python developer%';

--  Вывести имена и должность всех QA инженеров.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA engineer%';

-- Вывести имена и должность ручных QA инженеров.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Manual QA engineer%';

-- Вывести имена и должность автоматизаторов QA
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Automation QA engineer%';

-- Вывести имена и зарплаты Junior специалистов
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Junior%';

-- Вывести имена и зарплаты Middle специалистов
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Middle%';

-- Вывести имена и зарплаты Senior специалистов
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Senior%';

-- Вывести зарплаты Java разработчиков
select roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Java developer%';

-- Вывести зарплаты Python разработчиков
select roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Python developer%';

-- Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name = 'Junior Python developer';

-- Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name = 'Middle JavaScript developer';

-- Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name = 'Senior Java developer';

-- Вывести зарплаты Junior QA инженеров
select roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like 'Junior % QA engineer';

-- Вывести среднюю зарплату всех Junior специалистов
select AVG(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Junior%';

-- Вывести сумму зарплат JS разработчиков
select SUM(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%JavaScript developer%';

-- Вывести минимальную ЗП QA инженеров
select MIN(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%QA engineer%';

-- Вывести максимальную ЗП QA инженеров
select MAX(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%QA engineer%';

-- Вывести количество QA инженеров
select COUNT(roles.role_name) from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA engineer%';

-- Вывести количество Middle специалистов
select COUNT(roles.role_name) from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Middle%';

-- Вывести количество разработчиков
select COUNT(roles.role_name) from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%developer%';

-- Вывести фонд (сумму) зарплаты разработчиков.
select SUM(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%developer%';

-- Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id 
order by employees.employee_name, roles.role_name, salary.monthly_salary;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where salary.monthly_salary between 1700 and 2300
order by employees.employee_name, roles.role_name, salary.monthly_salary;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where salary.monthly_salary < 2300
order by employees.employee_name, roles.role_name, salary.monthly_salary;

-- Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where salary.monthly_salary in (1100, 1500, 2000)
order by employees.employee_name, roles.role_name, salary.monthly_salary;