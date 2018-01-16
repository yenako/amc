DROP TABLE users;
DROP TABLE movie;
DROP TABLE wishlist;
DROP TABLE movieComment;
DROP TABLE screenContent;
DROP TABLE booking;
DROP TABLE alarm;
DROP TABLE product;
DROP TABLE transaction;
DROP TABLE freeboard;
DROP TABLE freeboardcomment;



DROP SEQUENCE seq_user_no;
DROP SEQUENCE seq_movie_no;
DROP SEQUENCE seq_wish_no;
DROP SEQUENCE seq_movie_comment_no;
DROP SEQUENCE seq_screencontent_no;
DROP SEQUENCE seq_booking_booking_no;
DROP SEQUENCE seq_alarm_no;
DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_order_no;
DROP SEQUENCE seq_freeboard_freeboard_no;
DROP SEQUENCE seq_freeboard_comment2_no;



CREATE SEQUENCE seq_user_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_movie_no 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_wish_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_movie_comment_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_screencontent_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_booking_booking_no	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_alarm_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_product_prod_no			 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_order_no		 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_freeboard_freeboard_no 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_freeboard_comment_no 	INCREMENT BY 1 START WITH 10000;



CREATE SEQUENCE seq_transaction_IMP_ID_no INCREMENT BY 1 START WITH 10000;




CREATE TABLE users ( 
	user_id 			 VARCHAR2(50)		 NOT NULL,
	user_name 		 VARCHAR2(50)		 NOT NULL,
	password 		 VARCHAR2(20)		 NOT NULL,
	role 				 VARCHAR2(20) 		 DEFAULT 'user',
	addr 			 VARCHAR2(100),
	addr_detail		 VARCHAR2(100),
	user_regdate 		 DATE,
	birth				 DATE				 NOT NULL,
	phone1	  		 VARCHAR2(5)		 NOT NULL,
	phone2	  		 VARCHAR2(5)		 NOT NULL,
	phone3	  		 VARCHAR2(5)		 NOT NULL,
	sl_yn	  		 CHAR(1)	 		 NOT NULL,
	gender			 CHAR(1)			 NOT NULL,
	uuid				 VARCHAR2(50),	
	deleteuser_flag	 CHAR(1)			 DEFAULT 'N',
	PRIMARY KEY(user_id)
);


CREATE TABLE movie ( 
	movie_no 				 NUMBER			NOT NULL,
	movie_regdate 			 	 DATE,
	movie_opendate 			 	 DATE			NOT NULL,
	movie_enddate 			 	 DATE			NOT NULL,
	movie_title 			 	 VARCHAR2(50)		NOT NULL,
	poster 					 VARCHAR2(100)		NOT NULL,
	director 				 VARCHAR2(200)		NOT NULL,
	actor 					 VARCHAR2(200)		NOT NULL,
	genre 					 VARCHAR2(200)		NOT NULL,
	rating 					 VARCHAR2(50)		NOT NULL,
	runningtime 			 	 NUMBER			NOT NULL,
	synopsis 				 VARCHAR2(2000),
	steelcut 				 VARCHAR2(1000),
	trailer 				 VARCHAR2(500),
	male_count 				 NUMBER,
	female_count 			 	 NUMBER,
	age10s 					 NUMBER,
	age20s 					 NUMBER,
	age30s 					 NUMBER,
	age40s 					 NUMBER,
	age50s 					 NUMBER,
	age60s 					 NUMBER,
	age60more 				 NUMBER,
	PRIMARY KEY(movie_no)
);

CREATE TABLE wishlist ( 
	wish_no		NUMBER	NOT NULL,
	user_id		VARCHAR2(50)	NOT NULL	REFERENCES users(user_id),
	screencontent_no	NUMBER	NOT NULL	REFERENCES screencontent(screencontent_no),
	wish_regdate DATE,
	PRIMARY KEY(wish_no)
);

CREATE TABLE moviecomment(
	moviecommnet_no NUMBER NOT NULL,
	user_id VARCHAR2(50) NOT NULL REFERENCES users(user_id),
	movie_no NUMBER NOT NULL REFERENCES movie(movie_no),
	moviecomment VARCHAR2(400) NOT NULL,
	moviecomment_regdate DATE NOT NULL,
	blindcomment_flag CHAR(1),
	PRIMARY KEY(moviecommnet_no)
);

