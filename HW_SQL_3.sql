select * from employees;

select * from salary;

select * from employee_salary;

select * from roles;

select * from roles_employee;

-- ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employees.employee_name, salary.monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id;

-- ������� ���� ���������� � ������� �� ������ 2000.
select employees.employee_name, salary.monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id and salary.monthly_salary < 2000;

-- ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select * from employee_salary
left join employees 
on employee_salary.employee_id = employees.id where employees.id is null;

-- ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select * from employee_salary
left join employees 
on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
where employees.id is null and salary.monthly_salary < 2000;

-- ����� ���� ���������� ���� �� ��������� ��.
select * from employees left join employee_salary
on employees.id = employee_salary.employee_id where employee_salary.salary_id is null;

-- ������� ���� ���������� � ���������� �� ���������.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id;

-- ������� ����� � ��������� ������ Java �������������.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id 
where roles.role_name like '%Java developer%';

-- ������� ����� � ��������� ������ Python �������������.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Python developer%';

--  ������� ����� � ��������� ���� QA ���������.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA engineer%';

-- ������� ����� � ��������� ������ QA ���������.
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Manual QA engineer%';

-- ������� ����� � ��������� ��������������� QA
select employees.id, employees.employee_name, roles.role_name from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Automation QA engineer%';

-- ������� ����� � �������� Junior ������������
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Junior%';

-- ������� ����� � �������� Middle ������������
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Middle%';

-- ������� ����� � �������� Senior ������������
select employees.id, employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Senior%';

-- ������� �������� Java �������������
select roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Java developer%';

-- ������� �������� Python �������������
select roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Python developer%';

-- ������� ����� � �������� Junior Python �������������
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name = 'Junior Python developer';

-- ������� ����� � �������� Middle JS �������������
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name = 'Middle JavaScript developer';

-- ������� ����� � �������� Senior Java �������������
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name = 'Senior Java developer';

-- ������� �������� Junior QA ���������
select roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like 'Junior % QA engineer';

-- ������� ������� �������� ���� Junior ������������
select AVG(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%Junior%';

-- ������� ����� ������� JS �������������
select SUM(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%JavaScript developer%';

-- ������� ����������� �� QA ���������
select MIN(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%QA engineer%';

-- ������� ������������ �� QA ���������
select MAX(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%QA engineer%';

-- ������� ���������� QA ���������
select COUNT(roles.role_name) from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%QA engineer%';

-- ������� ���������� Middle ������������
select COUNT(roles.role_name) from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%Middle%';

-- ������� ���������� �������������
select COUNT(roles.role_name) from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
where roles.role_name like '%developer%';

-- ������� ���� (�����) �������� �������������.
select SUM(salary.monthly_salary) from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where roles.role_name like '%developer%';

-- ������� �����, ��������� � �� ���� ������������ �� �����������
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id 
order by employees.employee_name, roles.role_name, salary.monthly_salary;

-- ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where salary.monthly_salary between 1700 and 2300
order by employees.employee_name, roles.role_name, salary.monthly_salary;

-- ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where salary.monthly_salary < 2300
order by employees.employee_name, roles.role_name, salary.monthly_salary;

-- ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary from employees
join roles_employee
on employees.id = roles_employee.employee_id
join roles on roles_employee.role_id = roles.id
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id where salary.monthly_salary in (1100, 1500, 2000)
order by employees.employee_name, roles.role_name, salary.monthly_salary;