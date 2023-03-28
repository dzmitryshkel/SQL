CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  employee_name VARCHAR(50) NOT NULL
);

INSERT INTO employees (employee_name) 
VALUES 
('Дмитрий'),
('Дима'),
('Дмитро'),
('Дзмитрий'),
('Платон'),
('Платоша'),
('Мария'),
('Маша'),
('Марина'),
('Маринэ'),
('Карина'),
('Каринэ'),
('Карла'),
('Карл'),
('Карлос'),
('Катерина'),
('Катя'),
('Екатерина'),
('Катрин'),
('Катрина'),
('Ирина'),
('Ирене'),
('Ира'),
('Андрей'),
('Эндрю'),
('Никита'),
('Ник'),
('Нека'),
('Таня'),
('Татьяна'),
('Таццяна'),
('Татсиана'),
('Света'),
('Светлана'),
('Свитлана'),
('Лана'),
('Вета'),
('Виталина'),
('Арсений'),
('Сеня'),
('Семен'),
('Руслан'),
('Зина'),
('Зинаида'),
('Евгений'),
('Евгения'),
('Евген'),
('Женя'),
('Дамир'),
('Леша'),
('Алексей'),
('Алекс'),
('Лекс'),
('Лекса'),
('Даниил'),
('Данил'),
('Даня'),
('Даник'),
('Алина'),
('Марта'),
('Юля'),
('Юлия'),
('Джули'),
('Джулия'),
('Лаура'),
('Тим'),
('Тима'),
('Тимофей'),
('Ганс'),
('Лина');

CREATE TABLE salary (
  id SERIAL PRIMARY KEY,
  monthly_salary int NOT NULL
);

INSERT INTO salary (monthly_salary) 
VALUES 
('1000'),
('1100'),
('1200'),
('1300'),
('1400'),
('1500'),
('1600'),
('1700'),
('1800'),
('1900'),
('2000'),
('2100'),
('2200'),
('2300'),
('2400'),
('2500'),
('2600')

create table employee_salary (
id SERIAL  primary key,
employee_id Int not null unique,
salary_id Int not null
);

INSERT INTO employee_salary (employee_id, salary_id)
VALUES
 (3, 7),
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
  (37, 4),
  (12, 2),
  (19, 10),
  (43, 13),
  (70, 15),
  (6, 16),
  (17, 2),
  (2, 5),
  (64, 8),
  (67, 3),
  (54, 6),
  (8, 11),
  (30, 12),
  (13, 14),
  (7, 16),
  (31, 8),
  (42, 13),
  (25, 2),
  (9, 5),
  (80, 10),
  (81, 1),
  (82, 7),
  (83, 16),
  (84, 3),
  (85, 12),
  (86, 11),
  (87, 14),
  (88, 6),
  (89, 15);
  
CREATE TABLE roles (
id SERIAL PRIMARY KEY,
role_name INT NOT NULL UNIQUE
);

ALTER TABLE roles
ALTER COLUMN role_name TYPE VARCHAR(30);

INSERT INTO roles (role_name) VALUES
( 'Junior Python developer' ),
( 'Middle Python developer' ),
( 'Senior Python developer' ),
( 'Junior Java developer' ),
( 'Middle Java developer' ),
( 'Senior Java developer' ),
( 'Junior JavaScript developer' ),
( 'Middle JavaScript developer' ),
( 'Senior JavaScript developer' ),
( 'Junior Manual QA engineer' ),
( 'Middle Manual QA engineer' ),
( 'Senior Manual QA engineer' ),
( 'Project Manager' ),
( 'Designer' ),
( 'HR' ),
( 'CEO' ),
( 'Sales manager' ),
( 'Junior Automation QA engineer' ),
( 'Middle Automation QA engineer' ),
( 'Senior Automation QA engineer' );

CREATE TABLE roles_employee(
  id serial PRIMARY KEY,
  employee_id INT NOT null UNIQUE,
  role_id INT NOT NULL,
  FOREIGN KEY (employee_id)
    REFERENCES employees (id),
  FOREIGN KEY (role_id)
    REFERENCES roles (id)
);

INSERT INTO roles_employee (employee_id, role_id) VALUES
(1, 1), (2, 1), (3, 9), (4, 10), (5, 16),
(6, 2), (7, 11), (8, 11), (9, 10), (10, 10),
(11, 3), (12, 13), (13, 15), (14, 3), (15, 9),
(16, 14), (17, 4), (18, 4), (19, 15), (20, 4),
(21, 5), (22, 14), (23, 18), (24, 5), (25, 5),
(26, 15), (27, 17), (28, 16), (29, 6), (30, 11),
(31, 7), (32, 7), (33, 16), (34, 7), (35, 7),
(36, 12), (37, 15), (38, 12), (39, 8), (40, 9);