CREATE TABLE screencontent(
	screencontent_no NUMBER NOT NULL, 
	movie_no NUMBER NOT NULL REFERENCES movie(movie_no),
	screencontent_regdate DATE, 
	screen_date DATE NOT NULL,
	screen_opentime DATE NOT NULL,
	screen_endtime DATE NOT NULL,
	screen_theater CHAR(1) NOT NULL,
	ticket_price NUMBER NOT NULL,
	preview_flag CHAR(1),
	preview_title VARCHAR2(50),
	ticket_opendate DATE,
	invite_actor VARCHAR2(50),
	PRIMARY KEY(screencontent_no)	
);

CREATE TABLE booking ( 
	booking_no	 	CHAR(6)	 	NOT NULL, 
	imp_id 		 	VARCHAR2(50), 
	user_id 		 	VARCHAR2(50) 	NOT NULL REFERENCES users(user_id), 
	screencontent_no	 	NUMBER	 	NOT NULL REFERENCES screencontent(screencontent_no), 
	booking_regdate	 	DATE	 	NOT NULL, 
	head_count	 	NUMBER	 	NOT NULL, 
	total_ticketprice	 	NUMBER	 	NOT NULL, 
	bookingseat_no	 	VARCHAR2(30) 	NOT NULL, 
	qr_url	 	 	VARCHAR2(200) 	NOT NULL,  
	PRIMARY KEY(booking_no)
);


CREATE TABLE alarm ( 
	alarm_no		NUMBER	NOT NULL,
	screencontent_no	NUMBER	NOT NULL	REFERENCES screencontent(screencontent_no),
	user_id			VARCHAR2(50)	NOT NULL	REFERENCES users(user_id),
	alarm_regdate		DATE,
	alarm_flag		CHAR(1) NOT NULL,
	alarmseat_no		VARCHAR2(5),
	PRIMARY KEY(alarm_no)
);



CREATE TABLE product ( 
	prod_no 					 NUMBER 				 NOT NULL,
	prod_type				 CHAR(1)	 			 NOT NULL,
	prod_image				 VARCHAR2(100),
	prod_name 				 VARCHAR2(50)			 NOT NULL,
	prod_detail 				 VARCHAR2(100), 
	prod_set_info				 VARCHAR2(100),
	sales_opendate			 DATE					 NOT NULL,
	sales_enddate			 DATE					 NOT NULL,
	prod_price				 NUMBER				 DEFAULT '0',
	total_stock				 NUMBER				 NOT NULL,
	sales_stock				 NUMBER				 DEFAULT '0',
	stock					 NUMBER				 NOT NULL,
	prod_regdate 			 DATE,
	expiry_date				 NUMBER				 DEFAULT '0',
	PRIMARY KEY(prod_no)
);

CREATE TABLE transaction ( 
	order_no 		 		 CHAR(6) 				 NOT NULL,
	receiver_name    			 VARCHAR2(50) 			 NOT NULL,
	payment_option			 VARCHAR2(20)			 NOT NULL,
	addr_dlvy				 VARCHAR2(100),
	addr_dlvydetail			 VARCHAR2(100),
	order_stock				 NUMBER				 NOT NULL,
	receiver_phone1			 VARCHAR2(5)			 NOT NULL,
	receiver_phone2			 VARCHAR2(5)			 NOT NULL,
	receiver_phone3			 VARCHAR2(5)			 NOT NULL,
	total_prodprice			 NUMBER				 DEFAULT '1',
	tran_code				 CHAR(1),
	order_regdate			 DATE					 NOT NULL,
	prod_no 		 			 NUMBER	 			 NOT  NULL  REFERENCES  product(prod_no),
	user_id 		 			 VARCHAR2(50) 			 NOT  NULL  REFERENCES  users(user_id),
	imp_id					 VARCHAR2(50),
	PRIMARY  KEY(order_no)
);

CREATE TABLE freeboard ( 
	freeboard_no	 	NUMBER	 	NOT NULL,
	freeboard_title 	 	VARCHAR2(50) 	NOT NULL,
	user_id 		 	VARCHAR2(50) 	NOT NULL REFERENCES users(user_id),
	freeboard_regdate	 	DATE, 
	freeboard_views	 	NUMBER, 
	freeboard_image	 	VARCHAR2(300), 
	freeboard_content	 	VARCHAR2(4000) 	NOT NULL,
	PRIMARY KEY(freeboard_no)
);


