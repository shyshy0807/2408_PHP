-- DB 생성
-- CREATE DATABASE shop;


-- DB 선택실행
USE shop;


-- DB 삭제 
-- DROP DATABASE shop;




-- ------------------
-- 테이블 생성
-- ------------------

CREATE TABLE users (
	id					BIGINT(20)		PRIMARY KEY		AUTO_INCREMENT
	,NAME 			VARCHAR(50) 	NOT NULL 
	,addr				VARCHAR(150)	NOT NULL
	,gender			CHAR(1)			NOT NULL 		COMMENT 'M=남자, F=여자'
	,tel 				VARCHAR(20)		NOT NULL 		COMMENT '- 제외 숫자'
	,created_at 	TIMESTAMP 		NOT NULL 		DEFAULT CURRENT_TIMESTAMP()
	,updated_at 	TIMESTAMP 		NOT NULL 		DEFAULT CURRENT_TIMESTAMP()
	,deleted_at 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP()
);


CREATE TABLE orders (
	id					BIGINT(20)		PRIMARY KEY		AUTO_INCREMENT
	,user_id			BIGINT(20)		NOT NULL 						
	,order_id 		VARCHAR(50)		NOT NULL 
	,total_Price	BIGINT(20)		NOT NULL 
	,created_at 	TIMESTAMP 		NOT NULL 		DEFAULT CURRENT_TIMESTAMP()
	,updated_at 	TIMESTAMP 		NOT NULL 		DEFAULT CURRENT_TIMESTAMP()
	,deleted_at 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE products (
	id					BIGINT(20)		PRIMARY KEY		AUTO_INCREMENT
	,product_name	VARCHAR(100)	NOT NULL
	,Price			BIGINT(20)		NOT NULL 
	,created_at 	TIMESTAMP 		NOT NULL 		DEFAULT CURRENT_TIMESTAMP()
	,updated_at 	TIMESTAMP 		NOT NULL 		DEFAULT CURRENT_TIMESTAMP()
	,deleted_at 	TIMESTAMP 		DEFAULT CURRENT_TIMESTAMP()
);



-- ------------------
-- 테이블 제거
-- ------------------
-- DROP TABLE orders;
-- 
-- DROP TABLE orders, products;
-- ------------------
-- ------------------
-- 테이블 비우기
-- ------------------
-- TRUNCATE users;
-- DDL 이력 안남겨서 삭제 하면 복구할수 없어요


-- ------------------------------------
-- ALTER:테이블의 구조를 수정하는 문
-- ------------------------------------

-- ALTER TABLE [테이블명] 
-- ADD CONSTRAINT [CONSTRAINT] 
-- FOREIGN KEY (CONSTRAINT 부여 컬럼명) 
-- REFERENCES 참조테이블명(참조테이블 컬럼명) 
-- [ON DELETE 동작 / ON UPDATE 동작];
-- 
ALTER TABLE orders
ADD CONSTRAINT fk_orders_user_id
FOREIGN KEY (user_id)
REFERENCES users(id);

-- ------------------------------------
-- 컬럼 수정
-- ------------------------------------
-- ALTER TABLE users
-- MODIFY COLUMN id BIGINT(20) PRIMARY KEY AUTO_INCREMENT UNSIGNED 
-- ;
-- 

-- ALTER TABLE users
-- MODIFY COLUMN addr VARCHAR(100) NOT NULL 
-- ;


ALTER TABLE users
ADD COLUMN birth DATE NOT NULL 
;

-- ------------------------------------
-- 컬럼 제거
-- ------------------------------------
ALTER TABLE users
ADD COLUMN birth 
;


-- --pk부호 없음 추가
ALTER TABLE users
MODIFY COLUMN id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT 
;
-- bigint랑 unsiged 위치 중요 notnull 뺴도 됨


ALTER TABLE orders
MODIFY COLUMN user_id BIGINT(20) UNSIGNED NOT NULL 
;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_user_id
FOREIGN KEY(user_id)
REFERENCES users(id);


