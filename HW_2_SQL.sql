-- SQL_HW_2

-- Первая часть (DDL)

-- Таблица employees
-- 1.	Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
-- 2.	Наполнить таблицу employee 70 строками.
create table employees (
id serial primary key,
employee_name varchar(50) not null);
insert into employees(employee_name) values ('Andrey_1'), ('Sergey_1'), ('Ilya_1'), ('Max_1'), ('Anna_1'), ('Misha_1'), ('Alex_1'), 
('Andrey_2'), ('Sergey_2'), ('Ilya_2'), ('Max_2'), ('Anna_2'), ('Misha_2'), ('Alex_2'),
('Andrey_3'), ('Sergey_3'), ('Ilya_3'), ('Max_3'), ('Anna_3'), ('Misha_3'), ('Alex_3'),
('Andrey_4'), ('Sergey_4'), ('Ilya_4'), ('Max_4'), ('Anna_4'), ('Misha_4'), ('Alex_4'),
('Andrey_5'), ('Sergey_5'), ('Ilya_5'), ('Max_5'), ('Anna_5'), ('Misha_5'), ('Alex_5'),
('Andrey_6'), ('Sergey_6'), ('Ilya_6'), ('Max_6'), ('Anna_6'), ('Misha_6'), ('Alex_6'),
('Andrey_7'), ('Sergey_7'), ('Ilya_7'), ('Max_7'), ('Anna_7'), ('Misha_7'), ('Alex_7'),
('Andrey_8'), ('Sergey_8'), ('Ilya_8'), ('Max_8'), ('Anna_8'), ('Misha_8'), ('Alex_8'),
('Andrey_9'), ('Sergey_9'), ('Ilya_9'), ('Max_9'), ('Anna_9'), ('Misha_9'), ('Alex_9'),
('Andrey_10'), ('Sergey_10'), ('Ilya_10'), ('Max_10'), ('Anna_10'), ('Misha_10'), ('Alex_10');
select count(employee_name) from employees;

-- Таблица salary
-- 3.	Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
-- 4.	Наполнить таблицу salary 16 строками:
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500
create table salary (
id serial primary key,
monthly_salary int not null);
insert into salary(monthly_salary) values (1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800),
(1900), (2000), (2100), (2200), (2300), (2400), (2500);
select count(monthly_salary) from salary;

-- Таблица employee_salary
-- 5.	Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
-- 6.	Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id
create table employee_salary (
id serial primary key,
employee_id int not null unique,
salary_id int not null);
insert into employee_salary(employee_id, salary_id) values (5,1), (10,2), (15,3), (20,4),
(25,5), (30,6), (35,2), (40,8),
(45,7), (50,15), (55,9), (60,8),
(65,10), (70,15), (22,9), (23,8),
(27,1), (26,15), (31,2), (24,13),
(29,12), (32,14), (33,16), (34,16),
(36,10), (37,15), (38,2), (39,5),
(41,11), (42,15), (73,5), (77,8),
(78,7), (79,11), (81,11), (84,8),
(89,10), (99,12), (101,9), (103,3);
select count(id) from employee_salary; -- проверка на кол-во строк в таблице employee_salary
select count(employee_salary.employee_id) as count_employee_id_equals_count_id from employee_salary join employees on employee_salary.employee_id = employees.id; -- проверка на кол-во повторяющихся строк

-- Таблица roles
-- 7.	Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
-- 8.	Поменять тип столба role_name с int на varchar(30)
-- 9.	Наполнить таблицу roles 20 строками:
create table roles ( 
id serial primary key,
role_name int not null unique);
alter table roles alter column role_name type varchar(30);
insert into roles(role_name) values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
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
select * from roles;

-- Таблица roles_employee
-- 10.	Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
-- 11.	Наполнить таблицу roles_employee 40 строками:
create table roles_employee (
id serial primary key,
employee_id int not null,
role_id int not null,
foreign key (role_id)
references roles(id),
foreign key (employee_id)
references employees(id)
);
insert into roles_employee (employee_id, role_id) values (7,2),
(20,4),
(3,9),
(5,13),
(23,4),
(11,2),
(10,9),
(22,12),
(21,3),
(34,4),
(6,7),
(24,13),
(25,14),
(26,11),
(27,10),
(28,9),
(29,8),
(30,7),
(31,6),
(32,4),
(33,5),
(36,3),
(69,2),
(63,1),
(54,19),
(37,19),
(38,18),
(39,20),
(1,10),
(2,9),
(9,4),
(55,5),
(45,6),
(44,7),
(49,5),
(67,4),
(19,3),
(17,2),
(13,11),
(68,2);
select count(id) from roles_employee ;-- проверка на кол-во строк в таблице roles_employee

