-- ex05_alias.sql

/*

select 문

- select 절 : 컬럼을 가져오는 역할. 2번 
- from 절 : 테이블을 지정하는 역할. 1번




*/

select * from tblCountry;
select * from tblInsa;
select * from tblMen;
select * from tblWomen;
select * from tblComedian;
select * from tblAddressBook;
select * from fine_dust;
select * from lotto_master;

/*

별칭 Alias
- 컬럼, 테이블 
1. 이름을 간소화시키기 위해서 
2. 이름으로 올바르지 않은 이름을 가지는 경우 > 올바른 이름으로 수정


*/

-- > select 결과 -> 표 반환 -> 결과 테이블(Result Table) or 결과셋(ResultSet)
select name as 국가명, capital as 수도명 from tblCountry; -- ***********
select name 국가명, capital 수도명 from tblCountry; -- 가독성 낮음 

select name as "국가명", capital as "수도명" from tblCountry; -- 상황에 따라
select name "국가명", capital "수도명" from tblCountry; --가독성 낮음 

select name as 국가명, name as "국가 이름" from tblCountry; --식별자에 공백을 넣을 수 없어
select name as "select" from tblCountry; --예약어,특수문자를 강제로 컬럼이름으로 만들어, "" 안만드는게 좋아 

-- 함수의 결과값, 연산의 결과
select name,length(name) as length, area + 100 as area from tblCountry; --컬럼명을 올바른 이름으로 만들어야 돼 

select name,population as pop from tblCountry;


select tblCountry.name from tblCountry;
select c.name from tblCountry c; -- table 별칭은 as 없이 붙여

-- 조인 s
select m.name , w.name from tblMen m inner join tblWomen w on m.name = w.couple;













