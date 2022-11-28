use madang;
select * from book
where bookname like "_구%";
select * from book
where bookname like "%축구% "and price>= 2000;
select * from book
where publisher ="굿스포츠" or publisher="대한미디어";
select * from book
order by bookname;
select * from book
order by price,bookname;
select * from book
order by price,publisher;
select * from book
order by price desc,publisher;
select sum(1+2);
select sum(saleprice) from orders;
select max(saleprice) from orders;
select min(saleprice) from orders;
select sum(saleprice) as '총매출액' from orders;
select saleprice as '판매단가' from orders;
select sum(saleprice) as 김연아_구매금액 from  orders
where custid=2;
select sum(saleprice) as Total,
AVG(saleprice) as Averahe,
min(saleprice) as mimimum,
max(saleprice) as maxium
from  orders;
select custid, count(*), sum(saleprice) from orders
group by custid;
select count(*) from book;
select custid, count(*) as 도서수량, sum(saleprice) as 구매금액 from orders;
select custid, count(*)as 도서수량 from orders
where saleprice>=8000
group by custid
having count(*) >= 2;
select * from customer;
select *from orders;
create view cust_ord as
select a.custid, a.name, a.address, a.phone, b.orderid, b.custid as ord_custid, b.bookid, b.saleprice, b.orderdate
from customer a, orders b
where a.custid = b.custid;
 
 select a.name,sum(b.saleprice) from coustomer a, orders b
 where a.custid= b.custid;
select a.name, c.bookname
from customer a, orders b, book c
where a.custid=b.custid and b.bookid=c.bookid;
select a.name, c.bookname
from customer a, orders b, book c
where a.custid=b.custid and b.bookid=c.bookid and c.price= 20000;
# 3.7 도서를 구매를 하지않은 고객을 포함하여 도서의 판매 가격을 구하시요
select a.name, c.saleprice
from customer a left outer join  orders b
on a.custid=b.custid;
select bookname
from book
where price =(select price from book where bookid =1);
select bookname
from book
where price =(select max(price) from book);
select bookname
from book
where price in(select max(price) from book where bookid in(1,2));
select custid  from orders;
select name from customer;
select a.bookname,a.price
from a.book
where a.price>(select avg(b.price)
             from book b 
             where b.publisher=a.publisher);
             
select avg(b.price) from book b;

select name
from customer
where address like "대한민국%";
select name
where address like "대한민국%" and name not in(select name from

select name
from customer
where custid like (select custid from orders);
select name
from customer
where custid in (select custid from orders));
use madang;
# exist(a에는 b에있는것만 일치하는 것)
select name, address 
from customer a
where exists( select * from orders b
               where a.custid=b.custid);  
 use madang;
 create table Newbook(
bookid integer primary key,
bookname varchar(40),
prublisher varchar(40),
price integer
);
select * from newbook;
# newBook  isvr생성
alter table newbook add isbn varchar(13);
#newbook 속성바꾸기(interger)
alter table newbook modify isbn integer;
#columm을 없애는 방법
alter table newbook drop column isbn ;		
 # 속성을 not null로 바꾸는방법
 alter table newbook modify bookid integer not null;
 #프라임키없애는 방법
 alter table newbook drop primary key;
 #프라임키주는방법
 alter table newbook add primary key(bookid);
#테이블삭제
drop table newbook;
 create table Newbook(
bookname varchar(20)not null,
prublisher varchar(20) unique,
price integer default 1000 check(price>1000),
primary key(bookname,prublisher)
);

create table newcustomer(
        custid integer primary key,
        name varchar(40),
        address varchar(30)
        );
create table neworders(
orderid integer,
custid integer not null,
bookid integer not null,
saleprice integer,
orderdata  date,
primary key (orderid),
foreign key (custid) references newcustomer(custid) on delete cascade);

alter table newbook add bookid integer;
#데이터 삽입
insert into book(bookid,bookname,publisher,price)
		    values(11,"스포츠의학","한솔의학서적","9000");
select * from book;
#데이터삽입(가격미정)
insert into book(bookid,bookname,publisher)
		    values(14,"스포츠의학","한솔의학서적");
 select * from book;
select * from imported_book;
#다른테이블에있는 내용을 복사하여 넣는방법(bulk insert)
insert book(bookid,bookname,price,publisher)
select bookid,bookname,price,publisher from imported_book;
select * from book;
#customer에서 고개각번호가 5인 고객의 주소를 '대한민국 부산'변경하시요
select * from customer
where custid=5;
update  customer
set  address="대한민국 부산"
where custid=5;

update book
set publisher=(select publisher
				from imported_book
                where bookid=21)
where bookid=14;
select * from book
where bookid=14;
#delent 없애는 방법
select * from book
where bookid=11;
delete FROM book
where bookid=11;
select * from book;
select abs(78), abs(+78)
from dual;
select 1+1 from dual;
select  custid "고객번호",round(sum(saleprice)/COUNT(*)2), "평균금액"
from orders
group by custid;
select bookid,bookname,replace(bookname,"야구","농구")bookname,publisher,price
from Book;
#굿스포츠에서 출판한 도서의 제목의 수를 확인하신요
# (한글은 2바이트 혹은 unlcode 경우는 3바이트르 차지함)
select bookname"제목",character_length(bookname)"문자수",
length(bookname) "바이트수"
from book
where publisher="굿스포츠";

select substr(name,1,1) "성",count(*), "인원"
from customer
group by substr(name,1,1);
#마당서점으로부터 10일후 매출을 확ㅈㅇ한다. 각 주문의 확정일자를 구하시요
#select orderid "주민번호",orderdate"주문일자",adddate)orderdata
#select orderid"주문번호",str_to_date(orderdate)
select orderid "주문번호", str_to_date(orderdate, "%Y-%m-%d")주문일,
	   custid "고객번호", bookid "도서번호"
from orders
where orderdate = date_format("20140707", "%Y-%m-%d");
#null 값 대한 연산과 집계함수
select sum(price),AVg(price),count(*),count(price)
from book;
select sum(price),AVg(price),count(*)
from book
where bookid >= 4;
 create table mybook(
bookid integer,
price integer

);
 insert into mybook(bookid)
        values(4);
  select * from mybook
  where price>4;
  insert into mybook(bookid,price)
        values(1,1);
        insert into mybook(bookid,price)
        values(2,2);
        insert into mybook(bookid,price)
        values(3,3);
 insert into mybook(bookid)
		values(4);
 select * from mybook;
 select * from mybook
 where price=null;
select sum(price),AVg(price),count(*)
from mybook
where price > 4;
 select * from mybook
 where price ="";
  select * from mybook
 where price=null;
   select * from mybook
 where price is null;
 # ifnulll  Null 값을 다른 값 으로 대처하여 연산하거나 다른 값으로 출력alter
 # 이름, 전화번호alter
 select name"이름", ifnull(phone, "연락처 없음")"전화번호"
from customer;
#행번호를 출력
# 내장함수는 아니지만 @가호를 붙이며 차환문과 set과 := 기호를 사용함
#자호를 일부부만  확인하여 때유용함
select *from customer;
select @ :=0;
select(@seq:=@seq+1)"순번", custid, name,price,price
from customer
where @seq <2;
# 부속질의(스칼라)
use madang;
select a.custid,(select name
			    from customer b
                where a.custid=b.custid), "name",sum(saleprice)
from orders a
group by custid;
select * from orders;
select * from orders;
alter table orders add column bookname varchar(40);
update orders
set bookname=(select bookname from book
             book.bookid=orders.bookid);
             