-- Вторая часть (JOINS)

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select salary.monthly_salary as Зарплаты, employees.employee_name as Работники from employee_salary 
join salary on salary.id = employee_salary.salary_id 
join employees on employees.id = employee_salary.employee_id;
-- 2. Вывести всех работников у которых ЗП меньше 2000.
select salary.monthly_salary as Зарплата, employees.employee_name as Работники_чья_зп_больше_2000 from employee_salary 
join salary on employee_salary.salary_id = salary.id 
join employees on employee_salary.employee_id = employees.id where salary.monthly_salary > 2000;
-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary as Зарплата, employees.employee_name as Неназначенный_работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
left join employees on employees.id = employee_salary.employee_id where employee_salary.employee_id not in (select id from  employees);
-- *3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary as Зарплата, employees.employee_name as Неназначенный_работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
left join employees on employees.id = employee_salary.employee_id where employees.employee_name is null;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary as Зарплата, employees.employee_name as Неназначенный_работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
left join employees on employees.id = employee_salary.employee_id where employee_salary.employee_id not in (select id from  employees) and salary.monthly_salary < 2000;
-- 5. Найти всех работников кому не начислена ЗП.
select salary.monthly_salary as Неназначенная_ЗП, employees.employee_name as Работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
right join employees on employees.id = employee_salary.employee_id where employees.id not in (select employee_id from employee_salary) ;
-- *5. Найти всех работников кому не начислена ЗП.
select salary.monthly_salary as NA_ЗП, employees.employee_name as Работник from employee_salary 
join salary on employee_salary.salary_id = salary.id 
right join employees on employee_salary.employee_id = employees.id where salary.monthly_salary is null;
-- 6. Вывести всех работников с названиями их должности.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id;
-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Java_d%';
-- 8. Вывести имена и должность только Python разработчиков.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Python%';
-- 9. Вывести имена и должность всех QA инженеров.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Manual_QA%';
-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name as Имя, roles.role_name as Должность from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%Automation_QA%';
-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id  where roles.role_name like '%Junior%' ;
-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id 
left join employee_salary on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id  where roles.role_name like '%Middle%' ;
-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from roles_employee 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id 
left join employee_salary on employee_salary.employee_id  = roles_employee.employee_id  
left join salary on salary.id = employee_salary.salary_id where roles.role_name  like '%Senior%';
-- 15. Вывести зарплаты Java разработчиков
select roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id where roles.role_name like '%Java_d%';
-- 16. Вывести зарплаты Python разработчиков
select roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id where roles.role_name like '%Python%';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Junior_Python%';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Middle_JavaScript%';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Senior_Java_d%';
-- 20. Вывести зарплаты Junior QA инженеров
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Junior%QA%';
-- 21. Вывести среднюю зарплату всех Junior специалистов
select round(avg(salary.monthly_salary), 1) as Средняя_Зарплата from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) as Сумма_Зарплат from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
select min(salary.monthly_salary) as Сумма_Зарплат from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 24. Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary) as Сумма_Зарплат from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 25. Вывести количество QA инженеров
select count(roles.id) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%QA%';
-- 26. Вывести количество Middle специалистов.
select count(roles.id) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like 'Middle%';
-- 27. Вывести количество разработчиков
select count(roles.id) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%developer';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) from employee_salary 
right join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
left join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where roles.role_name like '%developer';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id order by Зарплата ;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where salary.monthly_salary between 1700 and 2300 order by Зарплата ;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where salary.monthly_salary < 2300 order by Зарплата ;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name as Имя, roles.role_name as Должность, salary.monthly_salary as Зарплата from employee_salary 
join roles_employee on employee_salary.employee_id = roles_employee.employee_id 
join salary on salary.id = employee_salary.salary_id 
join roles on roles.id = roles_employee.role_id 
join employees on employees.id = roles_employee.employee_id where salary.monthly_salary in (1100, 1500, 2000) order by Зарплата ;