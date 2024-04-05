-- 트랜스액션(트랜잭션)
-- SELECT만 있다면 트랜잭션이 필요없음
-- INSERT, UPDATE, DELETE에서 중요한 로직을 처리할 때 트랜잭션이 반드시 필요하다
SELECT *
  FROM Customer;

-- 트랜잭션을 실수를 방지하기 위해서
BEGIN TRAN; -- 트랜잭션 시작

-- CUD에 대한 쿼리
UPDATE Customer
   SET phone = '010-7777-8888'
 WHERE custid = 2;

COMMIT; -- 명령어가 제대로 실행됐으면 커밋
ROLLBACK; -- 제대로 실행되지 않았으면 롤백