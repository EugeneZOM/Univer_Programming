SELECT b.title, b.cost, p.name FROM book b, publisher p WHERE p.id = b.publisher_id;
SELECT b.title, c.name FROM book b INNER JOIN category c ON c.id = b.category_id;
SELECT b.title, b.cost, p.name, f.value FROM book b, publisher p, format f WHERE b.publisher_id = p.id AND f.id = b.format_id;
SELECT t.name, c.name, b.title, p.name FROM book b, theme t, category c, publisher p WHERE b.category_id = c.id AND b.theme_id = t.id AND b.publisher_id = p.id ORDER BY t.name, c.name;
SELECT b.title FROM book b, publisher p WHERE p.id = b.publisher_id AND YEAR(b.date) >= 2000 AND p.name = "BHV С.-Петербург";
SELECT sum(b.pages), c.name FROM book b, category c WHERE b.category_id = c.id GROUP BY c.name ORDER BY sum(b.pages) DESC;
SELECT avg(b.cost) FROM book b, theme t, category c WHERE t.id = b.theme_id AND c.id = b.category_id AND t.name = "Використання ПК в цілому" AND c.name = "Linux";



SELECT b1.title, b2.title FROM book b1, book b2 WHERE b1.pages = b2.pages AND b1.title != b2.title;
SELECT b1.title, b2.title, b3.title FROM book b1, book b2, book b3 WHERE b1.cost = b2.cost AND b2.cost = b3.cost AND b1.title != b2.title AND b2.title != b3.title AND b1.title != b3.title;
SELECT b.title FROM book b, (SELECT id FROM category c WHERE c.name = "C & C ++") as r WHERE b.category_id = r.id;
SELECT b.title FROM book b, (SELECT id FROM publisher p WHERE p.name = "BHV С.-Петербург") as r WHERE b.publisher_id = r.id AND YEAR(b.date) >= 2000;
SELECT p.name FROM publisher p, (SELECT sum(b.pages) as pages, b.publisher_id FROM book b GROUP BY b.publisher_id) as r WHERE r.publisher_id = p.id AND r.pages >= 400;
SELECT c.name FROM category c, (SELECT count(b.id) as amount, b.category_id FROM book b GROUP by b.category_id) as r WHERE r.category_id = c.id AND amount >= 3;
SELECT b.title FROM book b WHERE EXISTS (SELECT p.id FROM publisher p WHERE p.name = "BHV С.-Петербург" AND p.id = b.publisher_id);

SELECT c.name FROM category c UNION SELECT t.name FROM theme t ORDER BY name;
SELECT SUBSTRING_INDEX(`name`, ' ', 1) as fword FROM category UNION SELECT SUBSTRING_INDEX(`title`, ' ', 1) as fword FROM book ORDER BY fword;
