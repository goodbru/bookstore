Exercise 1

SELECT e.isbn FROM editions AS e INNER JOIN publishers AS p ON p.id = e.publisher_id WHERE p.name = 'Random House';

Exercise 2

SELECT e.isbn, b.title FROM editions AS e INNER JOIN publishers AS p ON p.id = e.publisher_id INNER JOIN books as b ON b.id = e.book_id WHERE p.name = 'Random House';

Exercise 3

SELECT e.isbn, b.title, s.stock, s.retail FROM editions AS e INNER JOIN publishers AS p ON p.id = e.publisher_id INNER JOIN books as b ON b.id = e.book_id INNER JOIN stock as s ON s.isbn = e.isbn WHERE p.name = 'Random House';

Exercise 4

SELECT e.isbn, b.title, s.stock, s.retail FROM editions AS e INNER JOIN publishers AS p ON p.id = e.publisher_id INNER JOIN books as b ON b.id = e.book_id INNER JOIN stock as s ON s.isbn = e.isbn WHERE p.name = 'Random House' AND s.stock > 0;

Exercise 5

SELECT e.isbn, b.title, s.stock, s.retail,
CASE WHEN e.type = 'h' THEN 'Hardcover'
     WHEN e.type = 'p' THEN 'Paperback'
END AS type
FROM editions AS e 
INNER JOIN publishers AS p ON p.id = e.publisher_id 
INNER JOIN books as b ON b.id = e.book_id 
INNER JOIN stock as s ON s.isbn = e.isbn 
WHERE p.name = 'Random House' AND s.stock > 0;

Exercise 6

SELECT b.title, e.publication 
FROM editions AS e
RIGHT OUTER JOIN books AS b ON b.id = e.book_id

Exercise 7 

SELECT sum(stock) FROM stock;

Exercise 8

SELECT avg(cost) AS "Average Cost", 
       avg(retail) AS "Average Retail",
       avg(retail-cost) AS "Average Profit"
       FROM stock;

Exercise 9

SELECT sum(s.stock) AS total, e.book_id
FROM stock AS s
JOIN editions AS e ON s.isbn = e.isbn
GROUP BY e.book_id
ORDER BY total DESC
LIMIT 1;


Exercise 10

SELECT b.author_id, (a.first_name, a.last_name) AS full_name, count(*)
FROM authors AS a
JOIN books AS b ON a.id = b.author_id
GROUP BY b.author_id, a.first_name, a.last_name
;

Exercise 11

SELECT b.author_id, (a.first_name, a.last_name) AS full_name, count(*)
FROM authors AS a
JOIN books AS b ON a.id = b.author_id
GROUP BY b.author_id, a.first_name, a.last_name
ORDER BY count(*) DESC
;