C:\Users\user>sqlplus /nolog
SQL> conn /as sysdba
Connected.
SQL> create user spring identified by 1234;
User created.
SQL> grant CONNECT, RESOURCE to spring;
Grant succeeded.
SQL>
-------------------------------------------------------
CREATE TABLE  MENUS
(
     MENU_ID    CHAR(6)       NOT NULL PRIMARY KEY
   , MENU_NAME  VARCHAR2(100) NOT NULL
   , MENU_SEQ   NUMBER(5, 0)  NOT NULL
);

-- 초기 data 등록
INSERT INTO  MENUS (MENU_ID, MENU_NAME, MENU_SEQ)
 VALUES  ( 'MENU01', '카페', 1  );
 VALUES  ( 'MENU02', '맛집', 2  );
 VALUES  ( 'MENU03', '기타', 3  );
commit; 

 -- 게시물 목록
CREATE TABLE MBOARD
(
      IDX        NUMBER(5, 0)    NOT NULL PRIMARY KEY
    , MENU_ID    CHAR(6)         NOT NULL
    , TITLE      VARCHAR2(200)   NOT NULL
    , CONT       VARCHAR2(4000)  NOT NULL
    , WRITER     VARCHAR2(50)    NOT NULL
    , REGDATE    VARCHAR2(50)    NOT NULL
    , READCOUNT  NUMBER(5, 0)    NOT NULL
    
    , BNUM       NUMBER(5, 0)    NOT NULL
    , LVL        NUMBER(5, 0)    NOT NULL
    , STEP       NUMBER(5, 0)    NOT NULL
    , NREF       NUMBER(5, 0)    NOT NULL
);

-- PKG_PDS
-- 칼럼 추가 (delnum) 삭제 표시 DELNUM: 1 -> 삭제된 자료 
ALTER TABLE   MBOARD 
  ADD ( DELNUM  NUMBER(1, 0) );

-- 추가된 칼럼에 초기값 설정  
UPDATE  MBOARD
  SET  DELNUM = 0;
commit;  

  -- 게시글(MBoard) 과 관련된 파일목록
CREATE TABLE  FILES
(
    FILE_NUM    NUMBER(5, 0)  NOT NULL
   , IDX        NUMBER(5, 0)  NOT NULL
   , FILENAME   VARCHAR2(300) NOT NULL
   , FILEEXT    VARCHAR2(30)  NOT NULL
   , SFILENAME  VARCHAR2(300) NOT NULL   
   , CONSTRAINT  FILES_PK   PRIMARY KEY
     (     
         FILE_NUM,
         IDX
     )
   , CONSTRAINT  FK_MBOARD_FILES_IDX
      FOREIGN KEY (IDX)
      REFERENCES  MBOARD (IDX)
      --   ON DELETE CASCADE
);

ALTER TABLE MBOARD ADD (LIKENUM INT);
ALTER TABLE MBOARD MODIFY (LIKENUM DEFAULT 0);

















