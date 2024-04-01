-- Customer를 기분으로 Orders 테이블과 외부조인하기
SELECT c.custid
     , c.[name]
     , c.[address]
     , c.phone
     , o.custid
     , o.bookid
     , o.saleprice
     , o.orderdate
  FROM Customer AS c LEFT OUTER JOIN Orders AS o -- LEFT, RIGHT, FULL
    ON c.custid = o.custid;