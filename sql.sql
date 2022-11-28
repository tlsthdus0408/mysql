use madang;
select * from book;
select bookname,publisher from book
where price>= 10000;
select * from customer;
select * from customer a,orders b
where a.custid=b.custid;
show databases;
select * from customer;

SELECT bookname,price
from book;
SELECT bookname,price,publisher,bookid
from book;
SELECT publisher
from book;
SELECT distinct publisher
from book;
SELECT distinct publisher from book
where publisher like "대한%";
SELECT* from book
where price<2000;
SELECT* from book
where price between 10000 and 200000;
select * from book
where price >= 10000 And price <= 20000;
select * from book
where publisher in ("굿스포츠","대한미디어");
select * from book
where publisher not in("굿스포츠","대한미디어");
select * from book
where bookname like '%의%사';
select * from book
where bookname like "%여자";
where 
