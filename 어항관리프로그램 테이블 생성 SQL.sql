--DROP TABLE "AR_MEMBER";

CREATE TABLE "AR_MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(30) UNIQUE,
	"MEMBER_PW"	VARCHAR2(30)		NOT NULL,
	"MEMBER_NM"	VARCHAR2(30)		NULL,
	"GRADE_CODE" CHAR(2) NOT NULL,
	"SECESSION_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "AR_MEMBER"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "AR_MEMBER"."MEMBER_ID" IS '회원 아이디';

COMMENT ON COLUMN "AR_MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "AR_MEMBER"."MEMBER_NM" IS '회원 이름';

COMMENT ON COLUMN "AR_MEMBER"."GRADE_CODE" IS '회원 등급 코드';

COMMENT ON COLUMN "AR_MEMBER"."SECESSION_FL" IS '회원 탈퇴 여부';


CREATE TABLE AR_MEMBER_GRADE(
	GRADE_CODE CHAR(2) PRIMARY KEY NOT NULL,
	GRADE_NAME VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN AR_MEMBER_GRADE.GRADE_CODE IS '멤버 등급 코드';

COMMENT ON COLUMN AR_MEMBER_GRADE.GRADE_NAME IS '멤버 등급명';




--DROP TABLE "AR_TANK";



CREATE TABLE "AR_TANK" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"TANK_NO"	NUMBER		NOT NULL,
	"TANK_NAME"	VARCHAR2(30)		NOT NULL,
	"FRESH_SALT"	CHAR(1)	DEFAULT 'S'	NOT NULL,
	"TANK_SIZE"	VARCHAR2(50)		NOT NULL,
	"TANK_FILTER"	VARCHAR2(50)		NULL,
	"TANK_LIGHT"	VARCHAR2(50)		NULL,
	"TANK_ADDICTIVE"	VARCHAR2(50)		NULL,
	"TANK_SUBSTRATE"	VARCHAR2(50)		NULL,
	"DELETE_FL"		CHAR(1) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN "AR_TANK"."TANK_NO" IS '어항 번호';

COMMENT ON COLUMN "AR_TANK"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "AR_TANK"."TANK_NAME" IS '어항 이름';

COMMENT ON COLUMN "AR_TANK"."FRESH_SALT" IS '해수/담수 여부';

COMMENT ON COLUMN "AR_TANK"."TANK_SIZE" IS '어항 크기';

COMMENT ON COLUMN "AR_TANK"."TANK_LIGHT" IS '어항 조명';

COMMENT ON COLUMN "AR_TANK"."TANK_FILTER" IS '여과 방식';

COMMENT ON COLUMN "AR_TANK"."TANK_ADDICTIVE" IS '어항 첨가제';

COMMENT ON COLUMN "AR_TANK"."TANK_SUBSTRATE" IS '어항 바닥재';

COMMENT ON COLUMN "AR_TANK"."DELETE_FL" IS '삭제 여부';

--DROP TABLE "AR_LIVESTOCK";

CREATE TABLE "AR_LIVESTOCK" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"TANK_NO"	NUMBER		NOT NULL,
	"LIVESTOCK_NO"	NUMBER		NOT NULL,
	"LIVESTOCK_SPECIES"	VARCHAR(30)	NOT NULL,
	"LIVESTOCK_NM"	VARCHAR2(30)	NULL,
	"LIVESTOCK_PRICE"	NUMBER		NULL,
	"LIVESTOCK_GENDER"	CHAR(1)	DEFAULT 'M'	NULL,
	"DATE_OF_PURCHASE"	DATE	DEFAULT SYSDATE	NULL,
	"LIFE_OR_DIE_FL"	CHAR(1)	DEFAULT 'L'	NOT NULL,
	"DELETE_FL" CHAR(1) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN "AR_LIVESTOCK"."LIVESTOCK_NO" IS '생물 번호';

COMMENT ON COLUMN "AR_LIVESTOCK"."TANK_NO" IS '어항 번호';

COMMENT ON COLUMN "AR_LIVESTOCK"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "AR_LIVESTOCK"."LIVESTOCK_SPECIES" IS '생물 종류';

COMMENT ON COLUMN "AR_LIVESTOCK"."LIVESTOCK_NM" IS '생물 이름';

COMMENT ON COLUMN "AR_LIVESTOCK"."LIVESTOCK_PRICE" IS '생물 가격';

COMMENT ON COLUMN "AR_LIVESTOCK"."LIVESTOCK_GENDER" IS '생물 성별';

COMMENT ON COLUMN "AR_LIVESTOCK"."DATE_OF_PURCHASE" IS '생물 구입일';

COMMENT ON COLUMN "AR_LIVESTOCK"."LIFE_OR_DIE_FL" IS '생물 생사 여부';

COMMENT ON COLUMN "AR_LIVESTOCK"."DELETE_FL" IS '삭제 여부';

--DROP TABLE "AR_PARAMETER";

CREATE TABLE "AR_PARAMETER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"TANK_NO"	NUMBER		NOT NULL,
	"PARAMETER_NO" NUMBER NOT NULL,
	"PARAM_TEMP"NUMBER	DEFAULT 0	NULL,
	"PARAM_NO3"	NUMBER	DEFAULT 0	NULL,
	"PARAM_PO4"	NUMBER	DEFAULT 0	NULL,
	"PARAM_KH"	NUMBER	DEFAULT 0	NULL,
	"PARAM_Ca"	NUMBER	DEFAULT 0	NULL,
	"PARAM_Mg"	NUMBER	DEFAULT 0	NULL,
	"REG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"DELETE_FL" CHAR(1) DEFAULT 'N' NOT NULL
);

