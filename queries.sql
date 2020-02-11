-- � ��������� ������� ������� �������, ��-�� ���������� ������ � ����, �������� � ������ ������,
-- ������ 500$ ����������� 1100$

-- 1 ������� ����� ������, �������� � ������ �������� ����� ��� ���� �� ���������� ����� 500 ���. �������: model, speed � hd
use computerdb;
SELECT model, speed, hdd FROM computerdb.pc WHERE price <= 1100;

-- 2  ������� �������������� ���������. �������: maker
use computerdb;
SELECT product.maker FROM product INNER JOIN printer ON product.model = printer.model;

-- 3 ������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���.
use computerdb;
SELECT model, ram, screen FROM laptop WHERE price > 1000;

-- 4 ������� ��� ������ ������� Printer ��� ������� ���������.
use computerdb;
SELECT * FROM printer Where color = 'y';

-- 5 ������� ����� ������, �������� � ������ �������� ����� ��, ������� 12x ��� 24x CD � ���� ����� 600 ���.
use computerdb;
SELECT model, speed, hdd FROM pc where (cd='40x' || cd='32x') && price <= 1000;

-- 6 ������� ������������� � �������� ��� ��� ��-���������, ������� ����� ������� ���� ������� �� ����� 10 �����.
use computerdb;
SELECT maker, speed, hdd  FROM laptop LEFT JOIN product ON laptop.model = product.model WHERE hdd > 10;

-- 7 ������� ������ ������� � ���� ���� ��������� (������ ����), ���������� �������������� B ( ��������� �����).
use computerdb;
SELECT product.maker, product.model, (ifnull(pc.price,0)+ ifnull(laptop.price,0)+ ifnull(printer.price,0)) AS 'price'
  FROM product
  LEFT JOIN laptop ON product.model = laptop.model
  LEFT JOIN pc ON product.model = pc.model
  LEFT JOIN printer ON product.model = printer.model
  WHERE product.maker LIKE 'A%';

-- 8 ������� �������������, ������������ ��, �� �� ��-��������.
use computerdb;
SELECT maker
 FROM product
 WHERE type!='laptop'
 GROUP BY maker;

-- 9 ������� �������������� �� � ����������� �� ����� 450 ���. �������: Maker
use computerdb;
SELECT product.maker, laptop.model, laptop.speed
 FROM laptop
 LEFT JOIN product ON laptop.model = product.model
 WHERE laptop.speed > 1800;

-- 10 ������� ��������, ������� ����� ������� ����. �������: model, price
use computerdb;
SELECT model, price
 FROM printer
 order by price DESC;

-- 11 ������� ������� �������� ��.
use computerdb;
SELECT AVG(speed) as 'average CPU speed'
 FROM pc;

-- 12 ������� ������� �������� ��-���������, ���� ������� ��������� 1000 ���.
use computerdb;
SELECT AVG(speed) as 'average CPU speed'
 FROM laptop
 WHERE price > 1000;

-- 13 ������� ������� �������� ��, ���������� �������������� A.
use computerdb;
SELECT avg(pc.speed) as 'average PC speed'
 FROM product
 LEFT JOIN pc ON product.model = pc.model 
 WHERE product.maker LIKE "M%";

-- 14 ��� ������� �������� �������� ������� ������� ��������� �� � ����� �� ��������� ����������. �������: ��������, ������� ����
use computerdb;
SELECT pc.speed, AVG(pc.price) AS 'average price'
 FROM pc
 GROUP BY pc.speed;

-- 15 ������� ������� ������� ������, ����������� � ���� � ����� PC. �������: HD
use computerdb;
SELECT S.hdd FROM 
(SELECT pc.hdd, COUNT(*)
 FROM pc
 GROUP BY pc.hdd
 HAVING COUNT(*) > 1) AS S

-- 16 ������� ���� ������� PC, ������� ���������� �������� � RAM. � ���������� ������ ����
-- ����������� ������ ���� ���, �.�. (i,j), �� �� (j,i), ������� ������: ������ � ������� �������,
-- ������ � ������� �������, �������� � RAM
use computerdb;
SELECT t1.code, t1.model, t2.code, t2.model, t1.speed, t1.ram FROM pc AS t1
INNER JOIN pc AS t2 ON (t1.speed = t2.speed AND t1.ram = t2.ram)
WHERE t1.code != t2.code AND t1.code > t2.code

