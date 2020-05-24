DELIMITER //
# T1
CREATE TRIGGER tr1
BEFORE INSERT ON theme
FOR EACH ROW
BEGIN
	DECLARE amount INT;
    SELECT count(id) INTO amount FROM theme;
    IF amount >= 10 THEN
    	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = "Amount of theme already maximum";
	END IF;
END //

CREATE TRIGGER tr2
BEFORE DELETE ON theme
FOR EACH ROW
BEGIN
	DECLARE amount INT;
    SELECT count(id) INTO amount FROM theme;
    IF amount <= 5 THEN
    	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = "Amount of theme already minimum";
	END IF;
END //

# T2
CREATE TRIGGER tr3
BEFORE UPDATE ON book
FOR EACH ROW
BEGIN
  IF NEW.new == 1 AND YEAR(now()) != YEAR(NEW.date) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book can be new only in current year";
  END IF;
END //

CREATE TRIGGER tr4
BEFORE INSERT ON book
FOR EACH ROW
BEGIN
  IF NEW.new == 1 AND YEAR(now()) != YEAR(NEW.date) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book can be new only in current year";
  END IF;
END //

# T3
CREATE TRIGGER tr5
BEFORE INSERT ON book
FOR EACH ROW
BEGIN
  IF NEW.pages < 100 AND NEW.cost > 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book with less than 100 pages can't cost greater than 10";
  END IF;
  IF NEW.pages < 200 AND NEW.cost > 20 then
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book with less than 200 pages can't cost greater than 20";
  END IF;
  IF NEW.pages < 300 AND NEW.cost > 30 then
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book with less than 300 pages can't cost greater than 30";
  END IF;
END //

CREATE TRIGGER tr6
BEFORE UPDATE ON book
FOR EACH ROW
BEGIN
  IF NEW.pages < 100 AND NEW.cost > 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book with less than 100 pages can't cost greater than 10";
  END IF;
  IF NEW.pages < 200 AND NEW.cost > 20 then
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book with less than 200 pages can't cost greater than 20";
  END IF;
  IF NEW.pages < 300 AND NEW.cost > 30 then
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "Book with less than 300 pages can't cost greater than 30";
  END IF;
END //

# T4
CREATE TRIGGER tr7
BEFORE INSERT ON book
FOR EACH ROW
BEGIN
  DECLARE p1_id INT;
  DECLARE p2_id INT;
  SELECT id FROM publisher WHERE name="BHV С.-Петербург" INTO p1_id;
  SELECT id FROM publisher WHERE name="DiaSoft" INTO p2_id;
  IF NEW.circulation < 5000 AND NEW.publisher_id = p1_id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "BHV publish only with circulation 5000+";
  END IF;
  IF NEW.circulation < 10000 AND NEW.publisher_id = p2_id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "DiaSoft publish only with circulation 10000+";
  END IF;
END //

CREATE TRIGGER tr8
BEFORE UPDATE ON book
FOR EACH ROW
BEGIN
  DECLARE p1_id INT;
  DECLARE p2_id INT;
  SELECT id FROM publisher WHERE name="BHV С.-Петербург" INTO p1_id;
  SELECT id FROM publisher WHERE name="DiaSoft" INTO p2_id;
  IF NEW.circulation < 5000 AND NEW.publisher_id = p1_id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "BHV publish only with circulation 5000+";
  END IF;
  IF NEW.circulation < 10000 AND NEW.publisher_id = p2_id THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "DiaSoft publish only with circulation 10000+";
  END IF;
END //

# T7
CREATE TRIGGER tr9
BEFORE UPDATE ON book
FOR EACH ROW
BEGIN
  IF USER() = "dbo@localhost" AND OLD.cost != NEW.cost THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "USER dbo can't change book's cost";
  END IF;
END //


DELIMITER ;
