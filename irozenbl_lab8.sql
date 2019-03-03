CREATE TABLE bookcase
(
bcid INT AUTO_INCREMENT,
location VARCHAR(15) NOT NULL,
shelf_num INT NOT NULL,
capacity INT,
PRIMARY KEY (bcid))
Engine = innodb;

CREATE TABLE book_bookcase
(
bookid INT NOT NULL,
qty INT NOT NULL,
bcid INT NOT NULL,
FOREIGN KEY (bookid) REFERENCES book(bookid),
FOREIGN KEY (bcid) REFERENCES bookcase(bcid)
)
Engine = innodb;

INSERT INTO bookcase (bcid, location, shelf_num, capacity)
VALUES (100, "room 303", 6, 50), (101, "room 201", 5, 50),
(102, "room 201", 6, 25), (103, "room 303", 5, 20);

INSERT INTO book_bookcase(bookid, qty, bcid)
VALUES (1001, 277, 100), (1001, 200, 101), (1002, 22, 101), (1002, 141, 102), (1003, 74, 103);

/* 1) */
SELECT DISTINCT c.name, b.title
FROM customer as c, book as b, trans as t
WHERE t.id = c.id AND t.bookid = b.bookid
AND t.tdate BETWEEN "2017-10-01" AND "2017-10-31";

/* 2) */
SELECT b.title, sum(x.qty)
FROM book as b, book_bookcase as x
WHERE b.bookid = x.bookid
GROUP BY b.title;

/* 3) */
UPDATE customer
SET phone = '999-867-5309'
WHERE name='Jenny';

/* 4) */
ALTER TABLE book
ADD type VARCHAR(15) NOT NULL;

UPDATE book
SET type = "hardcover"
WHERE book.title = "The Code Book";

UPDATE book
SET type = "paperback"
WHERE book.title = "Core Web Programming";

UPDATE book
SET type = "ebook"
WHERE book.title = "The Hacker Ethic";






