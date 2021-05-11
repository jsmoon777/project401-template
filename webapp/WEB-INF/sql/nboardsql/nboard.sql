
-----------------------------------공지테이블
create table notice(
NNO	NUMBER		
,TITLE	VARCHAR2(100 BYTE)		
,CONTENT	VARCHAR2(2000 BYTE)		
,WRITER	VARCHAR2(100 BYTE)		
,REGDATE	DATE	default	SYSDATE
);

commit;

select * from notice;

 CREATE SEQUENCE notice_SEQ
        START WITH 1
        INCREMENT BY 1;
        
 INSERT INTO NOTICE(    NNO 
	   					       , TITLE 
	   					       , CONTENT 
	   					       , WRITER  )
	                  VALUES(    1
	                 		   , 'ㄴㅇㄹ'
	                 		   , 'ㄴㅇㄹ'
	                 		   ,'ㄴㅇㄹㄴ'  );        
        
       
SELECT notice_SEQ.NEXTVAL FROM DUAL;


---------------------------------공지테이블조회수

ALTER TABLE NOTICE ADD(HIT NUMBER DEFAULT 0);  


---------------------------------공지테이블파일쪽 sql

create table noticefile(
    FILE_NO	NUMBER
    ,NNO	NUMBER
    ,ORG_FILE_NAME	VARCHAR2(260 BYTE)
    ,STORED_FILE_NAME	VARCHAR2(36 BYTE)
    ,FILE_SIZE	NUMBER
    ,REGDATE	DATE
    ,DEL_GB	VARCHAR2(1 BYTE)
  );
        
select * from noticefile;        
        
CREATE SEQUENCE SEQ_noticefile
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;        
        
commit;


INSERT INTO noticefile(
			FILE_NO,
			NNO,
			ORG_FILE_NAME,
			STORED_FILE_NAME
		)VALUES(
			SEQ_noticefile.NEXTVAL,
			1,
			'ㄴㅇ',
			'ㄴㅇㄹ'
		);
        
    
        
------------------------------- 조인

	SELECT NOTICEFILE.FILE_NO,
           NOTICEFILE.ORG_FILE_NAME,
           notice.nno
    FROM NOTICEFILE
    join notice on notice.nno = noticefile.nno
    WHERE NOTICEFILE.NNO =30
        
        
-------------------------------------------------------페이징 더미용 쿼리

insert into NOTICE(nno, title, content, writer)
select NOTICE_seq.nextval, title, content, writer from NOTICE;
commit;        
        