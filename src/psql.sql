skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Dmitrii    | Gienko    | male   |  39
  2 | Nata       | Shoma     | female |  34
  3 | Alena      | Kylemina  | female |  18
  4 | Valeriy    | Wilgelms  | male   |  60
  5 | Ekaterina  | Xrushina  | female |  20
(5 строк)


skypro=# SELECT first_name AS Имя,
                skypro-# last_name AS Фамилия
skypro-# FROM employee;
Имя    | Фамилия
-----------+----------
 Dmitrii   | Gienko
 Nata      | Shoma
 Alena     | Kylemina
 Valeriy   | Wilgelms
 Ekaterina | Xrushina
(5 строк)


skypro=# SELECT * FROM employee
skypro-# WHERE age < 30 OR age > 50;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Alena      | Kylemina  | female |  18
  4 | Valeriy    | Wilgelms  | male   |  60
  5 | Ekaterina  | Xrushina  | female |  20
(3 строки)


skypro=# SELECT * FROM employee
skypro-# WHERE age BETWEEN 30 AND 50;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Dmitrii    | Gienko    | male   |  39
  2 | Nata       | Shoma     | female |  34
(2 строки)


skypro=# SELECT * FROM employee
skypro-# ORDER BY last_name DESC;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Ekaterina  | Xrushina  | female |  20
  4 | Valeriy    | Wilgelms  | male   |  60
  2 | Nata       | Shoma     | female |  34
  3 | Alena      | Kylemina  | female |  18
  1 | Dmitrii    | Gienko    | male   |  39
(5 строк)


skypro=# SELECT * FROM employee WHERE first_name LIKE '%_____%';
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Dmitrii    | Gienko    | male   |  39
  3 | Alena      | Kylemina  | female |  18
  4 | Valeriy    | Wilgelms  | male   |  60
  5 | Ekaterina  | Xrushina  | female |  20
(4 строки)


skypro=# UPDATE employee SET first_name = 'Dmitrii' WHERE id=4;
UPDATE 1
skypro=# UPDATE employee SET first_name = 'Nata' WHERE id=3;
UPDATE 1
    skypro=# SELECT * FROM employee;
id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Dmitrii    | Gienko    | male   |  39
  2 | Nata       | Shoma     | female |  34
  5 | Ekaterina  | Xrushina  | female |  20
  4 | Dmitrii    | Wilgelms  | male   |  60
  3 | Nata       | Kylemina  | female |  18
(5 строк)


skypro=# SELECT first_name AS Имя,
skypro-# SUM (age) AS Суммарный_возраст
skypro-# FROM employee GROUP BY Имя;
Имя    | Суммарный_возраст
-----------+-------------------
 Ekaterina |                20
 Dmitrii   |                99
 Nata      |                52
(3 строки)


skypro=# SELECT first_name AS Имя,
skypro-# age AS Возраст
skypro-# FROM employee
skypro-# WHERE age = (SELECT MIN(age) FROM employee);
Имя  | Возраст
------+---------
 Nata |      18
(1 строка)


