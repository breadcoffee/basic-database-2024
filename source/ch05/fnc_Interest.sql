USE madang -- madang 데이터베이스 내부에 함수 정의
DROP FUNCTION fnc_Interest -- 기존에 정의된 함수가 있으면 삭제
GO

-- 스칼라 사용자 함수 fnc_Interest 정의
CREATE FUNCTION fnc_Interest (@Price INT)
RETURNS INT
AS
BEGIN
	DECLARE @myInterest INT
	-- 가격이 30,000원 이상이면 10%, 30,000원 미만이면 5%
	IF @Price >= 30000
		SET @myInterest = @Price * 0.1;
	ELSE SET @myInterest = @Price * 0.05;
	RETURN @myInterest
	END
GO


/* Orders 테이블에서 각 주문에 대한 이익을 출력 */
SELECT custid, orderid, saleprice, dbo.fnc_Interest(saleprice) interest 
FROM Orders;