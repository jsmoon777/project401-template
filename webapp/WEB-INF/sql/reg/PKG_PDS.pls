create or replace PACKAGE PKG_PDS AS 
  
   PROCEDURE  PROC_PDS_LIST(
      IN_MENU_ID   IN    VARCHAR2,
      O_CUR        OUT   SYS_REFCURSOR
   );

   PROCEDURE   PROC_PDS_INSERT(
      IN_MENU_ID    IN    VARCHAR2,
      IN_TITLE      IN    VARCHAR2,
      IN_CONT       IN    VARCHAR2,
      IN_WRITER     IN    VARCHAR2,

      IN_BNUM       IN    NUMBER,
      IN_LVL        IN    NUMBER,
      IN_STEP       IN    NUMBER,
      IN_NREF       IN    NUMBER,

      IN_FILENAME   IN    FILE_ARRAY, 
      IN_FILEEXT    IN    FILE_ARRAY,
      IN_SFILENAME  IN    FILE_ARRAY

   );

   PROCEDURE   PROC_PDS_VIEW(
       IN_IDX      IN     NUMBER,
       O_CUR       OUT    SYS_REFCURSOR
   );

   PROCEDURE   PROC_PDS_FILELIST(
       IN_IDX      IN     NUMBER,
       O_CUR       OUT    SYS_REFCURSOR
   );

   PROCEDURE    PROC_PDS_UPDATE(
       IN_IDX       IN    NUMBER,
       IN_TITLE     IN    VARCHAR2,
       IN_CONT      IN    VARCHAR2,

      IN_FILENAME   IN    FILE_ARRAY, 
      IN_FILEEXT    IN    FILE_ARRAY,
      IN_SFILENAME  IN    FILE_ARRAY

   );

   PROCEDURE    PROC_PDS_DELETE(
       IN_IDX       IN    NUMBER,
       IN_NREF      IN    NUMBER,
       IN_LVL       IN    NUMBER,
       IN_STEP      IN    NUMBER
   );


















END PKG_PDS;