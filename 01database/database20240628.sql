# CRUD  연습
USE MYWORK;
create table emp_test
(
	emp_no int 					not null,
    emp_name varchar(30) not 	null,
    hire_date date 				null,
    salary int 					null,
    primary key(emp_no)
);

desc emp_test;

insert into `emp_test`
(emp_no, emp_name, hire_date, salary)
values (1001, '아인슈타인', '2021-05-12', 4000),
(1002, '호킹', '2021-01-11', 4000),
(1003, '김말똥', '2021-02-27', 5000),
(1004, '손수정', '2021-05-11', 3000),
(1005, '조영태', '2021-06-30', 3400),
(1006, '손수조', '2021-08-17', 4300),
(1007, '손흥민', '2021-02-21', 3200),
(1008, '박세리', '2021-04-25', 3200),
(1009, '방수창', '2021-03-01', 4200);

# 데이블 데이터 수정하기alter
# update 테이블  set 컬럼1 = 값, 컬럼2 = 값 where 찾을 값 
update emp_test
set salary = null where emp_no = 1003  ;

select * from emp_test;

# delete 문으로 데이터 삭제하기
# delete from  테이블 where 조건alter
delete from emp_test where emp_no = 1009;

# transaction 처리하기 
# 오토 커밋 옵션 활성화 확인 
# select @@autocommit1 = 활성화, 0 = 비활성화 
select @@autocommit;

# 오토커밋 설정 set autocommit = 0/1
select @@autocommit=0;
select @@autocommit;

create table emp_tran1 as select * from emp_test;

alter table emp_tran1 add constraint primary key(emp_no);

create table emp_tran2 as select * from emp_test;

alter table emp_tran2 add constraint primary key(emp_no);

delete from emp_tran1;
delete from emp_tran2;
rollback;

select * from emp_tran1;
select * from emp_tran2;

select * from emp_tran1;
commit;
rollback;
select * from emp_tran1;




