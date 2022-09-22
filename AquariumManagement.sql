
-- 멤버 테이블

-- 테이블 삭제
DROP TABLE AR_MEMBER; 

-- 조회
SELECT * FROM AR_MEMBER;

-- MEMBER_NO 시퀀스 생성
CREATE SEQUENCE SEQ_MEMBER_NO;
DROP SEQUENCE SEQ_MEMBER_NO;

-- 회원 샘플 테이터 삽입
INSERT INTO AR_MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pass01', '유저일', DEFAULT);
INSERT INTO AR_MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user02', 'pass02', '유저이', DEFAULT);
INSERT INTO AR_MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user03', 'pass03', '유저삼', DEFAULT);
INSERT INTO AR_MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user04', 'pass04', '유저사', DEFAULT);
INSERT INTO AR_MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user05', 'pass05', '유저오', DEFAULT);

-------------------------------------------------------------------------

-- 어항 정보 테이블 생성

-- 테이블 삭제
DROP TABLE AR_TANK;

-- 테이블 조회
SELECT * FROM AR_TANK;


SELECT TANK_NO, TANK_NAME
		FROM AR_TANK
		WHERE MEMBER_NO = 1;

	
-- 어항 샘플 데이터 생성
	
INSERT INTO AR_TANK 
VALUES(1, 1, '내어항1', DEFAULT, '45큐브', 'K7 PRO', '하단섬프', '제오박, CV', '산호사');
INSERT INTO AR_TANK 
VALUES(1, (SELECT MAX(TANK_NO) FROM AR_TANK WHERE MEMBER_NO = '1')+1, '내어항2', DEFAULT, '35큐브', '썬라이트', '내부배면', '마이크로박터', '산호사');
INSERT INTO AR_TANK 
VALUES(2, 1, '내어항1', DEFAULT, '60큐브', '라데온', '하단섬프', '제오박, CV', '산호사');
INSERT INTO AR_TANK 
VALUES(2, (SELECT MAX(TANK_NO) FROM AR_TANK WHERE MEMBER_NO = '2')+1, '내어항2', DEFAULT, '4자어항', '오펙', '하단섬프', '제오빗 시스템', 'KZ 아라고나이트');
INSERT INTO AR_TANK 
VALUES(3, 1, '내어항1', DEFAULT, '2자', 'K7 PRO', '하단섬프', '마이크로박터, 바이오퓨엘', '다크캐러빅');

SELECT MAX(TANK_NO) FROM AR_TANK WHERE MEMBER_NO = '2'
------------------------------------------------------------------------------------------

-- 생물 테이블 생성

-- 생물 테이블 삭제
DROP TABLE AR_LIVESTOCK;


SELECT * FROM AR_LIVESTOCK;


-- 생물 샘플 데이터 삽입
INSERT INTO AR_LIVESTOCK 
VALUES(1, 1, 1, '물고기', '니모', 10000, 'F', SYSDATE, DEFAULT);
INSERT INTO AR_LIVESTOCK 
VALUES(1, 1, 2, '물고기', '옐로우탱', 60000, NULL, SYSDATE, DEFAULT);
INSERT INTO AR_LIVESTOCK 
VALUES(2, 1, 1, '물고기', '옐로우탱', 60000, NULL, SYSDATE, DEFAULT);

-- 시퀀스 사용 X 서브쿼리로 제일 큰 TANK_NO + 1  이런 식으로
SELECT MAX(TANK_NO) FROM AR_TANK WHERE MEMBER_NO = '2' +1

------------------------------------------------------------------------------

-- 물성치 테이블 생성

DROP TABLE AR_PARAMETER;


SELECT * FROM AR_PARAMETER
ORDER BY REG_DATE DESC;

-- 샘플 데이터 삽입
INSERT INTO AR_PARAMETER
VALUES(1, 1, 26, 10, 0.01, 7.4, 400, 1350, DEFAULT);

INSERT INTO AR_PARAMETER
VALUES(1, 1, 26, 12, 0.01, 7.6, 410, 1300, SYSDATE -1);


----------------------------------------------------------------------------------

-- 할 일 테이블 생성

DROP TABLE AR_TODO_LIST;

SELECT * FROM AR_TODO_LIST;

-- 샘플 데이터 삽입
INSERT INTO AR_TODO_LIST VALUES(1, 1, 1, '어항 환수하기', SYSDATE - 3, SYSDATE+4, DEFAULT);
INSERT INTO AR_TODO_LIST VALUES(1, 1, 2, '물고기 밥주기', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO AR_TODO_LIST VALUES(2, 1, 1, '어항 청소하기', SYSDATE - 3, SYSDATE+4, DEFAULT);
INSERT INTO AR_TODO_LIST VALUES(2, 2, 1, '양말필터 갈기', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO AR_TODO_LIST VALUES(3, 1, 1, '수류모터 청소하기', SYSDATE - 3, SYSDATE+4, DEFAULT);
INSERT INTO AR_TODO_LIST VALUES(3, 1, 2, '어항 환수하기', DEFAULT, DEFAULT, DEFAULT);

























-- 로그인
SELECT MEMBER_NO, MEMBER_ID, MEMBER_NAME
FROM AR_MEMBER
WHERE MEMBER_ID = ''
AND MEMBER_PW = '';



-- 회원 가입
INSERT INTO AR_MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, DEFAULT);

INSERT INTO AR_MEMBER 
VALUES(SEQ_MEMBER_NO.NEXTVAL, 'user01', 'pass01', '유저일', DEFAULT);



COMMIT;


-- 내 어항 조회
SELECT TANK_NO 번호, TANK_NAME 이름, FRESH_SALT "해수/담수", TANK_SIZE "어항 크기" 
, TANK_LIGHT "조명", TANK_FILTER "여과 장치" , TANK_ADDICTIVE 첨가제 
, TANK_SUBSTRATE 바닥재, (SELECT COUNT(*) FROM AR_LIVESTOCK L WHERE L.TANK_NO = T.TANK_NO) 생물수
FROM AR_TANK T
WHERE MEMBER_NO = 1
AND TANK_NO = 1;

--------------------------------------------------------------------------







