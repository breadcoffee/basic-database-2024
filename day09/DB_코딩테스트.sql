-- desc : DB 코딩테스트
-- date : 2024-04-09

USE BookRentalShop2024;

/* 1. 회원 테이블에서 이메일, 모바일, 이름, 주소 순으로 나오도록 검색하시오.
(결과는 아래와 동일하게 나와야 하며, 전체 행의 개수는 31개입니다) */

SELECT Email AS 'email'
     , Mobile AS 'mobile'
     , [Names] AS 'names'
     , Addr AS 'addr'
  FROM membertbl
 ORDER BY Addr DESC, [Email] ASC;

/* 2. 함수를 사용하여 아래와 같은 결과가 나오도록 쿼리를 작성하시오.(전채 행의 개수는 59개입니다) */

SELECT [Names] AS '도서명'
     , Author AS '저자'
     , ISBN
     , Price AS '정가'
  FROM bookstbl
 ORDER BY Price DESC;

/* 3. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.(책을 한번도 빌린적이 없는 회원을 뜻합니다) */

SELECT M.[Names] AS '회원명'
     , M.Levels AS '회원등급'
     , M.Addr AS '회원주소'
     , R.rentalDate AS '대여일'
  FROM membertbl AS M
  LEFT OUTER JOIN rentaltbl AS R
    ON R.memberIdx = M.memberIdx
 WHERE R.rentalDate IS NULL
 ORDER BY M.Levels ASC; -- 회원등급 순으로 올림차순 정렬
   --AND M.Levels = 'A'; -- 회원등급 A만 출력시

/* 4. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오. */

SELECT D.[Names] AS '책 장르'
     , FORMAT(SUM(B.Price), '#,#') + '원' AS '총합계금액'
  FROM divtbl AS D, bookstbl AS B
 WHERE B.Division = D.Division
 GROUP BY D.[Names];

/* 5. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오. */

SELECT ISNULL(D.[Names], '--합계--') AS '책 장르'
     , COUNT(D.[Names]) AS '권수'
     , FORMAT(SUM(B.Price), '#,#') + '원' AS '총합계금액'
  FROM divtbl AS D, bookstbl AS B
 WHERE B.Division = D.Division
 GROUP BY D.[Names] WITH ROLLUP;