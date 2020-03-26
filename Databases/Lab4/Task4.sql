use lab4;

#Вивести статистику: загальна кількість всіх книг, їх вартість, їх середню вартість, мінімальну і максимальну ціну
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost) from books;
#Вивести загальна кількість всіх книг без урахування книг з непроставленою ціною
select count(id) from books where cost is not null;
#Вивести статистику (див. 1) для книг новинка / не новинка
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost) from books where new; #not new
#Вивести статистику (див. 1) для книг за кожним роком видання
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), year(date) from books where date is not null group by year(date);
#Змінити п.4, виключивши з статистики книги з ціною від 10 до 20
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), year(date) from books where date is not null and cost not between 10 and 20 group by year(date);
#Змінити п.4. Відсортувати статистику за спаданням кількості.
select * from (select count(id) as amount, sum(cost), format(avg(cost), 2), min(cost), max(cost), year(date) from books where date is not null group by year(date)) as x order by amount;
#Вивести загальну кількість кодів книг і  кодів книг, що не повторюються
select count(code), count(distinct(code)) from books;
#Вивести статистику: загальна кількість і вартість книг по першій букві її назви
select count(id), sum(cost), left(title, 1) from books group by left(title, 1);
#Змінити п. 8, виключивши з статистики назви починаються з англ. букви і з цифри.
select count(id), sum(cost), left(title, 1) from books where title not regexp '^[a-zA-Z0-9].*' group by left(title, 1);
#Змінити п. 9 так щоб до складу статистики потрапили дані з роками великими 2000.
select count(id), sum(cost), left(title, 1) from books where title not regexp '^[a-zA-Z0-9].*' and year(date) >= 2000 group by left(title, 1);
#Змінити п. 10. Відсортувати статистику за спаданням перших букв назви.
select * from (select count(id), sum(cost), left(title, 1) as letter from books where title not regexp '^[a-zA-Z0-9].*' and year(date) >= 2000 group by left(title, 1)) as x order by letter desc;
#Вивести статистику (див. 1) по кожному місяцю кожного року.
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), month(date), year(date) from books group by month(date), year(date);
#Змінити п. 12 так щоб до складу статистики не були дані з незаповненими датами.
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), month(date), year(date) from books where date is not null group by month(date), year(date);
#Змінити п. 12. Фільтр за спаданням року і зростанням місяця.
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), month(date), year(date) from books group by month(date), year(date) order by year(date) desc, month(date);
#Вивести статистику для книг новинка / не новинка: загальна ціна, загальна ціна в грн. / Євро / руб. Колонкам запиту дати назви за змістом.
select cost, concat(cost, '₴') as cost_uah, concat('€', cost) as cost_euro, concat(cost, '₽') as cost_rub from books where new;
#Змінити п. 15 так щоб виводилася округлена до цілого числа (дол. / Грн. / Євро / руб.) Ціна.
select round(cost, 0) as price, concat('$', round(cost, 0)) as price_dollar, concat(round(cost, 0), '₴') as price_uah, concat('€', round(cost, 0)) as price_euro, concat(round(cost, 0), '₽') as price_rub from books where new;
#Вивести статистику (див. 1) по видавництвах.
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), publishing from books group by publishing;
#Вивести статистику (див. 1) за темами і видавництвам. Фільтр по видавництвам.
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), publishing, theme from books group by publishing, theme order by publishing;
#Вивести статистику (див. 1) за категоріями, тем і видавництвам. Фільтр по видавництвам, тем, категорій.
select count(id), sum(cost), format(avg(cost), 2), min(cost), max(cost), publishing, theme, category from books group by publishing, theme, category order by publishing, theme, category;
#Вивести список видавництв, у яких огруглено до цілого ціна однієї сторінки більше 10 копійок.
select publishing from (select publishing, sum(pages) as pages, sum(cost) as cost from books group by publishing) as r where cost/pages > 0.1;