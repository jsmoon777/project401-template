CREATE OR REPLACE PACKAGE SPRING.PKG_MBOARD AS 
  --------------------------------
  -- MENU
  --------------------------------
  PROCEDURE PROC_MENU_INSERT (
      IN_MENU_NAME  IN  VARCHAR2
  );

  PROCEDURE PROC_MENU_LIST (
      O_CUR   OUT   SYS_REFCURSOR
  );

  -------------------------------
  -- BOARD
  -------------------------------
  PROCEDURE  PROC_MBOARD_LIST(
       IN_MENU_ID   IN    VARCHAR
      ,O_CUR        OUT   SYS_REFCURSOR
  );
 
 PROCEDURE  PROC_MBOARD_DATE_LIST(
       IN_MENU_ID   IN    VARCHAR
      ,O_CUR        OUT   SYS_REFCURSOR
  );
 
 PROCEDURE  PROC_MBOARD_LIKE_LIST(
       IN_MENU_ID   IN    VARCHAR
      ,O_CUR        OUT   SYS_REFCURSOR
  );

  PROCEDURE  PROC_MBOARD_INSERT(
      IN_MENU_ID   IN    VARCHAR2,
      IN_TITLE     IN    VARCHAR2,
      IN_CONT      IN    VARCHAR2,
      IN_WRITER    IN    VARCHAR2,
      IN_BNUM      IN    NUMBER, 
      IN_LVL       IN    NUMBER,
      IN_STEP      IN    NUMBER,
      IN_NREF      IN    NUMBER
  );

  PROCEDURE  PROC_MBOARD_VIEW(
        IN_IDX      IN    NUMBER
      , O_CUR       OUT   SYS_REFCURSOR

  );

  PROCEDURE  PROC_MBOARD_UPDATE(
      IN_IDX      IN    NUMBER,
      IN_TITLE    IN    VARCHAR2,
      IN_CONT     IN    VARCHAR2
  );
  
  PROCEDURE   PROC_MBOARD_DELETE(
      IN_IDX     IN     NUMBER
  );

END PKG_MBOARD;
