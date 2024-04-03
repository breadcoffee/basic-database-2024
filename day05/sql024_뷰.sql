-- VIEW (뷰)
-- 고객명과 책이름을 같이 볼 수 있는 주문 뷰를 만들어라
CREATE VIEW v_orderdetail
    AS
SELECT O.orderid
     , O.custid
     , C.name
     , O.bookid
     , B.bookname
     , O.saleprice
     , B.price
     , O.orderdate
  FROM Customer AS C, Orders AS O, Book AS B
 WHERE C.custid = O.custid
   AND O.bookid = B.bookid

-- 대한민국 고객으로 구성된 뷰를 만드시오
CREATE VIEW v_kcustomer
    AS
SELECT *
  FROM Customer
 WHERE [address] LIKE '%대한민국%'

-- 조회
SELECT *
  FROM v_kcustomer; 

-- 뷰에도 삽입, 수정, 삭제가 가능
INSERT INTO v_kcustomer
VALUES(6, '손흥민', '대한민국 강원도', '010-9876-1234');

-- 다른 뷰에 있는 데이터로 v_orderdetail에 데이터 삽입이 가능한가?
-- JOIN으로 만든 뷰는 삽입, 수정, 삭제 불가!!
INSERT INTO v_orderdetail
VALUES(11, 6, '손흥민', 1, '축구의 역사', 6500, 7000, '2024-04-03');

-- 단, 뷰에는 되도록 삽입, 수정, 삭제를 하지말 것
DROP VIEW v_kcustomer;

-- 시스템 뷰, DBMS가 미리 만들어 놓은 뷰들
SELECT * FROM sys.databases;

-- 테이블 내에 존재하는 컬럼명 조회
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_NAME = 'Book';