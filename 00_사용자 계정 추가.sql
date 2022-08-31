-- SQL 한 줄 주석

/*
 * SQL 범위 주석
 * */

-- 여기에 SQL을 작성하면 됩니다!

--SQL 하나 수행 CTRL + ENTER
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
--클라우드 버전은 계정 앞에 C##을 붙여야 하는데 그 과정을 생략할 수 있게 해주는 명령문

--실습용 사용자 계정 생성
CREATE USER kh_sbk IDENTIFIED BY kh1234;

--사용자 계정 권한 부여
GRANT RESOURCE, CONNECT TO kh_sbk;

--객체 생성(테이블 등) 공간 할당량 지정
ALTER USER kh_sbk DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;

