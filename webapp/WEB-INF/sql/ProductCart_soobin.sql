
-- *장바구니 테이블 생성
CREATE TABLE tbl_cart(
    cart_id NUMBER NOT NULL PRIMARY KEY,
    user_id VARCHAR2(50) NOT NULL,
    product_id NUMBER NOT NULL,
    amount NUMBER DEFAULT 0
);

-- *장바구니 테이블 시퀀스 생성
CREATE SEQUENCE seq_cart START WiTH 10 INCREMENT BY 1;
COMMIT;

-- *장바구니 테이블 제약조건(외래키) 생성
-- *회원과 장바구니 카트 외래키 생성 및 SNS BNO 부분 외래키 생성
ALTER TABLE tbl_cart ADD CONSTRAINT cart_userid_fk FOREIGN KEY(user_id) REFERENCES USER_TBL(user_id);
ALTER TABLE tbl_cart ADD CONSTRAINT cart_product_fk FOREIGN KEY(product_id) REFERENCES TBL_PRODUCT(product_id);
COMMIT;

--장바구니 추가 (테스트)
 INSERT INTO tbl_cart(
            cart_id, user_id, product_id
        ) VALUES (
            seq_cart.NEXTVAL, 'where', 15
        );
        
--장바구니 목록  
--장바구니 전체 목록 리스트
SELECT
            c.cart_id AS cartId, 
            c.user_id AS userId,
            p.bno As bno,
            p.title AS title,
            p.writer AS writer
        FROM
            USER_TBL m, mp_board p, tbl_cart c
        WHERE m.user_id = c.user_id
            AND p.bno = c.product_id
            AND c.user_id = 'where'
        ORDER BY
            c.cart_id;
-- 장바구니 수정 
-- 장바구니 삭제
-- 장바구니에 동일한 상품 레코드 확인 
-- 장바구니에 동일한 상품 레코드 확인 
-- 장바구니에 동일한 상품이 존재하면 수정 

select * from USER_TBL where user_id = 'where';
select * from tbl_cart where user_id = 'where';

select writer from MP_BOARD;
--*장바구니 추가
--*장바구니 페이지
create table tbl_product (
    product_id number primary key --상품번호
    ,product_name VARCHAR(50) null --상품이름
    ,product_price VARCHAR2(50) default '0'--상품가격
    ,product_desc varchar2(500) null --상품 상세설명
    ,product_url varchar2(500) null--상품사진
);

commit;
--*장바구니 테이블 컬럼 타입 변경
ALTER TABLE tbl_product MODIFY product_price number(12,0);
ALTER TABLE tbl_product MODIFY product_name VARCHAR2(1000);
ALTER TABLE tbl_product MODIFY product_desc VARCHAR2(4000);


 
--*장바구니/상품 / 회원 연결
ALTER TABLE tbl_cart ADD CONSTRAINT cart_userid_fk FOREIGN KEY(user_id) REFERENCES USER_TBL(user_id);
ALTER TABLE tbl_cart ADD CONSTRAINT cart_product_fk FOREIGN KEY(product_id) REFERENCES TBL_PRODUCT(product_id);
COMMIT;

SELECT * FROM TBL_PRODUCT;


-- *장바구니 테이블 시퀀스 생성
CREATE SEQUENCE seq_product START WiTH 10 INCREMENT BY 1;
COMMIT;
SELECT seq_product.NEXTVAL FROM DUAL;


--*상품 파일 업로드 테이블
CREATE TABLE PRODUCT_FILE
(
    FILE_NO         NUMBER,                             --파일 번호
    product_id      NUMBER NOT NULL,                    --게시판 번호
    ORG_FILE_NAME   VARCHAR2(260) NOT NULL,             --원본 파일 이름
    STORED_FILE_NAME VARCHAR2(36) NOT NULL,             --변경된 파일 이름
    FILE_SIZE       NUMBER,                             --파일 크기
    REGDATE DATE DEFAULT SYSDATE NOT NULL,              --파일등록일
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,            --삭제구분
    PRIMARY KEY(FILE_NO)                                --기본키 FILE_NO
);
--*상품 파일 시퀀스 생성
CREATE SEQUENCE SEQ_PRODUCT_FILE
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

--파일업로드 추가(테스트)
INSERT INTO PRODUCT_FILE(
        FILE_NO,
        PRODUCT_ID,
        ORG_FILE_NAME,
        STORED_FILE_NAME,
        FILE_SIZE
    )VALUES(
        SEQ_PRODUCT_FILE.NEXTVAL,
        31,
        'sdf',
        'sdfsfd',
        263
    );


SELECT  * FROM PRODUCT_FILE;

-- 썸네일/ 리스트에 썸네일만 뜨게 하기        
SELECT 
        F.FILE_NO,
        F.PRODUCT_ID,
	    F.ORG_FILE_NAME,
		F.STORED_FILE_NAME,
        P.PRODUCT_NAME,
        P.PRODUCT_PRICE,
        ROW_NUMBER() OVER ( PARTITION BY P.PRODUCT_ID ORDER BY F.FILE_NO ) CNT
