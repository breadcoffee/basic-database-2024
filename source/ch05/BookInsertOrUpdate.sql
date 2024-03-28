USE madang -- madang 데이터베이스 내부에 프로시저를 정의 
DROP PROCEDURE BookInsertOrUpdate -- 기존에 정의된 프로시저가 있으면 삭제
GO

-- BookInsertOrUpdate 프로시저 정의
CREATE PROCEDURE BookInsertOrUpdate(@myBookID INT,
	@myBookName VARCHAR(40), @myPublisher VARCHAR(40), @myPrice INT) AS
BEGIN
	IF EXISTS (SELECT * FROM Book WHERE bookname = @myBookName)
		UPDATE Book SET price = @myPrice
			WHERE bookname = @myBookName;
	ELSE
		INSERT INTO Book(bookid, bookname, publisher, price)
			SELECT @myBookID, @myBookName, @myPublisher, @myPrice;
IF @@Error <> 0 RAISERROR ('BOOK 테이블 삽입 오류', 16, 1)
END
GO