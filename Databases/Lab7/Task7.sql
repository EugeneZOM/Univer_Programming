CREATE PROCEDURE `t1`() SELECT b.title, b.cost, p.name, f.value FROM book b, publisher p, format f WHERE b.publisher_id = p.id AND b.format_id = f.id;
CREATE PROCEDURE `t2`() SELECT t.name, c.name, b.title, p.name FROM book b, category c, theme t, publisher p WHERE b.publisher_id = p.id AND b.category_id = c.id AND b.theme_id = t.id ORDER BY t.name, c.name;
CREATE PROCEDURE `t3`() SELECT b.title FROM book b, publisher p WHERE p.id = b.publisher_id AND YEAR(b.date) >= 2000 AND p.name = "BHV С.-Петербург";
CREATE PROCEDURE `t4`() SELECT sum(b.pages), c.name FROM book b, category c WHERE b.category_id = c.id GROUP BY c.name ORDER BY sum(b.pages);
CREATE PROCEDURE `t5`() SELECT avg(b.cost) FROM book b, theme t, category c WHERE t.id = b.theme_id AND c.id = b.category_id AND t.name = "Використання ПК в цілому" AND c.name = "Linux";

CREATE PROCEDURE `t7`() SELECT b1.title, b2.title FROM book b1, book b2 WHERE b1.pages = b2.pages AND b1.title != b2.title;
CREATE PROCEDURE `t8`() SELECT b1.title, b2.title, b3.title FROM book b1, book b2, book b3 WHERE b1.cost = b2.cost AND b2.cost = b3.cost AND b1.title != b2.title AND b2.title != b3.title AND b1.title != b3.title;
CREATE PROCEDURE `t9`() SELECT b.title FROM book b, (SELECT id FROM category c WHERE c.name = "C & C ++") as r WHERE b.category_id = r.id;
CREATE PROCEDURE `t10`() SELECT p.name FROM publisher p, (SELECT sum(b.pages) as pages, b.publisher_id FROM book b GROUP BY b.publisher_id) as r WHERE r.publisher_id = p.id AND r.pages >= 400;
CREATE PROCEDURE `t11`() SELECT c.name FROM category c, (SELECT count(b.id) as amount, b.category_id FROM book b GROUP by b.category_id) as r WHERE r.category_id = c.id AND amount >= 3;
CREATE PROCEDURE `t12`() SELECT b.title FROM book b WHERE EXISTS (SELECT p.id FROM publisher p WHERE p.name = "BHV С.-Петербург" AND p.id = b.publisher_id);

CREATE PROCEDURE `t14`() SELECT c.name FROM category c UNION SELECT t.name FROM theme t ORDER BY name;
CREATE PROCEDURE `t15`() SELECT SUBSTRING_INDEX(`name`, ' ', 1) as fword FROM category UNION SELECT SUBSTRING_INDEX(`title`, ' ', 1) as fword FROM book ORDER BY fword;
