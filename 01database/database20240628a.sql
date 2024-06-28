use naverdb;

create table member (
     mem_id          CHAR(8) PRIMARY KEY 	not null,
     mem_name        VARCHAR(10)			not null,
     mem_number      TINYINT				not null,
     addr		     CHAR(2)				not null,
     phone1		     CHAR(3)				null,
     phone2		     CHAR(8)				null,
     height		     TINYINT				null,
     debut_date	     DATE				 	null
); 

DESC member;

create table buy (
     num          	 INT	 	PRIMARY KEY not null,
     mem_id		     CHAR(8)				null,
	 prod_name		 CHAR(6)				not null,
     group_name		 CHAR(4)				null,
     price		     INT		UNSIGNED	not null,
     amount		     SMALLINT	UNSIGNED	not null
); 

DESC buy;

INSERT INTO `member`
(mem_id, mem_name, mem_number, addr, phone1, phone2, height, debut_date)
VALUES ('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');

ALTER TABLE `member`
MODIFY `height` INT;

INSERT INTO `member`
(mem_id, mem_name, mem_number, addr, phone1, phone2, height, debut_date)
VALUES ('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19');

-- member 테이블 데이터 삽입
INSERT INTO `member` (mem_id, mem_name, mem_number, addr, phone1, phone2, height, debut_date)
VALUES 
('BLK', '블랙핑크', 4, '서울', '02', '22222222', 162, '2016-08-08'),
('WNM', '여자친구', 6, '경기', '031', '33333333', 166, '2015-01-16'),
('OMY', '오마이걸', 7, '서울', '02', '44444444', 164, '2015-04-21'),
('GRL', '소녀시대', 8, '서울', '02', '55555555', 163, '2007-08-05'),
('ITZ', '있지', 5, '강원', '033', '66666666', 167, '2019-02-12'),
('RED', '레드벨벳', 5, '서울', '02', '77777777', 161, '2014-08-01'),
('APN', '에이핑크', 6, '경기', '031', '88888888', 164, '2011-04-19'),
('SPC', '우주소녀', 13, '서울', '02', '99999999', 160, '2016-02-25'),
('MMU', '마마무', 4, '전남', '061', '90909090', 165, '2014-06-19');

-- buy 테이블 데이터 삽입
INSERT INTO `buy` (num, mem_id, prod_name, group_name, price, amount)
VALUES 
(1, 'BLK', '지갑', '잡화', 30, 2),
(2, 'BLK', '액세서리', '디지털', 100, 1),
(3, 'APN', '이어폰', '디지털', 200, 1),
(4, 'MMU', '아이폰', '디지털', 200, 5),
(5, 'BLK', '청바지', '패션', 50, 3),
(6, 'MMU', '에어컨', '디지털', 400, 2),
(7, 'GRL', '운동화', '패션', 35, 1),
(8, 'APN', '운동화', '패션', 40, 1),
(9, 'MMU', '운동화', '패션', 50, 2),
(10, 'MMU', '지갑', '잡화', 15, 3),
(11, 'APN', '운동화', '패션', 15, 1),
(12, 'MMU', '지갑', '잡화', 15, 1);

-- buy 테이블 데이터 업데이트
UPDATE `buy` SET prod_name = '지갑', group_name = NULL, price = 30, amount = 2 WHERE num = 1;
UPDATE `buy` SET prod_name = '맥북프로', group_name = '디지털', price = 100, amount = 1 WHERE num = 2;
UPDATE `buy` SET prod_name = '아이폰', group_name = '디지털', price = 200, amount = 1 WHERE num = 3;
UPDATE `buy` SET prod_name = '아이폰', group_name = '디지털', price = 200, amount = 5 WHERE num = 4;
UPDATE `buy` SET prod_name = '청바지', group_name = '패션', price = 50, amount = 3 WHERE num = 5;
UPDATE `buy` SET prod_name = '에어팟', group_name = '디지털', price = 80, amount = 10 WHERE num = 6;
UPDATE `buy` SET prod_name = '혼공SQL', group_name = '서적', price = 15, amount = 5 WHERE num = 7;
UPDATE `buy` SET prod_name = '혼공SQL', group_name = '서적', price = 15, amount = 2 WHERE num = 8;
UPDATE `buy` SET prod_name = '청바지', group_name = '패션', price = 50, amount = 1 WHERE num = 9;
UPDATE `buy` SET prod_name = '지갑', group_name = NULL, price = 30, amount = 1 WHERE num = 10;
UPDATE `buy` SET prod_name = '혼공SQL', group_name = '서적', price = 15, amount = 1 WHERE num = 11;
UPDATE `buy` SET prod_name = '지갑', group_name = NULL, price = 30, amount = 4 WHERE num = 12;

alter table buy add constraint foreign key (mem_id) references member(mem_id);

desc buy;

commit;

# member 와 buy 를 inner join

SELECT * FROM member as m INNER JOIN buy as b ON m.mem_id = b.mem_id;

SELECT * FROM member as m left JOIN buy as b ON m.mem_id = b.mem_id;
SELECT * FROM member as m right JOIN buy as b ON m.mem_id = b.mem_id;

# 서부쿼리 
# 쿼리안에 또 다른 쿼리를 이용해서 원하는 데이터를 조회
# 이름이 에이핑크인 회원의 평균키(height)보다 큰 회원을 조회하기 

select mem_name, height from member where height > (select height from member where mem_name ='에이핑크');

