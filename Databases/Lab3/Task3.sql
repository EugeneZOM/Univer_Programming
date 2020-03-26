use lab3;

#Вивести книги у яких не введена ціна або ціна дорівнює 0
select * from books where cost = 0 or cost is null;
#Вивести книги у яких введена ціна, але не введений тираж
select * from books where cost is not null and circulation is null;
#Вивести книги, про дату видання яких нічого не відомо.
select * from books where date is null;
#Вивести книги, з дня видання яких пройшло не більше року.
select * from books where year(date) > year(curdate())-1;
#Вивести список книг-новинок, відсортоване за зростанням ціни
select * from books where new order by cost;
#Вивести список книг з числом сторінок від 300 до 400, відсортоване в зворотному алфавітному порядку назв
select * from books where pages between 300 and 400 order by title desc;
#Вивести список книг з ціною від 20 до 40, відсортоване в спаданням дати
select * from books where cost between 20 and 40 order by date;
#Вивести список книг, відсортованих в алфавітному порядку назв і ціною по спадаючій
select * from books order by title, cost desc;
#Вивести книги, у яких ціна однієї сторінки <10 копійок.
select * from books where cost/pages < 0.10;
#Вивести значення наступних колонок: число символів в назві, перші 20 символів назви великими літерами
select length(title), UCASE(left(title, 20)) from books;
#Вивести значення наступних колонок: перші 10 і останні 10 символів назви прописними буквами, розділені '...'
select concat(LCASE(left(title, 10)), '...', LCASE(right(title, 10))) from books;
#Вивести значення наступних колонок: назва, дата, день, місяць, рік
select title, date, day(date), month(date), year(date) from books;
#Вивести значення наступних колонок: назва, дата, дата в форматі 'dd / mm / yyyy'
select title, date, date_format(date, "%d/%m/%Y") from books;
#Вивести значення наступних колонок: код, ціна, ціна в грн., Ціна в євро, ціна в руб.
select code, cost, concat(cost, '₴'), concat('€', cost), concat(cost, '₽') from books;
#Вивести значення наступних колонок: код, ціна, ціна в грн. без копійок, ціна без копійок огругленная
select code, cost, concat(floor(cost), '₴'), concat(format(cost, 0), '₴') from books;
#Додати інформацію про нову книгу (всі колонки)
insert into books (code, new, title, cost, publishing, pages, format, date, circulation, theme, category) values (5110, true, 'New book', 24.52, 'Publishing house', 250, '70x100 / 60', ('2020-01-02'), 2000, 'Sometheme', 'Somecategory');
#Додати інформацію про нову книгу (колонки обов'язкові для введення)
insert into books (code, title, publishing, pages, theme, category) values (5110, 'New book', 'Publishing house', 250, 'Sometheme', 'Somecategory');
#Видалити книги, видані до 1990 року
select * from books where year(date) < 1990;
#Проставити поточну дату для тих книг, у яких дата видання відсутній
update books set date=now() where date is null;
#Встановити ознака новинка для книг виданих після 2005 року
update books set new=true where year(date) > 2005;