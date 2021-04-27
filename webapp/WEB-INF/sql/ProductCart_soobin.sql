
-- *��ٱ��� ���̺� ����
CREATE TABLE tbl_cart(
    cart_id NUMBER NOT NULL PRIMARY KEY,
    user_id VARCHAR2(50) NOT NULL,
    product_id NUMBER NOT NULL,
    amount NUMBER DEFAULT 0
);

-- *��ٱ��� ���̺� ������ ����
CREATE SEQUENCE seq_cart START WiTH 10 INCREMENT BY 1;
COMMIT;

-- *��ٱ��� ���̺� ��������(�ܷ�Ű) ����
-- *ȸ���� ��ٱ��� īƮ �ܷ�Ű ���� �� SNS BNO �κ� �ܷ�Ű ����
ALTER TABLE tbl_cart ADD CONSTRAINT cart_userid_fk FOREIGN KEY(user_id) REFERENCES USER_TBL(user_id);
ALTER TABLE tbl_cart ADD CONSTRAINT cart_product_fk FOREIGN KEY(product_id) REFERENCES TBL_PRODUCT(product_id);
COMMIT;

--��ٱ��� �߰� (�׽�Ʈ)
 INSERT INTO tbl_cart(
            cart_id, user_id, product_id
        ) VALUES (
            seq_cart.NEXTVAL, 'where', 15
        );
        
--��ٱ��� ���  
--��ٱ��� ��ü ��� ����Ʈ
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
-- ��ٱ��� ���� 
-- ��ٱ��� ����
-- ��ٱ��Ͽ� ������ ��ǰ ���ڵ� Ȯ�� 
-- ��ٱ��Ͽ� ������ ��ǰ ���ڵ� Ȯ�� 
-- ��ٱ��Ͽ� ������ ��ǰ�� �����ϸ� ���� 

select * from USER_TBL where user_id = 'where';
select * from tbl_cart where user_id = 'where';

select writer from MP_BOARD;
--*��ٱ��� �߰�
--*��ٱ��� ������
create table tbl_product (
    product_id number primary key --��ǰ��ȣ
    ,product_name VARCHAR(50) null --��ǰ�̸�
    ,product_price VARCHAR2(50) default '0'--��ǰ����
    ,product_desc varchar2(500) null --��ǰ �󼼼���
    ,product_url varchar2(500) null--��ǰ����
);

commit;
--*��ٱ��� ���̺� �÷� Ÿ�� ����
ALTER TABLE tbl_product MODIFY product_price number(12,0);
ALTER TABLE tbl_product MODIFY product_name VARCHAR2(1000);
ALTER TABLE tbl_product MODIFY product_desc VARCHAR2(4000);


 
--*��ٱ���/��ǰ / ȸ�� ����
ALTER TABLE tbl_cart ADD CONSTRAINT cart_userid_fk FOREIGN KEY(user_id) REFERENCES USER_TBL(user_id);
ALTER TABLE tbl_cart ADD CONSTRAINT cart_product_fk FOREIGN KEY(product_id) REFERENCES TBL_PRODUCT(product_id);
COMMIT;

SELECT * FROM TBL_PRODUCT;


-- *��ٱ��� ���̺� ������ ����
CREATE SEQUENCE seq_product START WiTH 10 INCREMENT BY 1;
COMMIT;
SELECT seq_product.NEXTVAL FROM DUAL;


--*��ǰ ���� ���ε� ���̺�
CREATE TABLE PRODUCT_FILE
(
    FILE_NO         NUMBER,                             --���� ��ȣ
    product_id      NUMBER NOT NULL,                    --�Խ��� ��ȣ
    ORG_FILE_NAME   VARCHAR2(260) NOT NULL,             --���� ���� �̸�
    STORED_FILE_NAME VARCHAR2(36) NOT NULL,             --����� ���� �̸�
    FILE_SIZE       NUMBER,                             --���� ũ��
    REGDATE DATE DEFAULT SYSDATE NOT NULL,              --���ϵ����
    DEL_GB VARCHAR2(1) DEFAULT 'N' NOT NULL,            --��������
    PRIMARY KEY(FILE_NO)                                --�⺻Ű FILE_NO
);
--*��ǰ ���� ������ ����
CREATE SEQUENCE SEQ_PRODUCT_FILE
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

--���Ͼ��ε� �߰�(�׽�Ʈ)
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

-- �����/ ����Ʈ�� ����ϸ� �߰� �ϱ�        
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

--���� ����Ʈ 
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

--�Խñ� ��ȣ �˻� 
SELECT   PRODUCT_ID
        ,PRODUCT_NAME
        ,PRODUCT_PRICE
        ,PRODUCT_DESC
  FROM TBL_PRODUCT
 WHERE PRODUCT_ID = 31;
 
--��ǰ��� ��ȸ
SELECT FILE_NO,
       ORG_FILE_NAME,
       STORED_FILE_NAME,
       ROUND(FILE_SIZE/1024,1) AS FILE_SIZE
  FROM PRODUCT_FILE
 WHERE PRODUCT_ID = 31
   AND DEL_GB = 'N';
   
--����� ù��° �빮 ���� 
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

 
 --��ٱ��� �߰�
 INSERT INTO tbl_cart(
            cart_id, user_id, product_id, amount
        ) VALUES (
            seq_cart.NEXTVAL, 'inbv4311', 31, 2
        );
        
select * from tbl_product;
select * from tbl_cart;

 --��ٱ��� ��Ϻ���
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
 
 --��ٱ��� �հ�
 SELECT NVL(SUM(product_price * amount), 0) money
        FROM tbl_cart c, tbl_product p
        WHERE c.product_id = p.product_id AND c.user_id = 'inbv4311';
        
        
   
 SELECT COUNT(*)
        FROM tbl_cart
        WHERE user_id= 'inbv4311' 
        AND product_id = 64;    
     
        
 SELECT cart_id,product_id,user_id
        FROM tbl_cart;
        

--��ǰ ���� ����Ʈ 
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
            