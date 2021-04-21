CREATE OR REPLACE PACKAGE BODY SPRING.PKG_MBOARD AS

  PROCEDURE PROC_MENU_INSERT (
      IN_MENU_NAME  IN  VARCHAR2
  ) AS
  
     V_MENU_ID    CHAR(6);
     V_MENU_SEQ   NUMBER(5, 0);
  
  BEGIN
     SELECT  'MENU' || TRIM( TO_CHAR( TO_NUMBER(
        SUBSTR( NVL(MAX(MENU_ID), 'MENU00'), 5, 2) ) + 1, '00' ))
       INTO   V_MENU_ID
       FROM   MENUS;
      
     SELECT  NVL(MAX(MENU_SEQ), 0) + 1
      INTO   V_MENU_SEQ
      FROM   MENUS;
       
     INSERT  INTO  MENUS ( MENU_ID, MENU_NAME, MENU_SEQ )
      VALUES ( V_MENU_ID, IN_MENU_NAME, V_MENU_SEQ);
      
     COMMIT; 
  END PROC_MENU_INSERT;

  PROCEDURE PROC_MENU_LIST (
      O_CUR   OUT   SYS_REFCURSOR
  ) AS
  BEGIN
    OPEN O_CUR FOR
     SELECT     MENU_ID, MENU_NAME, MENU_SEQ
      FROM      MENUS
      ORDER BY  MENU_SEQ ASC;
    
  END PROC_MENU_LIST;

----------------------------------------------------

  PROCEDURE  PROC_MBOARD_LIST(
        IN_MENU_ID    IN    VARCHAR
      , O_CUR         OUT    SYS_REFCURSOR
  ) AS
  BEGIN   
     OPEN  O_CUR  FOR
       SELECT     IDX, MENU_ID,        
                  LPAD(' ', LVL * 2 )  || DECODE(LVL, 0, '', '[RE]') 
                    || TITLE AS TITLE, 
                  WRITER,
                  REGDATE, READCOUNT,
                  BNUM, LVL, STEP, NREF, LIKENUM
        FROM      MBOARD
        WHERE     MENU_ID = IN_MENU_ID
        ORDER  BY NREF DESC, STEP ASC; -- 답글 로직
      --  ORDER BY  IDX DESC;     
     
  END PROC_MBOARD_LIST;
 
 PROCEDURE  PROC_MBOARD_LIKE_LIST(
        IN_MENU_ID    IN    VARCHAR
      , O_CUR         OUT    SYS_REFCURSOR
  ) AS
  BEGIN   
     OPEN  O_CUR  FOR
       SELECT * 
	   FROM MBOARD m 
	   WHERE LIKENUM IS NOT NULL 
	   		 AND MENU_ID = IN_MENU_ID
	   		 AND ROWNUM() <= 6
	   ORDER BY LIKENUM DESC;
      --  ORDER BY  IDX DESC;     
     
  END PROC_MBOARD_LIKE_LIST;
 
 PROCEDURE  PROC_MBOARD_DATE_LIST(
        IN_MENU_ID    IN    VARCHAR
      , O_CUR         OUT    SYS_REFCURSOR
  ) AS
  BEGIN   
     OPEN  O_CUR  FOR
       SELECT * 
	   FROM MBOARD m 
	   WHERE MENU_ID = IN_MENU_ID
	   		 AND ROWNUM() <= 6
	   ORDER BY REGDATE DESC;
     
  END PROC_MBOARD_DATE_LIST;

  PROCEDURE  PROC_MBOARD_INSERT(
      IN_MENU_ID   IN    VARCHAR2,
      IN_TITLE     IN    VARCHAR2,
      IN_CONT      IN    VARCHAR2,
      IN_WRITER    IN    VARCHAR2,
      IN_BNUM      IN    NUMBER, 
      IN_LVL       IN    NUMBER,
      IN_STEP      IN    NUMBER,
      IN_NREF      IN    NUMBER
  ) AS
      V_IDX    NUMBER(5, 0);   
      V_BNUM   NUMBER(5, 0); 
      V_LVL    NUMBER(5, 0); 
      V_STEP   NUMBER(5, 0); 
      V_NREF   NUMBER(5, 0);   
  BEGIN   
    -- 전체 기본키 : 전체 글번호
    SELECT  NVL(MAX(IDX), 0)+1 
     INTO   V_IDX
     FROM   MBOARD;
    
    IF  IN_BNUM  = 0 THEN  -- 새글이면
        -- 해당메뉴의  글번호 
        SELECT   NVL(MAX(BNUM), 0) + 1 
          INTO   V_BNUM
          FROM   mboard
          WHERE  MENU_ID = IN_MENU_ID;
      
        V_LVL   := 0;
        V_STEP  := 0;
       
        SELECT  NVL(MAX(NREF), 0) + 1
          INTO  V_NREF
          FROM  MBOARD
          WHERE MENU_ID = IN_MENU_ID;
       
    ELSE
       -- 답글 처리
       V_BNUM  :=  IN_BNUM;
       V_LVL   :=  IN_LVL   + 1;
       V_STEP  :=  IN_STEP  + 1;
       
       UPDATE  MBOARD SET STEP = STEP + 1
        WHERE  MENU_ID =  IN_MENU_ID
        AND    NREF    =  IN_NREF
        AND    STEP    >  IN_STEP;    
       
       V_NREF  :=  IN_NREF;    
    
    END IF;
  
    INSERT  INTO MBOARD (
         IDX
       , MENU_ID
       , TITLE
       , CONT
       , WRITER
       , REGDATE
       , READCOUNT
       , BNUM
       , LVL
       , STEP
       , NREF
    ) VALUES ( 
         V_IDX
       , IN_MENU_ID
       , IN_TITLE
       , IN_CONT
       , IN_WRITER
       , ( TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS' ) )
       , 0
       , V_BNUM
       , V_LVL
       , V_STEP
       , V_NREF
    );
       
  END PROC_MBOARD_INSERT;

  PROCEDURE  PROC_MBOARD_VIEW(
        IN_IDX      IN    NUMBER
      , O_CUR       OUT   SYS_REFCURSOR      
  ) AS
  BEGIN
    OPEN  O_CUR FOR
      SELECT 
       IDX, 
       MENU_ID,
       TITLE,
       CONT,
       WRITER,
       REGDATE,
       READCOUNT,
       BNUM,
       LVL,
       STEP,
       NREF,
       LIKENUM
     FROM   MBOARD
     WHERE  IDX = IN_IDX;
  END PROC_MBOARD_VIEW;

  PROCEDURE  PROC_MBOARD_UPDATE(
      IN_IDX      IN    NUMBER,
      IN_TITLE    IN    VARCHAR2,
      IN_CONT     IN    VARCHAR2
  ) AS
  BEGIN
    UPDATE  MBOARD
     SET    TITLE = IN_TITLE,
            CONT  = IN_CONT
     WHERE  IDX   = IN_IDX;
     COMMIT;
            
  END PROC_MBOARD_UPDATE;

  PROCEDURE   PROC_MBOARD_DELETE(
      IN_IDX     IN     NUMBER
  ) AS
  BEGIN
     DELETE  FROM  MBOARD
      WHERE  IDX   =  IN_IDX;
     COMMIT;  
  END PROC_MBOARD_DELETE;

END PKG_MBOARD;