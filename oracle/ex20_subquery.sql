--ex20_subquery.sql

/*

Main Query, 메인 쿼리
- 하나의 select(insert,update,delete)로만 되어 있는 쿼리 


Sub Query, 서브 쿼리
- 여러개의 select를 사용하는 쿼리
- 하나의 쿼리안(select,insert,update,delete)에 또 다른 select가 들어있는 쿼리
- 삽입 위치: select절, from절, where절, order by절 등..

*/

-- tblCountry. 인구수가 가장 많은 나라의 인구수? > 국가명? 
select name,population from tblCountry;

-- 14개 하나 짜리 동시에 X
select max(population) from tblCountry; --120660
select name from tblCountry where population = 120660;

--where에 집계 함수를 쓸 수 없어
select name from tblCountry where population = max(population);

select name from tblCountry where population = (select max(population) from tblCountry); -- 소괄호 상수(단일값) 

--tblComedian. 체중이 가장 많이 나가는 이름?
select * from tblComedian;
select first||last from tblComedian where weight = (select max(weight) from tblComedian);
-- tblInsa. 급여를 가장 적게 받는 이름명?
select * from tblInsa;
select name from tblInsa where basicpay = (select min(basicpay) from tblInsa);
-- tblInsa. 평균 급여보다 더 많이 받는 직원 명단?
select * from tblInsa;
select name from tblInsa where basicpay > (select avg(basicpay) from tblInsa);
-- tblInasa. '홍길동'과 같은 부서에 근무하는 직원 명단?
select * from tblInsa;
select * from tblInsa where buseo = (select buseo from tblInsa where name='홍길동');

--tblMen, tblWomen
-- 키(166) + 몸무게(55) 남자 -> 여자 친구 나이? 
select * from tblMen;
select * from tblWomen;

select couple from tblMen where height = 166 and weight = 55;
select * from tblWomen where name = (select couple from tblMen where height = 166 and weight = 55);

-- 서브쿼리의 용도
-- 1. 조건절에서 비교값으로 사용(a,b,c)
--  a. 반환값이 1행 1열 > 스칼라 쿼리 > 연산자를 사용해서 비교한다. 
--  b.  반환값이 N행 1열 > in 연산자를 사용해서 비교한다. 
--  c.  반환값이 1행 N열 > 스칼라 쿼리 > 연산자를 사용해서 비교한다. 
--  d.  반환값이 N행 N열 > b + c 조합

select * from tblInsa
    where basicpay = (select max(basicpay) from tblInsa);

-- 급여가 250만원 이상 받는  직원? > 같은 부서 직원 명단? 
-- ORA-01427: single-row subquery returns more than one row
select * from tblInsa
    where buseo in (select buseo from tblInsa where basicpay >= 2500000);
    --  where buseo in ('기획부','개발부','영업부');
    
-- '홍길동' 과 같은 지역 + 같은 직위
select * from tblInsa
    where city = (select city from tblInsa where name = '홍길동')
        and jikwi = (select jikwi from tblInsa where name = '홍길동');

select * from tblInsa
    where (city,jikwi) = (select city,jikwi from tblInsa where name = '홍길동');

-- 급여 260만원 이상 받는 직원이 부서 + 지역 -> 두 조건 일치하는 직원 명단
select * from tblInsa
    where (buseo,city) in (select buseo,city from tblInsa where basicpay > 2600000);

-- 서브쿼리의 용도
-- 1. 조건절에서 비교값으로 사용(a,b,c)
--  a. 반환값이 1행 1열 > 스칼라 쿼리 > 연산자를 사용해서 비교한다. 
--  b.  반환값이 N행 1열 > in 연산자를 사용해서 비교한다. 
--  c.  반환값이 1행 N열 > 스칼라 쿼리 > 연산자를 사용해서 비교한다. 
--  d.  반환값이 N행 N열 > b + c 조합
-- 2. 컬럼리스트에서 사용 
--      a. 반드시 1행 1열의 결과만 사용 가능하다. > 상수 1개의 역할을 하기 때문
--      b. 컬럼리스트에서 사용되는 서브쿼리 종류 
--          1. 정적 쿼리(바깥쪽 테이블의 모든 행에 대해 동일한 값을 가지는 경우)
--          2. 상관 서브 쿼리(바깥쪽 테이블의 결과를 서브 쿼리에 연동했을 때)

select avg(basicpay) from tblInsa;
-- 데이터가 들어가는 곳에서 서브쿼리가 들어갈 수 있어
select name, buseo, jikwi, basicpay , (select avg(basicpay) from tblInsa) from tblInsa; -- 숫자라서

select 
    name, buseo, jikwi, basicpay , 
    (select city from tblInsa where num = 1001) 
from tblInsa;

select 
    name, buseo, jikwi, basicpay, 
    (select round(avg(basicpay)) from tblInsa where buseo = a.buseo) 
from tblInsa a;

select name,age,couple, (select age from tblWomen where name = tblMen.couple) from tblMen;


-- 서브쿼리의 용도
-- 1. 조건절에서 비교값으로 사용(a,b,c)
--  a. 반환값이 1행 1열 > 스칼라 쿼리 > 연산자를 사용해서 비교한다. 
--  b.  반환값이 N행 1열 > in 연산자를 사용해서 비교한다. 
--  c.  반환값이 1행 N열 > 스칼라 쿼리 > 연산자를 사용해서 비교한다. 
--  d.  반환값이 N행 N열 > b + c 조합
-- 2. 컬럼리스트에서 사용 
--      a. 반드시 1행 1열의 결과만 사용 가능하다. > 상수 1개의 역할을 하기 때문
--      b. 컬럼리스트에서 사용되는 서브쿼리 종류 
--          1. 정적 쿼리(바깥쪽 테이블의 모든 행에 대해 동일한 값을 가지는 경우)
--          2. 상관 서브 쿼리(바깥쪽 테이블의 결과를 서브 쿼리에 연동했을 때)
-- 3. from절에서 사용
--      - 서브쿼리의 결과셋을 독립적인 하나의 테이블이라고 생각하고 from절에서 사용 
--      - 인라인 뷰(Inline View) 
--      - alias 주의 !!!!!(개명)
-- 4. order by,group by, having 등등..

-- 뷰는 사용자에게 접근이 허용된 자료만을 제한적으로 보여주기 위해 하나 이상의 기본 테이블로부터 유도된, 이름을 가지는 가상 테이블이다.

select * from (select num as 번호,name,jikwi,city from tblInsa where buseo = '기획부') where 번호 = 1001; -- 임시테이블로 구성해야 돼서

select name from tblInsa where num = 1001; -- 테이블