FROM PRODUCT_FILE F,TBL_PRODUCT P
WHERE P.PRODUCT_ID = F.PRODUCT_ID;

select * from tbl_product;

--조인 셀렉트 
SELECT  PRODUCT_ID,STORED_FILE_NAME,PRODUCT_NAME,PRODUCT_PRICE,CNT FROM (
		
		   SELECT 
                F.FILE_NO,
                F.PRODUCT_ID,
                F.ORG_FILE_NAME,
                F.STORED_FILE_NAME,
                P.PRODUCT_NAME,
                P.PRODUCT_PRICE,
                ROW_NUMBER() OVER ( PARTITION BY P.PRODUCT_ID ORDER BY F.FILE_NO ) CNT
            FROM PRODUCT_FILE F,TBL_PRODUCT P
            WHERE P.PRODUCT_ID = F.PRODUCT_ID
		)
		WHERE CNT=1
        ORDER BY PRODUCT_ID DESC;

--게시글 번호 검색 
SELECT   PRODUCT_ID
        ,PRODUCT_NAME
        ,PRODUCT_PRICE
        ,PRODUCT_DESC
  FROM TBL_PRODUCT
 WHERE PRODUCT_ID = 31;
 
--상품목록 조회
SELECT FILE_NO,
       ORG_FILE_NAME,
       STORED_FILE_NAME,
       ROUND(FILE_SIZE/1024,1) AS FILE_SIZE
  FROM PRODUCT_FILE
 WHERE PRODUCT_ID = 31
   AND DEL_GB = 'N';
   
--썸네일 첫번째 대문 파일 
SELECT FILE_NO, STORED_FILE_NAME,CNT FROM(
        SELECT   
               FILE_NO,
               PRODUCT_ID,
               ORG_FILE_NAME,
               STORED_FILE_NAME,
               ROW_NUMBER() OVER ( PARTITION BY PRODUCT_ID ORDER BY FILE_NO ) CNT   
         FROM PRODUCT_FILE
         
 )
 WHERE PRODUCT_ID = 58
 AND CNT=1
 ORDER BY PRODUCT_ID DESC;

 
 --장바구니 추가
 INSERT INTO tbl_cart(
            cart_id, user_id, product_id, amount
        ) VALUES (
            seq_cart.NEXTVAL, 'inbv4311', 31, 2
        );
        
select * from tbl_product;
select * from tbl_cart;

 --장바구니 목록보기
  SELECT
            c.cart_id AS cartId, 
            c.user_id AS userId,
            p.product_id As productId,
            m.user_name AS userName, 
            p.product_name AS productName, 
            c.amount, 
            p.product_price AS productPrice, 
            (product_price * amount) money
        FROM
            user_tbl m, tbl_product p, tbl_cart c
        WHERE m.user_id = c.user_id
            AND p.product_id = c.product_id
            AND c.user_id ='inbv4311'
            
            
        ORDER BY
            c.cart_id;
            
 select * from user_tbl;
 
 --장바구니 합계
 SELECT NVL(SUM(product_price * amount), 0) money
        FROM tbl_cart c, tbl_product p
        WHERE c.product_id = p.product_id AND c.user_id = 'inbv4311';
        
        
   
 SELECT COUNT(*)
        FROM tbl_cart
        WHERE user_id= 'inbv4311' 
        AND product_id = 64;    
     
        
 SELECT cart_id,product_id,user_id
        FROM tbl_cart;
        

--상품 조인 셀렉트 
SELECT  PRODUCT_ID,STORED_FILE_NAME,PRODUCT_NAME,PRODUCT_PRICE,CNT FROM (
		
		   SELECT 
                F.FILE_NO,
                F.PRODUCT_ID,
                F.ORG_FILE_NAME,
                F.STORED_FILE_NAME,
                P.PRODUCT_NAME,
                P.PRODUCT_PRICE,
                ROW_NUMBER() OVER ( PARTITION BY P.PRODUCT_ID ORDER BY F.FILE_NO ) CNT
            FROM PRODUCT_FILE F,TBL_PRODUCT P
            WHERE P.PRODUCT_ID = F.PRODUCT_ID
		)
		WHERE CNT=1
        ORDER BY PRODUCT_ID DESC;

        select 
            stored_file_name,cartId,userId,productId,userName,productName,amount,productPrice,money from(
        select
            c.cart_id as cartId, 
            c.user_id as userId,
            p.product_id as productId,
            m.user_name as userName, 
            p.product_name as productName, 
            c.amount as amount, 
            f.stored_file_name as stored_file_name,
            p.product_price as productPrice, 
            (product_price * amount) money,
            row_number() over ( partition by p.product_id order by f.file_no ) cnt
        from
            user_tbl m, tbl_product p, tbl_cart c , product_file f
        where 
            m.user_id = c.user_id
            and p.product_id = c.product_id
            and p.product_id = f.product_id
            and c.user_id ='inbv4311'
        order by
            c.cart_id
        )
        where cnt = 1;
            