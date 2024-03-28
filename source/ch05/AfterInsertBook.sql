/* 파일명 : AfterInsertBook.sql */
USE madang -- madang 데이터베이스 내부에 트리거를 정의
DROP TRIGGER AfterInsertBook -- 기존에 정의된 트리거가 있으면 삭제
GO

CREATE TRIGGER AfterInsertBook ON Book AFTER INSERT AS
BEGIN
  INSERT INTO Book_log 
  SELECT getdate( ), bookid, bookname, publisher, price from Inserted; 
END;