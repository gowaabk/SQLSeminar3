CREATE DATABASE IF NOT EXISTS lesson3;

USE lesson3;
# 'sql', "sql"
# `ё на англ.раскладке` - выделяются названия таблиц, столбцов и БД
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `firstname` VARCHAR(45),
    `lastname` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
); 

INSERT INTO `staff` (`firstname`,  `lastname`, `post`,`seniority`,`salary`, `age`)
VALUES
		('Вася', 'Васькин', 'Начальник', 40, 100000, 60), -- id = 1
		('Петр', 'Власов', 'Начальник', 8, 70000, 30),
		('Катя', 'Катина', 'Инженер', 2, 70000, 25),
		('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
		('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
		('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
		('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
		('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
		('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
		('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
		('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
		('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
        
SELECT * FROM staff;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
-- возрастание
SELECT * FROM staff
ORDER BY salary;

-- убывание
SELECT * FROM staff
ORDER BY salary DESC;

-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post)
--  «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT post, COUNT(*) AS AllWorkers FROM staff
WHERE post = "Рабочий" AND age>=24 AND age <=49;

-- 5. Найдите количество специальностей
SELECT post, COUNT(*) AS Total FROM staff
GROUP BY post;

SELECT COUNT(*) AS Total FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников
-- меньше 30 лет 
SELECT post,AVG(age) AS avg_age FROM staff
GROUP BY post
HAVING AVG(age)>30;