COMMENT ON COLUMN "AR_PARAMETER"."REG_DATE" IS '등록일';

COMMENT ON COLUMN "AR_PARAMETER"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "AR_PARAMETER"."TANK_NO" IS '어항 번호';

COMMENT ON COLUMN "AR_PARAMETER"."PARAMETER_NO" IS '물성치 번호';

COMMENT ON COLUMN "AR_PARAMETER"."PARAM_TEMP" IS '어항 온도';

COMMENT ON COLUMN "AR_PARAMETER"."PARAM_NO3" IS '질산염';

COMMENT ON COLUMN "AR_PARAMETER"."PARAM_PO4" IS '인산염';

COMMENT ON COLUMN "AR_PARAMETER"."PARAM_KH" IS '경도';

COMMENT ON COLUMN "AR_PARAMETER"."PARAM_Ca" IS '칼슘';

COMMENT ON COLUMN "AR_PARAMETER"."PARAM_Mg" IS '마그네슘';

COMMENT ON COLUMN "AR_PARAMETER"."DELETE_FL" IS '삭제 여부';


--DROP TABLE "AR_TODO_LIST";

CREATE TABLE "AR_TODO_LIST" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"TANK_NO"	NUMBER		NOT NULL,
	"TODO_NO"	NUMBER		NOT NULL,
	"TODO_CONTENT"	VARCHAR2(200)		NOT NULL,
	"REG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"TODO_TERM"	DATE	DEFAULT SYSDATE + 7	NOT NULL,
	"CONCLUDED_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"DELETE_FL" CHAR(1) DEFAULT 'N' NOT NULL,
	"CONCLUDED_DATE" DATE NULL
);

COMMENT ON COLUMN "AR_TODO_LIST"."TODO_NO" IS '할 일 번호';

COMMENT ON COLUMN "AR_TODO_LIST"."TANK_NO" IS '어항 번호';

COMMENT ON COLUMN "AR_TODO_LIST"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "AR_TODO_LIST"."TODO_CONTENT" IS '할 일 내용';

COMMENT ON COLUMN "AR_TODO_LIST"."REG_DATE" IS '등록일';

COMMENT ON COLUMN "AR_TODO_LIST"."TODO_TERM" IS '완료 기한';

COMMENT ON COLUMN "AR_TODO_LIST"."CONCLUDED_FL" IS '완료 여부';

COMMENT ON COLUMN "AR_TODO_LIST"."DELETE_FL" IS '삭제 여부';

COMMENT ON COLUMN "AR_TODO_LIST"."CONCLUDED_DATE" IS '완료 처리일';


