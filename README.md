# basic-database-2024
IoT 개발자과정 SQLServer 학습 리포지토리

## 1일차
- MS SQL Server 설치 : https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads 최신 버전
    - DBMS 엔진 - 개발자 버전
        - 미디어 설치
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화 후 진행
        - 데이터베이스 엔진 구성부터 중요
            - Windows 인증모드로 하면 외부에서 접근불가
            - 혼합모드(sa)에 대한 암호를 지정 / mssql_p@ss (비밀번호 제한조건 : 8자이상, 대소문자 구분, 특수기호 1자리)
            - 데이터 루트 디렉토리는 변경
    - 개발툴 설치
        - SSMS(SQL Server Management Studio) DB에 접근, 여러개발 작업 툴

- 데이터베이스 개념
    - Data, Information, Knowlege 개념
    - DBMS > Database > Data(Model)

- DB언어
    - SQL(structured Query Language) : 구조화된 질의 언어
    - DDL(Data Definition Language) : 데이터베이스, 테이블, 인덱스 생성(CREATE)/삭제(DROP), 테이블 정의 변경(ALTER)
    - DML(Data Manipulation Language) : 검색(SELECT), 삽입(INSERT), 내용변경(UPDATE), 삭제(DELETE) 등
    - DCL(Data Control Language) : 권한부여(GRANT) 및 제거(REVOKE)

- SQL 기본학습
    - SSMS 실행

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