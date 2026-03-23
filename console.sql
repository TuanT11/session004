create database sach_thu_vien;
create schema sach_tv;

create table sach_tv.books(
    id serial primary key,
    title varchar(100) not null,
    author varchar(100) not null,
    category varchar(100) not null,
    publish_year int not null,
    price int not null,
    stock int default null
);

INSERT INTO sach_tv.books (id, title, author, category, publish_year, price, stock)
VALUES
    (1, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
    (2, 'Học SQL qua ví dụ', 'Trần Thị Hạnh', 'CSDL', 2020, 125000, 12),
    (3, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
    (4, 'Phân tích dữ liệu với Python', 'Lê Quốc Bảo', 'CNTT', 2022, 180000, NULL),
    (5, 'Quản trị cơ sở dữ liệu', 'Nguyễn Thị Minh', 'CSDL', 2021, 150000, 5),
    (6, 'Học máy cho người mới bắt đầu', 'Nguyễn Văn Nam', 'AI', 2023, 220000, 8),
    (7, 'Khoa học dữ liệu cơ bản', 'Nguyễn Văn Nam', 'AI', 2023, 220000, NULL);

select * from sach_tv.books;

update sach_tv.books b set price = b.price + (10/100) * b.price
where b.publish_year >= 2021 and b.price < 200000;

update sach_tv.books set stock = 0
where stock is null;

select *
from sach_tv.books
where (category = 'CNTT' or category = 'AI') and price between 100000 and 250000;

select *
from sach_tv.books
order by price desc, title asc;

select title
from sach_tv.books
where title ilike '%học%';

select distinct title
from sach_tv.books
where publish_year = 2020;

select *
from sach_tv.books
limit 2
offset 1;

start transaction;

delete from sach_tv.books
where id not in(
    select min(id)
    from sach_tv.books b
    group by b.title, b.author, b.publish_year
    );

rollback;