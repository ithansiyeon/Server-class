--ex29_modeling.sql

/*

ANSI-SQL > Modeling > PL/SQL

데이터베이스 구축 
- 요구분석 + 데이터 수집 > 다량의 데이터 발생 > 저장하기 위한 데이터베이스의 조직화된 구조 
    > 설계 > 구축 

1. 데이터베이스 모델링
2. 데이터베이스 설계
3. 데이터베이스 구축 

1. 데이터베이스 모델링
- 가장 초반에 하는 작업 
- 가장 중요한 작업 
- 설계도 작업(***)
- 요구분석 > 데이터베이스 구성을 위한 정보(Raw) 수집 > 분석 > 가공 > 저장 구조
    > 도식화(설계도) > ERD(최종 산출물)
- 이 단계에서 DBMS의 종류는 결정되지 않는다. 


2. 데이터베이스 설계
- 실제 사용할 DBMS를 결정한다. -> 오라클
- 모델링 결과물(ERD) -> 구체화하는 작업 -> 오라클에 맞게끔 세밀하게 설정
- 식별자 생성, 자료형 지정, 제약사항 추가 등..
- 데이터베이스 설계의 산출물 > 스크립트(*.sql) + DDL

3. 데이터베이스 구축
- 1~2 결과 토대 > 현실화 > 물리적 생성하는 작업
- SQL 사용 + 구조 생성 + 데이터 생성 

데이터베이스 모델링 

1. ERD, Entity Relational Digram 
 - 엔티티간의 관계를 표현한 그림
 - 데이터베이스 모델링 기법 중에 하나 > 대표적 방법
 - 손, 오피스, 전문툴(exERD, SQL Developer, ER-WIN 등)
 
2. Entity, 엔티티
- 다른 Entity와 분류(구분)될 수 있고, 
  다른 Entity에 대해서 정해진 관계를 맺을 수 있는 데이터 단위  
- 테이블(=레코드), 클래스(객체), 폴더(파일)
ex) 회사 정보 관리 프로그램 
    a. 사원 정보 관리
        - 정보: 사원명, 나이, 연락처, 주소, 사원번호 등...
           - (사원명, 나이, 연락처, 주소, 사원번호) -> 사원
    b. 부서 정보 관리 
        - 정보: 부서명, 부서번호, 사물실번호, 내선번호 등...
        - (부서명, 부서번호, 사물실번호, 내선번호) -> 부서 
                속성(컬럼) -> 멤버변수들                     
3. Entity Relationship, 엔티티 관계 
- 엔티티간의 관계
- 테이블과 테이블의 관계 

4. Attridute, 속성(특성)
- 엔티티가 가지는 특성
- 엔티티를 구성하는 요소 
- 엔티티를 만들기 위해서 하나로 모였던 정보들 
- ex) 사원 엔티티 = 사원명 속성 + 사원번호 속성 + 연락처 속성 + 주소 속성 등...

ERD에서 Entity,Attribute,Relation 등을 표현하는 방법(그림 그리는 방법) 

1. Entity 
- 사각형으로 표시 
- 이름을 작성(한글 권장, 영어(대문자 권장))
- 중복 불가능 
- 보통 단수로 표시 

2. Attribute 
- 엔티티 안에 표시(목록 형태)
- 파스칼 표시법 + 전부 소문자 표기 
- 단수로 표시 
- 추가 표기사항(** 속성에 대한 특징을 기술)
    a. NN, Not Null
        - 해당 속성을 비워둘 수 없다.
    b. ND, Not Duplicate
        - 해당 속성을 중복될 수 없다. 
        - 유일값(Unique)
    1. 중복되면 안되고, 생략되면 안된다.(NN,ND)
        - #*속성명 
    2. 생략되면 안된다.
        - *속성명
    3. 중복되면 안된다.(ND)
        -# 속성명
    4. 중복되도 되고, 생략되도 된다.
        -속성명
        - o 속성명 
        - optional

3. Relationship
- 가장 중요한 작업
- 엔티티와 엔티티간의 관계 표시 
    - 행과 행간의 관계(실제적인)
    - PK와 FK의 관계
- 관계의 패턴(종류)
    A엔티티 : B엔티티 
    a. 1:1  -|-|- 
        - 1개의 A는 1개의 B와 관계
    b. 1:0  -|-0 (존재하지 않음) 관계x 선이 존재 불가
        - 1개의 A는 0개의 B와 관계(무관계)
    c. 1:N  -|-|<-
        - 1개의 A는 1개의 이상의 B와 관계
    d: 1:N  -|-0|<-
        - 1개의 A는 0개의 이상의 B와 관계 
        
4. 키, Key(컬럼)
- 속성, 컬럼
- 여러가지 역할을 부여할 수 있다.

4.a 기본키, Primary key(NN,ND)
- 레코드와 레코드를 구분하는 역할 > 식별자(***)
- 테이블에 기본키가 반드시 존재해야 한다. 

4.b 후보키, Candidate key
- 레코드와 레코드를 구분하는 역할
- 후보키들 중 대표로 선발된 키 -> 기본 키
- 탈락된 키 -> 후보키 => 대체키인듯 한데 

후보키 = 기본키 + 대체키

탈락된 키를 대체키 
4.c 대체키, Alternate key
- 후보키들 중 기본키를 제외한 나머지키 

4.d 슈퍼키, Super key
- 복합키, Composite key 
- 1개의 키만을 가지고 식별자 역할이 불가능한 경우 -> 2개 이상의 키를 조합해서 기본키로 만든 경우 

4.e 외래키, Foreign key
- 부모 테이블의 기본 키를 참조하는 키 
- 테이블의 관계를 만드는 역할(***)

4.f 일반키(평범한 키) 
- a~e 중 아무것에도 해당되지 않는 키 

ERD 종류
1. 논리 다이어그램, Logical Diagram (프로젝트때 선생님께 보여주는 것, 시간이 오래걸려) 
    - 업무를 설명하기 위한 ERD > 데이터의 성격 + 관계 표시
    - 모든 식별자 > 한글로 정의 
    - 설계 단계 + 업무 정의 단계
    
2. 물리 다이어그램, Physical Diagram 
    - 실제 데이터베이스에 적용하고 관리하기 위한 ERD
    - 모든 식별자 -> 실제 DB에 적합한 이름으로 표시(영문)
    - 자료형 명시, 제약사항 표시 
    - 구현 단계 
    



*/






















