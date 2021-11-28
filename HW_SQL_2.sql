-- Создать таблицу employees, Наполнить таблицу employee 70 строками.
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

insert into employees(employee_name)
values ('Nicholas Nelson'),
	('Donald Mitchell'),
	('Annie Jackson'),
	('George Brown'),
	('Bradley Taylor'),
	('Norman Hicks'),
	('James Frank'),
	('Fernando Burns'),
	('Naomi Reynolds'),
	('June Garcia'),
	('Brenda Griffin'),
	('Beth Woods'),
	('Maria Smith'),
	('Patrick Smith'),
	('Eva Jones'),
	('Manuel Austin'),
	('James Lane'),
	('James Jones'),
	('Richard Holmes'),
	('Barbara Moore'),
	('Teresa Taylor'),
	('Jeanette Phelps'),
	('June Johnson'),
	('Christopher Little'),
	('Nancy Marsh'),
	('Allen Ray'),
	('Troy Lane'),
	('Marian Patterson'),
	('Theodore Richardson'),
	('Julie Guzman'),
	('Karen Wood'),
	('Gloria Garcia'),
	('Tara Johnson'),
	('Justin Owens'),
	('Yolanda Watson'),
	('Anita Johnson'),
	('Alice Martin'),
	('Dennis Spencer'),
	('Todd Lewis'),
	('Crystal Mitchell'),
	('Joseph Bryant'),
	('Erik Robinson'),
	('Phyllis Oliver'),
	('Marcus Brewer'),
	('Charles Peterson'),
	('Geraldine Green'),
	('Joseph Palmer'),
	('Arnold Harris'),
	('Pamela White'),
	('Sarah Ward'),
	('William Hernandez'),
	('Gary Foster'),
	('Cody Carson'),
	('Bobby Green'),
	('Andrew Thompson'),
	('Alan Jones'),
	('Steven White'),
	('Dana Smith'),
	('Margie Watkins'),
	('Reginald Clark'),
	('Steven Robinson'),
	('William Sanchez'),
	('Cynthia Stephens'),
	('Rene Johnston'),
	('David White'),
	('Henry Smith'),
	('Christy Diaz'),
	('Jack Owens'),
	('Sheila Marshall'),
	('Olga Singleton');
	
-- Создать таблицу salary Наполнить таблицу salary 15 строками
create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;

insert into salary(monthly_salary)
values (1000),
	   (1100),
	   (1200),
	   (1300),
	   (1400),
	   (1500),
	   (1600),
	   (1700),
	   (1800),
	   (1900),
	   (2000),
	   (2100),
	   (2200),
	   (2300),
	   (2400),
	   (2500);

-- Создать таблицу employee_salary Наполнить таблицу employee_salary 40 строками:
create table employee_salary(
	id serial primary key,
	employee_id int unique not null,
	salary_id int not null
);

select * from employee_salary;

insert into employee_salary(employee_id, salary_id)
values (3, 7),
	   (1, 4),
	   (5, 9),
	   (40, 13),
	   (23, 4),
	   (11, 2),
	   (52, 10),
	   (15, 13),
	   (26, 4),
	   (16, 1),
	   (33, 7),
	   (2, 15),
	   (4, 14),
	   (6, 1),
	   (7, 2),
	   (8, 3),
	   (9, 4),
	   (10, 5),
	   (12, 6),
	   (13, 7),
	   (14, 12),
	   (17, 13),
	   (18, 10),
	   (19, 7),
	   (20, 15),
	   (21, 8),
	   (22, 3),
	   (24, 2),
	   (25, 6),
	   (30, 9),
	   (71, 2),
	   (72, 14),
	   (73, 10),
	   (74, 7),
	   (75, 8),
	   (76, 6),
	   (77, 11),
	   (78, 3),
	   (79, 2),
	   (80, 15);
	  
-- Создать таблицу roles Поменять тип столба role_name с int на varchar(30) Наполнить таблицу roles 20 строками:
create table roles(
	id serial primary key,
	role_name int unique not null
	);

select * from roles;

alter table roles alter column role_name varchar(30);

insert into roles (role_name)
values ('Junior Python developer');

insert into roles (role_name)
values ('Middle Python developer');

insert into roles (role_name)
values ('Senior Python developer'),
	('Junior Java developer'),
	('Middle Java developer'),
	('Senior Java developer'),
	('Junior JavaScript developer'),
	('Middle JavaScript developer'),
	('Senior JavaScript developer'),
	('Junior Manual QA engineer'),
	('Middle Manual QA engineer'),
	('Senior Manual QA engineer'),
	('Project Manager'),
	('Designer'),
	('HR'),
	('CEO'),
	('Sales manager'),
	('Junior Automation QA engineer'),
	('Middle Automation QA engineer'),
	('Senior Automation QA engineer');

-- Создать таблицу roles_employee- id. Serial  primary key,- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)- role_id. Int, not null (внешний ключ для таблицы roles, поле id)Наполнить таблицу roles_employee 40 строками:

create table roles_employee(
	id serial primary key,
	employee_id int unique not null,
	role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
	);

select * from roles_employee;

insert into roles_employee(employee_id, role_id) 
values (7, 20),
	(20, 4),
	(3, 9),
	(5, 13),
	(23, 4),
	(11, 2),
	(10, 9),
	(22, 13),
	(21, 3),
	(34, 4),
	(6, 7),
	(1, 1),
	(4, 10),
	(9, 5),
	(13, 6),
	(19, 8),
	(27, 11),
	(29, 12),
	(31, 14),
	(36, 15),
	(39, 16),
	(42, 17),
	(46, 18),
	(49, 19),
	(52, 6),
	(55, 15),
	(57, 7),
	(70, 2),
	(67, 9),
	(66, 17),
	(60, 6),
	(53, 7),
	(40, 4),
	(63, 5),
	(45, 13),
	(69, 19),
	(15, 19),
	(24, 7),
	(17, 6),
	(37, 11);
	   
	   
	   
	   
	   