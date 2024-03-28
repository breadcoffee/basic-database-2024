USE madang -- madang 데이터베이스 내부에 프로시저를 정의
DROP PROCEDURE Interest -기존에 정의된 프로시저가 있으면 삭제
GO

-- Interest 프로시저 정의
CREATE PROCEDURE Interest AS
BEGIN
	DECLARE @myInterest AS NUMERIC(10,1)
	DECLARE @Price AS INT
	SET @myInterest = 0.0
	DECLARE InterestCursor CURSOR FOR
		SELECT saleprice FROM Orders;
	OPEN InterestCursor
	FETCH NEXT FROM InterestCursor INTO @Price;
	WHILE @@FETCH_STATUS=0
	BEGIN
		IF @Price >= 30000
			SET @myInterest = @myInterest + @Price * 0.1;
		ELSE SET @myInterest = @myInterest + @Price * 0.05;
		FETCH NEXT FROM InterestCursor INTO @Price;
	END
	CLOSE InterestCursor;
	DEALLOCATE InterestCursor;
	PRINT ' 전체 이익 금액 = '+ CONVERT(CHAR(15), @myInterest);
END
GO