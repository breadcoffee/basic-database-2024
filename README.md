# basic-database-2024
IoT 개발자과정 SQLServer 학습 리포지토리

## 1일차
- MS SQL Server 설치 : https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads 최신 버전
    - DBMS 엔진 - 개발자 버전
        - 미디어 설치
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화 후 진행

        ![기능선택](https://github.com/breadcoffee/basic-database-2024/blob/main/images/db001.png)

        - 데이터베이스 엔진 구성부터 중요
            - Windows 인증모드로 하면 외부에서 접근불가
            - 혼합모드(sa)에 대한 암호를 지정 / mssql_p@ss (비밀번호 제한조건 : 8자이상, 대소문자 구분, 특수기호 1자리)
            - 데이터 루트 디렉토리는 변경
   
    - 개발툴 설치 : https://learn.microsoft.com/ko-kr/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16 한국어버전
        - SSMS(SQL Server Management Studio) DB에 접근, 여러개발 작업 툴

- 데이터베이스 개념
    - 데이터를 보관, 관리, 서비스하는 시스템
    - Data, Information, Knowlege 개념
    - DBMS > Database > Data(Model)

- DB언어
    - SQL(structured Query Language) : 구조화된 질의 언어
    - DDL(Data Definition Language) : 데이터베이스, 테이블, 인덱스 생성(CREATE)/삭제(DROP), 테이블 정의 변경(ALTER)
    - DML(Data Manipulation Language) : 검색(SELECT), 삽입(INSERT), 내용변경(UPDATE), 삭제(DELETE) 등
    - DCL(Data Control Language) : 권한부여(GRANT) 및 제거(REVOKE)
    - TCL(Transaction Control Language) : 트랜스액션(트랜잭션)을 제어하는 기능 COMMIT, ROLLBACK

- SQL 기본학습
    - SSMS 실행

    ![SSMS로그인](https://github.com/breadcoffee/basic-database-2024/blob/main/images/db002.png)

    - 특이사항 : SSMS 쿼리창에서 소스코드 작성 시 빨간색 오류 밑줄이 가끔 표현(전부 오류는 아님!)
    
- DML 학습
    - SQL 명령어 키워드 : SELECT, INSERT, UPDATE, DELETE
    - IT개발 표현언어 : Request, Create, Update, Delete (CRUD로 부름)
    - SELECT
        ```sql
        SELECT [ALL(기본) | DISTINCT] 속성이름(들)
          FROM 테이블이름(들)
        [WHERE 검색조건(들)
        [GROUP BY 속성이름(들)]
       [HAVING 검색조건(들)]
        [ORDER BY 속성이름(들) [ASC(기본)|DESC]]
        ```
    - SELECT문 학습
        - 기본, 조건검색 학습 중

## 2일차
- Database 학습
    - DB 개발시 사용할 수 있는 개발 툴
        - SSMS(기본)
        - Visual Studio : 아무런 설치없이 개발 가능
        - Visual Studio Code : SQL Server(mssql) 플러그인 설치하고 개발 가능
    - ServerName(HostName) : [내 컴퓨터 이름 | 내 네트워크 주소 | 127.0.0.1(LoopBack IP) | localhost] 
    - 관계 데이터 모델
        - 릴레이션 : 행과 열로 구성된 테이블(관계 데이터 모델에서만)
            - 행, 튜플, 열, 속성, 스키마, 인스턴스
        - 테이블(실제 DB)
            - 행, 레코드, 열, 컬럼, 컬럼이름, 데이터
        - 차수(degree) : 속성의 개수
        - 카디널리티(cardinality) : 튜플의 수

        - 릴레이션 특징
            1. 속성은 단일값을 가짐(책이름이 여러개 들어가면 안됨)
            2. 속성은 다른 이름으로 구성(책이름이라는 속성이 두개이상 있으면 안됨)
            3. 속성의 값은 정의된 도메인값만 가짐
            4. 속성의 순서는 상관없음
            5. 릴레이션내 중복된 튜플 허용안함
            6. 튜플 순서는 상관없음
            
        - 관계 데이터 모델은 아래의 요소로 구성된
            - 릴레이션(Relation)
            - 제약조건(Contranints)
            - 관계대수(Relational algebra)
 
- DML 학습
    - SELECT 학습
        - 복합조건, 정렬
        - 집계함수와 GROUP BY
            - SUM(총합), AVG(평균), COUNT(개수), MIN(최소값), MAX(최대값)
            - 집계함수 외에는 GROUP BY 절에 속한 컬럼 외에는 SELECT문에 입력 불가
            - HAVING은 집계함수의 필터로 GROUP BY 뒤에 작성, WHERE절과 피터링이 다르다.

        - 두개 이상의 테이블 질의(Query)
            - 관계형 DB에서 가장 중요한 기법 중 하나 : JOIN!
            - INNER JOIN(내부 조인) [참조](https://sql-joins.leopard.in.ua/)
            - LEFT|RIGHT OUTER JOIN(외부 조인) : 어느 테이블이 기준인지에 따라서 결과가 상이함

        ![외부조인](https://github.com/breadcoffee/basic-database-2024/blob/main/images/db004.png)

## 3일차
- Database 학습
    - 관계 데이터 모델
    - 무결성 제약조건
        - 슈퍼키 : 튜플을 유일한 값으로 구분 지을 수 있는 속성 또는 속성집합(고객번호 | 고객번호/이름 | 고객번호/주소 고객번호/이름/주소 ...)
        - 후보키 : 튜플을 유일한 값으로 구분 지을 수 있는 최소한의 속성집합
        - 기본키(Primary Key) : 여러 후보 키 중에서 하나를 선정하여 대표로 삼는 키 (고객번호)
            - 고려사항 : 고유한 값(Uniqye), NULL 불가(Not Null), 최소 속성의 집합, 개인정보 등의 보안사항을 사용 자제
        - 대리키 : 기본키가 여러개의 속성으로 구성되어 복잡하거나 보안문제가 생길때 새롭게 생성하는 키
        - 대체키 : 기본키로 선정되지 않은 후보키
        - 외래키(fForiegn Key) : 기본키를 참조하여 사용하는 것
            - 고려사항 : 다른 릴레이션과의 관계, 다른 릴레이션의 기본키를 호칭, 서로 같은 값이 사용, 기본키가 변경되면 외래키도 변경되어야 함
                         NULL과 중복을 허용(Not NULL인 경우도 있음), 자기 자신의 기본키를 외래키로 사용할 수도 있음, 외래키가 기본키의 속성 중 하나가 될 수도 있음

    - 데이터 무결성(Integrity) : DB에 저장된 데이터의 일관성과 정확성을 지키는 것
        - 도메인 무결성 제약조건 : 데이터 타입, NOT NULL, 기본값, 체크 득성을 지키는 것
        - 개체 무결성 제약조건(기본키 제약조건) : 기본키 제약조건으로도 부름. Unique에 NOT NULL.(값이 중복되어도 안되고, 빠져도 안됨)
        - 참조 무결성 제약조건(외래키 제약조건) : 부모의 키가 아닌 값은 사용할 수 없음(외래키가 바뀔때 기본키의 값이 아닌 것은 제약을 받음)
            - RESTRICT(자식에서 키를 사용하고 있으면 부모 삭제 금지), CASCADE(부모가 지워지면 해당 자식도 같이 삭제)
            - DEFAULT(부모가 지워지면 자식은 지정된 기본값으로 변경), NULL(부모가 지워지면 자식의 해당 값을 NULL로 변경)
        - 유일성 제약 조건 : 일반 속의 값이 중복되면 안되는 제약조건. NULL값은 허용

- DML 학습
    - SELECT 학습
        - OUTER JOIN(외부조인)
            - LEFT|RIGHT|FULL(FULL은 거의 사용안함) : 왼쪽 테이블을 기준으로 조건에 일치하지 않는 왼쪽 테이블 데이터도 모두 표시(LEFT OUTER JOIN).
                                                      오른쪽 테이블 기준으로 조건에 일치하지 않는 오른쪽 테이블 데이터 모두 표시(RIGHT OUTER JOIN).
        - 부속질의(SubQuery)
            - 쿼리 내에 다시 쿼리를 작성하는 것
            - 서브쿼리를 쓸 수 있는 장소
                - SELECT절 : 한 컬럼에 하나의 값만 사용
                - FROM절 : 가상의 테이블로 사용
                - WHERE절 : 여러 조건에 많이 사용

        - 집합연산 - JOIN도 집합이지만, 속성별로 가로로 병합하기 때문에 집합이라고 부르지 않는다. 여기서 집합은 데이터를 세로로 합치는 것을 뜻함
            - 합집합(UNION, 진짜 많이 사용) : UNION(중복제거), UNION ALL(중복 허용)
            - 차집합(EXCEPT, 거의 사용안함) : 하나의 테이블에서 교집합 값을 뺀 나머지
            - 교집합(INTERSECT, 거의 사용안함) : 두 테이블에 모두 존재하는 값
            - EXIST : 하나의 테이블에 존재하는 값만 출력할 때

- DDL 학습
    - CREATE : 개체(데이터베이스, 테이블, 뷰, 사용자 등등)를 생성하는 구문
        ```sql
        -- 테이블 생성에 한정
        ({ 속성이름 데이터타입
            [NOT NULL]
            [UNIQUE]
            [DEFAULT 기본값]
            [CHECL 체크조건]
        }
            [PRIMARY KEY 속성이름(들)]
            {[FORIEGN KEY 속성이름 REFERENCES 테이블이름(속성이름)]
                [ON UPDATE [NO ACTION | CASCASDE | SET NULL | SET DEFAULT]]
            }
        );
        ```
    - ALTER : 개체를 변경(수정)하는 구문
        ```sql
        ALTER TABLE 테이블명
            [ADD 속성이름 데이터타입]
            [DROP COLUMN 속성이름]
            [ALTER COLUMN 속성이름 데이터타입]
            [ALTER COLUMN 속성이름 [NULL | NOT NULL]]
            [ADD PRIMARY KEY(속성이름)]
            [[ADD | DROP] 제약조건이름];
        ```
    - DROP : 개체를 삭제하는 구문
        ```sql
        DROP TABLE 테이블명;
        ```
        - 외래키로 사용되는 기본키가 있으면, 외래키를 사용하는 테이블을 삭제 후, 기본키의 테이블을 삭제해야한다.

## 4일차
- 관계 데이터 모델
    - 관계대수 : 릴레이션에서 원하는 결과를 얻기위한 수학의 대수와 같은 연산 사용 기술하는 언어
    - 셀렉션, 프로젝션, 집합, 조인, 카디션 프로덕트, etc...

- DML 학습(SELECTE 외)
    - INSERT

        ```sql
        INSERT INTO 테이블이름[(속성리스트)]
        VALUES (값리스트);
        ```
    - UPDATE

        ```sql
        -- 항상 트랜잭션을 걸어서 복구를 대비
        UPDATE 테이블이름
           SET 속성이름1=값[, 속성이름2=값, ...]
         WHERE <검색조건>    -- 실무에서는 빼면 안됨
        ```
    - DELETE
        ```sql
        DELETE FROM 테이블 이름
         WHERE <검색조건> -- 실무에서는 빼면 안됨
        ```
        
- SQL 고급
    - 내장함수
        - 수학함수, 문자열함수, 날짜/시간함수, 변환함수, 커서함수(!), 보안함수, 시스템함수 등
        - NULL(!)

    - 서브쿼리 리뷰
        - SELECT : 단일행, 단일열(스칼라 서브쿼리)
        - FROM : 다수행, 다수열
        - WHERE : 다수행, 단일열(보통)
            - 비교연산, 집합연산, 한정연산, 존재연산 가능

## 5일차
- SQL 고급
    - 서브쿼리 리뷰
        - EXISTS/NOT EXISTS : 부속질의문의 어떤 행이 조건에 만족하면 참임

    - 뷰 : 복잡한 쿼리로 생성되는 결과를 자주 사용하기 위해서 만드는 개체
         , 편리하고, 보안에 강하며, 논리적 독립성을 보임
         , 원본 데이터가 변경되면 같이 변경되고, 인덱스 생성은 어렵다
         , CRUD 연산에 제약이 있음

        ```sql
        -- 생성
        CREATE VIEW 뷰이름 [(열이름 [, ...])]
        AS <SELECT 쿼리문>

        -- 수정
        ALTER VIEW 뷰이름 [(열이름 [, ...])]
        AS <SELECT 쿼리문>

        -- 삭제
        DROP VIEW 뷰이름;

        -- 조회
        SELECT *
          FROM 뷰이름;
        ```

    - 인덱스

        ```sql
        CREATE [UNIQUE] [CLUSTERED|NONCLUSTERED] INDEX 인덱스이름
        ON 테이블명 (속성이름 [ASC|DESC] [,...n]);

        -- 수정
        ALTER INDEX {인덱스이름|ALL}
        ON 테이블명 { REBUILD | DISABLE | REORGANIZE };

        -- 삭제
        DROP INDEX 인덱스이름 ON 테이블명;
        ``` 
        - SSMS에서 실행계획을 가지고 쿼리 실행 성능을 체크할 수 있음.   

- 파이썬 SQL Server 연동 프로그래밍
    - Madanf DB 관리 프로그램
        - PyQT GUI 생성
        - SQL Server 데이터 핸들링
            - pymysql 라이브러리 설치

            ```shell
            > pip install pymssql
            ```
        - DB연결 설정 - Oracle, MySQL 등은 설정이 없음. 구성관리자에서 TCP/IP로 접근을 허용하지 않으면 접속 안됨
            1. 시작메뉴 > 모든 앱 > Microsoft SQL Server 20xx > **SQL Server 20xx 구성관리자** 실행
            2. SQL Server 네트워크 구성 > **MSSQL SERVER에 대한 프로토콜** 클릭
            3. TCP/IP 프로토콜 최초 상태가 사용안함 > **TCP/IP**를 더블클릭
            4. **프로토콜 사용 > 예**, 로 변경
            5. IP주소 탭 > IP2(자신 IP부분) > **사용 > 예**, 로 변경
            6. IP주소 탭 > IP4(127.0.0.1 부분) > **사용 > 예**, 로 변경
            7. 적용 후 SQL Server 서비스 > SQL Server (MSSQLSERVER) 더블클릭 후, **다시 시작** 버튼 클릭, 재시작 필요

            ![DB연결](https://github.com/breadcoffee/basic-database-2024/blob/main/images/db005.png)

## 6일차
- 파이썬 SQL Server 연동 프로그래밍
    - Madanf DB 관리 프로그램
        - PyQt5 + pymssql
    
    - 문제점 : 한글깨짐 문제
        1. DB 테이블의 varchar(ASCII) -> nvarchar(UTF-8) 변경
        2. Python에서 pymssql로 접속할 때, charset을 'UTF8'로 변경
        3. INSERT 쿼리에 한글 입력되는 컬럼은 N''을 붙여줌(유니코드로 입력하라는 뜻)

    - 실행화면
    
    https://github.com/breadcoffee/basic-database-2024/assets/146920372/3a2c2a57-2ad0-439c-86ef-3af04db101c3

## 7일차
- SQL 고급
    - 트랜잭션(ALL or Nothing) : DBMS에서 테이터를 다루는 논리적인 작업의 단위
        - 트랜잭션의 속성(ACID)
            - 원자성(Atomicity) : 트랜잭션에 포함된 작업은 전부 수행되거나 전부 수행되지 않아야한다.(ALL or Nothing)
            - 일관성(Consistency) : 트랜잭션을 수행하기 전이나 수행한 후나 테이터베이스는 항상 일관된 상태를 유지해야함
            - 고립성(Isolation) : 수행 중인 트랜잭션에 다른 트랜잭션이 끼어들어 변경 중인 테이터값을 훼손하는 일이 없어야함
            - 지속성(Durability) :  수행을 성공적으로 완료한 트랙잭션은 그 상태를 계속 유지해야한다.
        
        - TCL에서 사용할 키워드
            - BEGIN, TRAN[SACTION], COMMIT, ROLLBACK, SAVE

        - SQL Server는 기본적으로 Auto Commit(시스템이 자동으로 트랜잭션을 건다.)
        - Auto Commit 세팅
            - SSMS > 도구 > 옵션 > 쿼리실행 > SQL Server > ANSI > SET IMPLICIT_TRANSACTIONS 체크, 프로그램 재시작

        - 트랜잭션 : 로직 처리 시 다른 트랜잭션의 간섭을 받지 않기 위한 것(Lock), 중요한 데이터 수정, 삭제 시 잘못된 변경을 방지하기 위한 것

- 데이터 모델링
    - 설계(모델링) 순서 : 개념설계 > 논리설계 > 물리설계
    - 개념 모델링 : 요구사항을 받으면서 정해지지않은 여러 개체들을 정립화하는 단계
    - 논리 모델링 : 기본키 지정, 외래키 지정, 관계 정립, 속성들 이름(한글) 개체를 정하는 단계
    - 물리 모델링 : DB에 맞춰서 컬럼이름, 컬럼데이터 타입 및 크기 지정, DB에 대한 검토로 테이블을 만들기 직전의 설계를 완성

    - ER 모델링 : ERD를 그리기 위한 기본 이론

- 인덱스 예제
    - PK나 인덱스가 없는 상태에서 성능문제 체크
    - 인덱스가 설정되면 성능이 어떤지 비교
    - 더미 생성시 100만건으로 제약을 두고 시작

    <!-- html img 태그로 이미지 사이즈 조정가능 -->
    <img src="https://github.com/breadcoffee/basic-database-2024/blob/main/images/db006.png" width="900">

## 8일차
- 인덱스 예제
- 정규화
    - DB 상에서 생기는 이상현상(삽입, 삭제, 수정)이 생기지 않는 릴레이션(테이블) 븐리해서 데이터베이스 설계
    - 이상현상이 생기는 테이블을 분리해서 문제 해결
    - 기본키와 함수종속성을 파악
    - 1정규형 : 도메인이 원자값을 가짐
    - 2정규형 : 기본키가 아닌 속성이 기본키의 완전 종속일때 (학생번호[PK], 강좌이름 --> 성적을 결정)
    - 3정규형 : 기본키가 아닌 속성이 기본키에 비이행적으로 종속할때(학생번호 --> 강좌이름 --> 수강료[이행종속성])
    - BCNF 정규형 : 함수 종속성 X -> Y가 성립할 때 모든 결정자 X가 후보키(기본키가 될 수 있는 속성)이면
    - 보통 BCNF까지 정규화를 함
    - 4정규형(다치종속성), 5정규형(조인 종속성, 무손실 분해)

- 실무실습(사용자, 권한...)
    1. DB관리자(SSMS)
        - hr 데이터베이스 생성, 관계를 설정
        - hr DB를 사용할 사용자 계정 생성, 필요한 권한설정
            - 추가 : 만약에 sa의 비밀번호를 잃어버리면, Window 인증으로 로그인 후
            - SSMS > 보안 > 로그인 > sa 존재 > 속성에서 비밀번호 변경 이후 SQL Server 인증으로 sa 비밀번호 입력 후 로그인하면 됨
            - SSMS > 보안 > 로그인 > 새 로그인 클릭
                - 사용자계정 : hr_user, 비밀번호 : hr_p@ss!
                - 일반 : 기본 데이터베이스 hr 선택
                - 사용자매핑 : hr 선택, 데이터베이스 역할 멤버 : db_owner 추가 선택
    2. HR사용자 로그인(VS Code) : hr_user
        - SELECT
        - WHERE, ORDER BY
        - FUNCTION
        - AGGREGATE FUNC
        - JOIN
        - SET ..

## 9일차
- 실무실습
    - 쿼리실습
        - 기본 SELECT, WHERE, ORDER BY
        - 집계함수 GROUP BY, ROLLUP
        - JOIN, SUBQUERY, UNION ...
        - CASE WHEN THEN END ...
        - 내장함수 ...

    ![HRD_ERD](https://github.com/breadcoffee/basic-database-2024/blob/main/images/db007.png)

- 추가로 공부할 부분
    - 트랜잭션 중급이상
    - DB 보안 백업과 복구
    - 모델링 + 정규화
    - 데이터모델링 실습