-- 17 ������� ������ ��-���������, �������� ������� ������ �������� ������ �� ��. �������: type, model, speed
use computerdb;
select product.type, laptop.model, laptop.speed
 FROM laptop
 LEFT JOIN product ON laptop.model = product.model;
 WHERE laptop.speed < (SELECT MIN(pc.speed) FROM pc)

-- 18 ������� �������������� ����� ������� ������� ���������. �������: maker, price
use computerdb;
SELECT product.maker
FROM printer
LEFT JOIN product ON (printer.model = product.model)
WHERE printer.price = (SELECT MIN(printer.price) FROM printer) AND printer.color = 'y'

-- 19 ��� ������� ������������� ������� ������� ������ ������ ����������� �� ��-���������.
-- �������: maker, ������� ������ ������.
use computerdb;
SELECT product.maker, AVG(laptop.screen)
 FROM laptop
 LEFT JOIN product ON laptop.model = product.model
 GROUP BY product.maker

-- 20 ������� ��������������, ����������� �� ������� ���� ��� ��������� ������ ��. �������:
-- Maker, ����� �������
use computerdb;
SELECT t1.* FROM
 (SELECT product.maker, COUNT(*) as 'product_count' 
 FROM product
 where product.type = 'PC'
 GROUP BY product.maker) as t1
 WHERE t1.product_count > 3

-- 21 ������� ������������ ���� ��, ����������� ������ ��������������. �������: maker,
-- ������������ ����.
use computerdb;
SELECT t1.maker, MAX(pc.price) FROM
(SELECT product.maker, product.model
 FROM product
 WHERE product.type = 'PC') AS t1
 LEFT JOIN pc ON t1.model = pc.model
 GROUP BY t1.maker;

-- 22 ��� ������� �������� �������� ��, ������������ 600 ���, ���������� ������� ���� �� � �����
-- �� ���������. �������: speed, ������� ����.
use computerdb;
SELECT pc.speed, AVG(pc.price) 
FROM pc
WHERE speed > 600
GROUP BY pc.speed

-- 23 ������� ��������������, ������� ����������� �� ��� �� �� ��������� �� ����� 750 ���, ��� �
-- ��-�������� �� ��������� �� ����� 750 ���. �������: Maker
use computerdb;
 SELECT product.maker  FROM
 (SELECT pc.model ,pc.speed 
 FROM pc
 WHERE speed > 750
 UNION
SELECT laptop.model, laptop.speed
 FROM laptop
 WHERE speed > 750) AS t1
 LEFT JOIN product ON t1.model = product.model
 GROUP BY product.maker

-- 24 ����������� ������ ������� ����� �����, ������� ����� ������� ���� �� ���� ��������� �
-- ���� ������ ���������.
use computerdb;
 SELECT t1.*  FROM
 (SELECT pc.model ,pc.price 
 FROM pc
 UNION
SELECT laptop.model, laptop.price
 FROM laptop
 UNION
 SELECT printer.model, printer.price
 FROM printer
 ) AS t1
 ORDER BY t1.price DESC
 LIMIT 3

-- 25 ������� �������������� ���������, ������� ���������� �� � ���������� ������� RAM � �
-- ����� ������� ����������� ����� ���� ��, ������� ���������� ����� RAM. �������: Maker
use computerdb;
SELECT t2.maker FROM
 (SELECT t1.maker, MIN(t1.RAM), MAX(t1.speed) FROM
 (SELECT product.maker, pc.model, pc.speed, pc.ram
 FROM pc
 LEFT JOIN product ON pc.model = product.model) AS t1
 GROUP BY t1.maker) AS t2
 WHERE t2.maker IN (SELECT t3.maker FROM
(SELECT product.maker
 FROM printer
 LEFT JOIN product ON product.model = printer.model
 GROUP BY product.maker) AS t3)







