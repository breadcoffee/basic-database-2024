-- 1. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT * -- 와 일치하는 고객의 정보
  FROM Customer
 WHERE custid IN(SELECT DISTINCT custid -- 를 구매한 고객의 ID
                   FROM Orders
                  WHERE bookid IN(SELECT bookid -- 에서 출간한 책의 bookid
                                    FROM Book
                                   WHERE publisher IN (SELECT b.publisher -- 박지성이 구매한 출판사 이름
                                                         FROM Customer AS c, Orders AS o, Book AS b
                                                        WHERE c.custid = o.custid
                                                          AND o.bookid = b.bookid
                                                          AND c.[name] = '박지성')));

-- 3. 전체 고객의 30% 이상이 구매한 도서
SELECT *
     , CONVERT(float, b.custCount) / b.totalCount AS '구매율'
  FROM (SELECT custid
     , COUNT(custid) AS custCount
     , (SELECT COUNT(custid) FROM Orders) AS totalCount
          FROM Orders
         GROUP BY custid) AS b
 WHERE CONVERT(float, b.custCount) / b.totalCount >= 0.3;