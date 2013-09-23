--Matthew Musich
--Septemeber 22th, 2013
--Queries HW 2

--Q 1
SELECT
city
FROM
agents,
orders
WHERE 
agents.aid = orders.aid AND
orders.cid = 'c002';

--Q 2
SELECT 
orders.pid
FROM 
orders
WHERE 
orders.aid IN
	(SELECT distinct 
	 orders.aid
	FROM 
	 orders, customers 
	WHERE 
	 orders.cid = customers.cid AND 
	 customers.city = 'Kyoto');


--Q 3
SELECT
cid, name
FROM
customers
WHERE
cid NOT IN
	(SELECT 
	 orders.cid
	FROM 
	 orders
	WHERE 
	 orders.aid = 'a03');

--Q 4
SELECT distinct 
customers.cid, name
FROM 
customers , orders 
WHERE 
customers.cid = orders.cid AND 
orders.pid = 'p01' AND EXISTS
	(SELECT
	  orders.cid
	 FROM 
	  orders o
	 WHERE 
	  o.pid = 'p07' AND 
	  o.cid = orders.cid);


--Q 5
SELECT 
orders.pid
FROM 
orders
WHERE 
orders.cid IN 
	(SELECT 
	 orders.cid
	FROM 
	 orders 
	WHERE 
	 orders.aid = 'a03');


--Q 6
SELECT distinct 
customers.name, customers.discount
FROM 
customers , orders , agents 
WHERE 
customers.cid = orders.cid AND 
orders.aid = agents.aid AND 
  (agents.city = 'Dallas' OR 
   agents.city = 'Duluth');


--Q 7
SELECT 
name
FROM 
customers
WHERE 
discount IN 
	(SELECT 
	 discount 
	FROM 
	 customers
	WHERE 
	 city = 'Dallas' OR 
	 city = 'Kyoto');
