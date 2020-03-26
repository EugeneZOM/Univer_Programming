use lab5;

# DROP ALL
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS theme;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS format;
DROP TABLE IF EXISTS category;
# CREATE TABLES
CREATE TABLE category (
	`id` INT(7) UNSIGNED auto_increment primary key unique,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE format (
	`id` INT(7) UNSIGNED auto_increment primary key unique,
    `value` VARCHAR(100) NOT NULL
);
CREATE TABLE publisher (
	`id` INT(7) UNSIGNED auto_increment primary key unique,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE theme (
	`id` INT(7) UNSIGNED auto_increment primary key unique,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE book (
	`id` INT(7) UNSIGNED auto_increment unique,
    `category_id` INT(7) UNSIGNED NOT NULL,
    `code` VARCHAR(4) NOT NULL,
    `cost` DECIMAL(5, 2) NOT NULL,
    `circulation` INT(7) DEFAULT 5000,
    `date` DATE DEFAULT now(),
    `format_id` INT(7) UNSIGNED NULL,
    `new` BOOL default false,
    `pages` INT(5) NOT NULL,
    `publisher_id` INT(7) UNSIGNED NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `theme_id` INT(7) UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(category_id) REFERENCES `category`(id),
    FOREIGN KEY(format_id) REFERENCES `format`(id),
    FOREIGN KEY(publisher_id) REFERENCES `publisher`(id),
    FOREIGN KEY(theme_id) REFERENCES `theme`(id)
);
#INIT VALUES
INSERT INTO category (`name`) VALUES('підручники');
INSERT INTO category (`name`) VALUES('Апаратні засоби ПК');
INSERT INTO category (`name`) VALUES('Захист і безпека ПК');
INSERT INTO category (`name`) VALUES('інші книги');
INSERT INTO category (`name`) VALUES('Windows 2000');
INSERT INTO category (`name`) VALUES('Linux');
INSERT INTO category (`name`) VALUES('Unix');
INSERT INTO category (`name`) VALUES('Інші операційні системи');
INSERT INTO category (`name`) VALUES('C & C ++');

INSERT INTO publisher (`name`) VALUES('BHV С.-Петербург');
INSERT INTO publisher (`name`) VALUES('Вільямс');
INSERT INTO publisher (`name`) VALUES('Пітер');
INSERT INTO publisher (`name`) VALUES('МікроАрт');
INSERT INTO publisher (`name`) VALUES('DiaSoft');
INSERT INTO publisher (`name`) VALUES('ДМК');
INSERT INTO publisher (`name`) VALUES('Тріумф');
INSERT INTO publisher (`name`) VALUES('Еком');
INSERT INTO publisher (`name`) VALUES('Російська редакція');

INSERT INTO theme (`name`) VALUES('Використання ПК в цілому');
INSERT INTO theme (`name`) VALUES('Операційні системи');
INSERT INTO theme (`name`) VALUES('програмування');

INSERT INTO format (`value`) VALUES('70x100 / 16');
INSERT INTO format (`value`) VALUES('84x108 / 16');
INSERT INTO format (`value`) VALUES('60x88 / 16');
INSERT INTO format (`value`) VALUES('84x100 / 16');
INSERT INTO format (`value`) VALUES('60x84 / 16');

INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (1, 5110, 15.51, str_to_date('7/24/2000','%m/%d/%Y'), 1, false, 400, 1, 'Апаратні засоби мультимедія. відеосистема РС', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (1, 4985, 18.90, str_to_date('7/7/2000','%m/%d/%Y'), 1, false, 288, 2, 'Освой самостійно модернізацію і ремонт ПК за 24 години, 2-е вид.', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (1, 5141, 37.80, str_to_date('9/29/2000','%m/%d/%Y'), 1, false, 384, 2, 'Структури даних і алгоритми.', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (1, 5127, 11.58, str_to_date('6/15/2000','%m/%d/%Y'), 1, true, 256, 3, 'Автоматизація інженерно графічних робіт', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (2, 5110, 15.51, str_to_date('7/24/2000','%m/%d/%Y'), 1, false, 400, 1, 'Апаратні засоби мультимедія. відеосистема РС', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (2, 5199, 30.07, str_to_date('12/2/2000','%m/%d/%Y'), 1, false, 368, 4, 'Залізо IBM 2001.', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (3, 3851, 26.00, str_to_date('2/4/1999','%m/%d/%Y'), 2, true, 480, 5, 'Захист інформації і безпека комп\'ютерних систем', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (4, 3932, 7.65, str_to_date('6/9/1999','%m/%d/%Y'), 3, false, 144, 6, 'Як перетворити персональний комп\'ютер у вимірювальний комплекс', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (4, 4713, 11.41, str_to_date('2/22/2000','%m/%d/%Y'), 1, false, 144, 6, 'Plug-ins. Вбудовувані додатки для музичних програм', 1);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (5, 5217, 16.57, str_to_date('8/25/2000','%m/%d/%Y'), 1, false, 320, 7, 'Windows МЕ. Новітні версії програм', 2);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (5, 4829, 27.25, str_to_date('4/28/2000','%m/%d/%Y'), 1, false, 320, 8, 'Windows 2000 Professional крок за кроком з ЗD', 2);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (6, 5170, 24.43, str_to_date('9/29/2000','%m/%d/%Y'), 1, false, 346, 6, 'Linux Російські версії', 2);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (7, 860, 3.50, str_to_date('5/5/1997','%m/%d/%Y'), 4, false, 395, 1, 'Операційна система UNIX', 2);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (8, 44, 5.00, str_to_date('3/20/1996','%m/%d/%Y'), 5, false, 352, 5, 'Відповіді на актуальні питання по OS / 2 Warp', 2);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (8, 5176, 12.79, str_to_date('10/10/2000','%m/%d/%Y'), null, false, 306, 9, 'Windows Ме. супутник користувача', 2);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (9, 5462, 29.00, str_to_date('12/12/2000','%m/%d/%Y'), 2, false, 656, 5, 'Мова програмування С ++. Лекції і вправи', 3);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (9, 4982, 29.00, str_to_date('7/12/2000','%m/%d/%Y'), 2, false, 432, 5, 'Мова програмування С. Лекції і вправи', 3);
INSERT INTO `book` (`category_id`, `code`, `cost`, `date`, `format_id`, `new`, `pages`, `publisher_id`, `title`, `theme_id`) VALUES (9, 4687, 17.60, str_to_date('2/3/2000','%m/%d/%Y'), 1, false, 240, 6, 'Ефективне використання C++. 50 рекомендацій щодо поліпшення ваших програм і проектів', 3);