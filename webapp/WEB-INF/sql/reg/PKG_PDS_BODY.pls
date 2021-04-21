create or replace PACKAGE BODY PKG_PDS AS

  PROCEDURE  PROC_PDS_LIST(
      IN_MENU_ID   IN    VARCHAR2,
      O_CUR        OUT   SYS_REFCURSOR
   ) AS
  BEGIN
     
    OPEN  O_CUR  FOR
      SELECT     IDX,  MENU_ID,
                 LPAD(' ', LVL*3 ) 
                -- ||  DECODE( LVL , 0, '', '[답변]'   )
                     || TITLE AS TITLE,
                 WRITER, REGDATE, READCOUNT,
                 BNUM, LVL, STEP, NREF,
                 DELNUM,
                 (SELECT COUNT(FILE_NUM) 
                    FROM   FILES  F 
                    WHERE  B.IDX = F.IDX  ) AS  FILESCOUNT
       FROM      MBOARD    B
       WHERE     MENU_ID = IN_MENU_ID
       ORDER BY  NREF DESC, STEP ASC;    
      
  END PROC_PDS_LIST;
  
  -- 새글 쓰기, 답글 쓰기
PROCEDURE  PROC_PDS_INSERT
  (
      IN_MENU_ID   IN  VARCHAR2,  
      IN_TITLE     IN  VARCHAR2,      
      IN_CONT      IN  VARCHAR2,
      IN_WRITER    IN  VARCHAR2,           
      IN_BNUM      IN  NUMBER,
      IN_LVL       IN  NUMBER,
      IN_STEP      IN  NUMBER,
      IN_NREF      IN  NUMBER
      
      -- 파일업로드에 대한 추가 항목
     , IN_FILENAME   IN   FILE_ARRAY
     , IN_FILEEXT    IN   FILE_ARRAY
     , IN_SFILENAME  IN   FILE_ARRAY
  ) AS
      V_BNUM    NUMBER(5, 0);
      V_LVL     NUMBER(5, 0);
      V_STEP    NUMBER(5, 0);
      V_NREF    NUMBER(5, 0);  
      
      V_MAXIDX  NUMBER(5, 0);  
  
  BEGIN
    
    IF  IN_BNUM = 0 THEN   
       -- 새글 (BNUM=0, LVL=0, STEP=0, NREF=0) 입력
       -- 새글의 그룹번호(7)로 생성 BNUM=7 , NREF= 7
       -- 글번호 생성
       SELECT  NVL(MAX(BNUM), 0) + 1 INTO V_BNUM FROM MBOARD
         WHERE MENU_ID = IN_MENU_ID;
       
       V_LVL  := 0;
       V_STEP := 0;
       
       SELECT NVL(MAX(NREF),0) + 1 INTO V_NREF FROM MBOARD
         WHERE MENU_ID = IN_MENU_ID;
         
    ELSE                -- 답글 ()
       V_BNUM := IN_BNUM; 
       V_LVL  := IN_LVL  + 1;
       V_STEP := IN_STEP + 1;
       V_NREF := IN_NREF;
       
       -- 기존글들의 순서를 변경
       -- 입력된 글의 STEP과 같거나 큰 글을 증가
       UPDATE   MBOARD
         SET    STEP = STEP + 1
        WHERE   NREF = IN_NREF
         AND    STEP > IN_STEP 
         AND    MENU_ID = IN_MENU_ID;       
    END IF;
    
    
    INSERT INTO  MBOARD 
    (
        IDX
       ,MENU_ID
       ,TITLE 
       ,CONT
       ,WRITER
       ,REGDATE
       ,READCOUNT
       ,BNUM
       ,LVL
       ,STEP
       ,NREF
       ,DELNUM
    )  VALUES
    (
       -- BRDSEQ.NEXTVAL
       (  SELECT NVL(MAX(IDX), 0) + 1
          FROM   MBOARD  )
       ,IN_MENU_ID
       ,IN_TITLE 
       ,IN_CONT
       ,IN_WRITER
       ,TO_CHAR(SYSDATE, 'YYYY-MM-DD')
       ,0
       ,V_BNUM
       ,V_LVL
       ,V_STEP
       ,V_NREF
       ,0
    );
       
    SELECT  MAX(IDX)
      INTO  V_MAXIDX
      FROM  MBOARD;
    
    -- 파일 업로드 추가부분
    IF IN_FILENAME(1) IS NOT NULL THEN
        FOR I  IN  IN_FILENAME.FIRST .. IN_FILENAME.LAST
        LOOP
           INSERT INTO FILES 
           VALUES 
           (
                ( SELECT NVL(MAX(FILE_NUM), 0)+1 FROM FILES )  -- fILES 의 기본키 일련번호
              ,   V_MAXIDX                                     -- 게시판 번호(추가된글의 글번호)
              ,   IN_FILENAME( I )                             -- 파일이름(I), 
              ,   IN_FILEEXT( I )                              -- 확장자(I)
              ,   IN_SFILENAME( I )                            -- 실제파일명(I)
          );      
        END LOOP; 
    END IF;
    
    
  END PROC_PDS_INSERT;

  PROCEDURE   PROC_PDS_VIEW(
       IN_IDX      IN     NUMBER,
       O_CUR       OUT    SYS_REFCURSOR
   ) AS
  BEGIN
     
     UPDATE  MBOARD
      SET    READCOUNT = READCOUNT + 1
      WHERE  IDX       =  IN_IDX; 
     
     OPEN  O_CUR  FOR
       SELECT
           IDX
          ,MENU_ID
          ,TITLE 
          ,CONT
          ,WRITER
          ,REGDATE
          ,READCOUNT
          ,BNUM
          ,LVL
          ,STEP
          ,NREF
          ,DELNUM
       FROM
          MBOARD
       WHERE 
          IDX  = IN_IDX;
     
  END PROC_PDS_VIEW;

  PROCEDURE   PROC_PDS_FILELIST(
       IN_IDX      IN     NUMBER,
       O_CUR       OUT    SYS_REFCURSOR
   ) AS
  BEGIN
     OPEN   O_CUR   FOR
       SELECT   FILE_NUM,
                IDX,
                FILENAME,
                FILEEXT,
                SFILENAME
        FROM    FILES
        WHERE   IDX   =   IN_IDX
        ORDER  BY  FILE_NUM  ASC;
  END PROC_PDS_FILELIST;

  PROCEDURE    PROC_PDS_UPDATE(
       IN_IDX       IN    NUMBER,
       IN_TITLE     IN    VARCHAR2,
       IN_CONT      IN    VARCHAR2,

       IN_FILENAME   IN    FILE_ARRAY, 
       IN_FILEEXT    IN    FILE_ARRAY,
       IN_SFILENAME  IN    FILE_ARRAY
   ) AS
  BEGIN
    
     UPDATE  MBOARD
      SET    TITLE = IN_TITLE,
             CONT  = IN_CONT
      WHERE  IDX   = IN_IDX;
      
    -- 파일 업로드 추가부분
    IF IN_FILENAME(1) IS NOT NULL THEN
        FOR I  IN  IN_FILENAME.FIRST .. IN_FILENAME.LAST
        LOOP
           INSERT INTO FILES 
           VALUES 
           (
                ( SELECT NVL(MAX(FILE_NUM), 0)+1 FROM FILES )  -- fILES 의 기본키 일련번호
              ,   IN_IDX                                     -- 게시판 번호(추가된글의 글번호)
              ,   IN_FILENAME( I )                             -- 파일이름(I), 
              ,   IN_FILEEXT( I )                              -- 확장자(I)
              ,   IN_SFILENAME( I )                            -- 실제파일명(I)
          );      
        END LOOP; 
    END IF;    
      
    commit;  
    
  END PROC_PDS_UPDATE;

  PROCEDURE    PROC_PDS_DELETE(
       IN_IDX       IN    NUMBER,
       IN_NREF      IN    NUMBER, 
       IN_LVL       IN    NUMBER,
       IN_STEP      IN    NUMBER
   ) AS
  BEGIN    
    -- DELNUM = 1 로 수정 : 모든 자료의 delnum =1   
    UPDATE   MBOARD 
      SET    DELNUM  = 1
      WHERE  IDX     =  IN_IDX;
    
    -- 실제 자료 삭제 - 답글 없을 때\
    -- 2. FILES 테이블의 자료를 삭제
     DELETE  FROM  FILES
     WHERE  NOT EXISTS 
      (
         SELECT  1  FROM MBOARD
          WHERE  NREF = IN_NREF
           AND   LVL  = IN_LVL + 1
           AND   STEP = IN_STEP + 1
      )
      AND  IDX  = IN_IDX;
    
    -- 1. MBOARD 자료 삭제     
    DELETE  FROM  MBOARD
     WHERE  NOT  EXISTS 
      (
         SELECT  1  FROM MBOARD
          WHERE  NREF = IN_NREF
           AND   LVL  = IN_LVL + 1
           AND   STEP = IN_STEP + 1
      )
      AND  IDX  = IN_IDX;
    
   
    
    
  END PROC_PDS_DELETE;

END PKG_PDS;