CREATE TABLE "AR_BREEDING" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BREEDING_NO"	NUMBER		NOT NULL,
	"BREED_SPECIES1"	VARCHAR(50)		NULL,
	"FROM_TANK_NO1"  NUMBER NULL,
	"BREED_SPECIES2"	VARCHAR(50)		NULL,
	"FROM_TANK_NO2" NUMBER NULL,
	"START_DATE"	DATE DEFAULT SYSDATE NOT NULL,
	"END_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"DELETE_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "AR_BREEDING"."BREEDING_NO" IS '브리딩 번호';

COMMENT ON COLUMN "AR_BREEDING"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "AR_BREEDING"."BREED_SPECIES1" IS '브리딩 종1';

COMMENT ON COLUMN "AR_BREEDING"."FROM_TANK_NO1" IS '출신 어항 번호1';

COMMENT ON COLUMN "AR_BREEDING"."BREED_SPECIES2" IS '브리딩 종2';

COMMENT ON COLUMN "AR_BREEDING"."FROM_TANK_NO1" IS '출신 어항 번호2';

COMMENT ON COLUMN "AR_BREEDING"."START_DATE" IS '브리딩 시작일';

COMMENT ON COLUMN "AR_BREEDING"."END_FL" IS '브리딩 종료 여부';

COMMENT ON COLUMN "AR_BREEDING"."DELETE_FL" IS '삭제 여부';

CREATE TABLE "AR_BR_EVENT" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BREEDING_NO"	NUMBER		NOT NULL,
	"EVENT_NO"	NUMBER		NOT NULL,
	"EVENT_CONTENT"	VARCHAR(500)		NULL,
	"REG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"DELETE_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "AR_BR_EVENT"."BREEDING_NO" IS '브리딩 번호';

COMMENT ON COLUMN "AR_BR_EVENT"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "AR_BR_EVENT"."EVENT_NO" IS '댓글 번호';

COMMENT ON COLUMN "AR_BR_EVENT"."EVENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "AR_BR_EVENT"."REG_DATE" IS '댓글 등록일';

COMMENT ON COLUMN "AR_BR_EVENT"."DELETE_FL" IS '삭제 여부';



CREATE TABLE "AR_BOARD"(
	"MEMBER_NO" NUMBER NOT NULL,
	"BOARD_NO" NUMBER NOT NULL,
	"BOARD_TITLE" VARCHAR(500) NOT NULL,
	"BOARD_CONTENT" VARCHAR(4000) NOT NULL,
	"REG_DATE" DATE DEFAULT SYSDATE,
	"READ_COUNT" NUMBER DEFAULT 0,
	"DELETE_FL" CHAR(1) DEFAULT 'N' CHECK(DELETE_FL IN('Y', 'N'))
);

COMMENT ON COLUMN "AR_BOARD"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "AR_BOARD"."BOARD_NO" IS '게시글 번호';
COMMENT ON COLUMN "AR_BOARD"."BOARD_TITLE" IS '게시글 제목';
COMMENT ON COLUMN "AR_BOARD"."BOARD_CONTENT" IS '게시글 내용';
COMMENT ON COLUMN "AR_BOARD"."REG_DATE" IS '게시글 등록일';
COMMENT ON COLUMN "AR_BOARD"."READ_COUNT" IS '게시글 조회수';
COMMENT ON COLUMN "AR_BOARD"."DELETE_FL" IS '게시글 삭제여부';



CREATE TABLE "AR_COMMENT"(
	MEMBER_NO NUMBER NOT NULL,
	BOARD_NO NUMBER NOT NULL,
	COMMENT_NO NUMBER NOT NULL,
	COMMENT_CONTENT VARCHAR(1000) NOT NULL,
	REG_DATE DATE DEFAULT SYSDATE NOT NULL,
	DELETE_FL CHAR(1) DEFAULT 'N' CHECK(DELETE_FL IN('Y', 'N'))
);

COMMENT ON COLUMN "AR_COMMENT"."MEMBER_NO" IS '회원 번호';
COMMENT ON COLUMN "AR_COMMENT"."BOARD_NO" IS '게시글 번호';
COMMENT ON COLUMN "AR_COMMENT"."COMMENT_NO" IS '댓글 번호';
COMMENT ON COLUMN "AR_COMMENT"."COMMENT_CONTENT" IS '댓글 내용';
COMMENT ON COLUMN "AR_COMMENT"."REG_DATE" IS '댓글 등록일';
COMMENT ON COLUMN "AR_COMMENT"."DELETE_FL" IS '댓글 삭제여부';



