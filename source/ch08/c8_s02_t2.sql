

BEGIN TRANSACTION;
USE madang;
UPDATE Book 
SET     price=price*1.1
WHERE  bookid=2;

UPDATE Book 
SET     price=price*1.1
WHERE  bookid=1;
/*…(대기 상태)…*/

COMMIT;
