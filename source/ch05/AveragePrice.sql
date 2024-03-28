USE madang -- madang 데이터베이스 내부에 프로시저를 정의
DROP PROCEDURE AveragePrice -- 기존에 정의된 프로시저가 있으면 삭제
GO

-- AveragePrice 프로시저 정의
CREATE PROCEDURE AveragePrice @AverageVal INT OUTPUT AS
BEGIN
	SET @AverageVal = (SELECT AVG(price) FROM Book
WHERE price IS NOT NULL);
END
GO