ALTER TABLE "AR_MEMBER" ADD CONSTRAINT "PK_AR_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "AR_TANK" ADD CONSTRAINT "PK_AR_TANK" PRIMARY KEY (
	"TANK_NO",
	"MEMBER_NO"
);


ALTER TABLE "AR_LIVESTOCK" ADD CONSTRAINT "PK_AR_LIVESTOCK" PRIMARY KEY (
	"LIVESTOCK_NO",
	"TANK_NO",
	"MEMBER_NO"
);

ALTER TABLE "AR_PARAMETER" ADD CONSTRAINT "PK_AR_PARAMETER" PRIMARY KEY (
	"PARAMETER_NO",
	"TANK_NO",
	"MEMBER_NO"
);

ALTER TABLE "AR_TODO_LIST" ADD CONSTRAINT "PK_AR_TODO_LIST" PRIMARY KEY (
	"TODO_NO",
	"TANK_NO",
	"MEMBER_NO"
);

ALTER TABLE "AR_BREEDING" ADD CONSTRAINT "PK_AR_BREEDING" PRIMARY KEY (
	"BREEDING_NO",
	"MEMBER_NO"
);

ALTER TABLE "AR_BR_EVENT" ADD CONSTRAINT "PK_AR_BR_EVENT" PRIMARY KEY (
	"EVENT_NO",
	"BREEDING_NO",
	"MEMBER_NO"
);

ALTER TABLE AR_BOARD ADD CONSTRAINT PK_AR_BOARD PRIMARY KEY (
	BOARD_NO
);

ALTER TABLE AR_COMMENT ADD CONSTRAINT PK_AR_COMMENT PRIMARY KEY (
	MEMBER_NO,
	BOARD_NO,
	COMMENT_NO
);

ALTER TABLE AR_MEMBER ADD CONSTRAINT FK_AR_MEMBER_TO_AR_MEMBER_GRADE FOREIGN KEY (
	GRADE_CODE
)
REFERENCES AR_MEMBER_GRADE (
	GRADE_CODE
);


ALTER TABLE "AR_TANK" ADD CONSTRAINT "FK_AR_MEMBER_TO_AR_TANK_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "AR_MEMBER" (
	"MEMBER_NO"
);


---------------------------------------------------------------------------------





ALTER TABLE "AR_LIVESTOCK" ADD CONSTRAINT "FK_AR_TANK_TO_AR_LIVESTOCK_1" FOREIGN KEY (
	"MEMBER_NO", "TANK_NO"
)
REFERENCES "AR_TANK" (
	"MEMBER_NO", "TANK_NO"
);



ALTER TABLE "AR_PARAMETER" ADD CONSTRAINT "FK_AR_TANK_TO_AR_PARAMETER_1" FOREIGN KEY (
	"MEMBER_NO", "TANK_NO" 
)
REFERENCES "AR_TANK" (
	"MEMBER_NO", "TANK_NO"
);



ALTER TABLE "AR_TODO_LIST" ADD CONSTRAINT "FK_AR_PARAMETER_TO_AR_TODO_LIST_1" FOREIGN KEY (
	 "TANK_NO", "MEMBER_NO"
)
REFERENCES "AR_TANK" (
	 "TANK_NO", "MEMBER_NO"
);


ALTER TABLE "AR_BREEDING" ADD CONSTRAINT "FK_AR_MEMBER_TO_AR_BREEDING_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "AR_MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "AR_BR_EVENT" ADD CONSTRAINT "FK_AR_BREEDING_TO_AR_BR_EVENT_1" FOREIGN KEY (
	"BREEDING_NO", "MEMBER_NO"
)
REFERENCES "AR_BREEDING" (
	"BREEDING_NO", "MEMBER_NO"
);

ALTER TABLE "AR_BOARD" ADD CONSTRAINT "FK_AR_BOARD_TO_AR_MEMBER_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "AR_MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "AR_COMMENT" ADD CONSTRAINT "FK_AR_COMMENT_TO_AR_BOARD_1" FOREIGN KEY (
	"MEMBER_NO", "BOARD_NO"
)
REFERENCES "AR_BOARD" (
	"MEMBER_NO", "BOARD_NO"
);





