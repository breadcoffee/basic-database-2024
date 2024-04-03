-- 서브쿼리 리뷰
-- All, ANY, SOME

-- WHERE절 서브쿼리
-- 3번 고객이 주문한 도서의 최고금액보다 더 비싼 도서를 구입한 다른 주문의 주문번호, 금액표시
SELECT *
  FROM Customer

-- 3번 고객(장미란)이 주문한 내역 중 최고금액
SELECT MAX(saleprice)
  FROM Orders
 WHERE custid = 3;

 -- 13000원보다 비싼 도서를 구입한 주문번호, 금액
 SELECT o1.orderid
      , o1.saleprice
   FROM Orders AS o1
 WHERE o1.saleprice > All (SELECT MAX(saleprice)
                             FROM Orders
                            WHERE custid = 3);

-- EXISTS, NOT EXISTS : 열을 명시안함, 부속질의문의 어떤 행이 조건에 만족하면 참임
-- 대한민국 거주 고객에게 판매한 도서의 총판매액
-- 전체 판매액 11800원, 대한민국 거주 고객 판매액 46000원
SELECT SUM(saleprice) AS '대한민국 거주고객 판매액'
  FROM Orders as o
 WHERE EXISTS (SELECT *
                 FROM Customer AS c
                WHERE c.address LIKE '%대한민국%'
                  AND c.custid = o.custid);

-- 조인도 가능
SELECT SUM(saleprice) AS '대한민국 거주고객 판매액'
  FROM Orders AS o, Customer AS c
 WHERE o.custid = c.custid
   AND c.address LIKE '%대한민국%' -- NOT LIKE도 가능

-- SELECT절 서브쿼리, 조인으로 변경가능
-- 고객별 판매액을 보이시오
SELECT SUM(O.saleprice) AS '고객별 판매액'
     , O.custid
     , (SELECT [name] FROM Customer WHERE custid = O.custid) AS '고객명' -- SELECT절 서브쿼리
  FROM Orders AS O
 GROUP BY O.custid

-- UPDATE에서도 사용가능
-- 사전준비
ALTER TABLE Orders ADD bookname VARCHAR(40);

-- 업데이트, 한꺼번에 필요한 필드값을 한테이블에서 다른 테이블로 복사할때 아주 유용함
UPDATE Orders
   SET bookname = (SELECT bookname
                     FROM Book
                    WHERE Book.bookid = Orders.bookid)

-- FROM절 서브쿼리(인라인 뷰[가상테이블])
-- 고객별 판매액으로 고객명과 판매액을 보이시오(서브쿼리 -> 조인)
-- 고객별 판매액 집계 쿼리가 FROM절에 들어가면 모든 속성(컬럼)에 이름이 지정되어야함
SELECT B.TOTAL
     , C.name
  FROM(SELECT SUM(O.saleprice) AS 'TOTAL' -- 이름이 지정되어야 실행됨
            , O.custid
         FROM Orders AS O
        GROUP BY O.custid) AS B, Customer AS C
 WHERE B.custid = C.custid;

-- 고객번호가 2 이하인 고객의 판매액을 보이시오, 고객이름, 판매액 표시
-- GROUP BY에 들어갈 속성(컬럼)은 최소화. 중복 등의 문제가 있으면 결과가 다 틀어짐
SELECT SUM(O.saleprice) AS '고객별 판매액'
     , (SELECT [name] FROM Customer WHERE custid=C.custid) AS '고객명' -- GROUP BY에 C.name 추가한 것과 동일
  FROM (SELECT custid
            , [name]
         FROM Customer
        WHERE custid <= 2) AS C, Orders AS O
 WHERE C.custid = O.custid
 GROUP BY C.custid;