CREATE TABLE freeboardcomment ( 
	comment_no  	NUMBER	  	NOT NULL,
	freeboard_no 	NUMBER	  	NOT NULL REFERENCES freeboard(freeboard_no),
	user_id 	  	VARCHAR2(50)  	NOT NULL REFERENCES users(user_id),
	comment_regdate 	DATE,  
	parent_no	  	NUMBER,  
	comment_content  	VARCHAR2(400)  	NOT NULL,
	PRIMARY KEY(comment_no)
);



INSERT 
INTO users ( user_id, user_name, password, role, addr, addr_detail, user_regdate, birth, phone1, phone2, phone3,  sl_yn, gender, uuid, deleteuser_flag ) 
VALUES ( 'admin', 'admin', '1234', 'admin', '서울시', '서초구', SYSDATE, to_date('2012/12/14', 'YYYY/MM/DD'), 010, 4574, 4514, 'y', 'M', 'admin@mvc.com', '1');

INSERT 
INTO users ( user_id, user_name, password, role, addr, addr_detail, user_regdate, birth, phone1, phone2, phone3,  sl_yn, gender, uuid, deleteuser_flag ) 
VALUES ( 'manager', 'manager', '1234', 'admin', '서울시', '서초구', SYSDATE, to_date('2012/12/14', 'YYYY/MM/DD'), 010, 4574, 4514, 'y', 'M', 'admin@mvc.com', '1');


INSERT 
INTO movie ( movie_no, movie_regdate, movie_opendate, movie_enddate, movie_title, poster , director , actor ,  genre ,rating , runningtime , 
synopsis , steelcut , trailer, male_count , female_count , age10s , age20s , age30s , age40s , age50s , age60s , age60more ) 
VALUES ( seq_movie_no.nextval,SYSDATE , to_date('2017/10/13', 'YYYY/MM/DD'),to_date('2017/10/30', 'YYYY/MM/DD'), '킹스맨', 'http://imgmovie.naver.com/mdi/mit110/1506/150637_P77_112037.jpg',
'황동혁','이병헌,김윤석,박해일,고수,박희순,조우진','  사극,드라마',' 15세이상관람가',80,'줄거리','Mic-Animation.gif','트레일러',50,50,10,10,15,15,20,20,10);


INSERT
INTO wishlist VALUES (seq_wish_no.nextval, 'manager', 10000);

INSERT
INTO moviecomment VALUES( seq_movie_comment_no.nextval, 'manager', 10000, '안녕하세용', to_date(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),'0');

INSERT
INTO screencontent VALUES(seq_screencontent_no.nextval, 10000, SYSDATE,to_date('2017/10/20','YYYY/MM/DD'),to_date('2017/10/20 12:00','YYYY/MM/DD HH24:MI'), to_date('2017/10/20 15:00','YYYY/MM/DD HH24:MI'),'1', 20000,'Y','범죄도시', to_date('2017/10/18 18:00','YYYY/MM/DD HH24:MI'),'마동석, 윤계상');

INSERT
INTO booking VALUES ('b'||seq_booking_booking_no.nextval, 'aaa111', 'manager', 10000,  SYSDATE, 1, 9000, 'A7', 'temporary_qr_url_address');

INSERT
INTO alarm VALUES ( seq_alarm_no.nextval, 10000,'manager', sysdate, 'C', 'A13'); 

INSERT INTO product 
VALUES (seq_product_prod_no.nextval,'G','AHlbAAAAtBqyWAAA.jpg','뚝배기', '한그릇하실래예', '할린데예', to_date('2012/12/14', 'YYYY/MM/DD'),
		to_date('2012/12/14', 'YYYY/MM/DD'), 10000000,100, 100, 100, SYSDATE, '0' );

INSERT INTO transaction
VALUES ('p'||seq_transaction_order_no.nextval,'뚝배기','카카오페이','서울시', '강남구', 100, 010, 4574, 4514,'20000','1', to_date('2012/12/14', 'YYYY/MM/DD'),
		 10000, 'admin', '1000');

INSERT INTO freeboard VALUES (seq_freeboard_freeboard_no.nextval, '자유게시판 공지입니다.', 'manager', sysdate, 13, 'temporary_image_filename', '안녕하세요 AMERICODE CINEMA 관리자입니다. 이 글은 자유게시판 공지글입니다.');
	

INSERT INTO freeboardcomment VALUES (seq_freeboard_comment_no.nextval, 10000, 'manager', SYSDATE, 0, '첫번째 댓글입니다');

