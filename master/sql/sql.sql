select * from PRODUCT order by prio
delete from PRODUCT where proname=null
drop table product
create table product(
proid varchar2(30),
proname varchar2(100),
cat varchar2(20),
loc varchar2(50),
price number,
minp number,
maxp number,
peris varchar2(50),
exp varchar2(1000),
img varchar2(30),
thumb varchar2(30),
discount number,
point number,
prio number,
event number
)


create table prodetail(
proid varchar2(30),
startday varchar2(50),
trans varchar2(50)
)
select proname, cat from PRODUCT
drop table prodetail
select sum(goperson) as sum from oder where proid='FM제주M1P6'
select * from product
delete from PRODETAIL
insert into PROdetail values('GL일본A2T9','2016-12-30','아시아나항공');
insert into PROdetail values('GL일본A2T9','2016-01-05','아시아나항공');
insert into PROdetail values('GL일본A2T9','2016-01-20','Peach항공');
insert into PROdetail values('KR제주B5Q3','2016-12-30','부산에어');
insert into PROdetail values('FM제주M1P6','2016-12-30','부산에어');
insert into PROdetail values('FM제주M1P6','2016-01-15','부산에어');
insert into PROdetail values('KR제주B5Q3','2016-01-05','아시아나항공');
insert into PROdetail values('KR제주B5Q3','2016-01-20','부산에어');
insert into product values('GL일본A2T9',   '오키나와 3박 5일 즐기기',   
'GL',   '일본-오키나와',
356000,   4,   20,   
'3박5일', '오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성',   
'GLOK아18.png',   'GLOK아18tb.png',   null,   4.5, null,   1);
insert into product values('KR제주B5Q3',   '떠나요~ 제주도~',   
'KR',   '제주도',
300000,   2,   10,   
'0박1일', '제주도 일정. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'KR제부30.png',   'KR제부30tb.png',   null,   3.5, null,   0);
delete from product where proid='FM제주M1P6'
insert into product values('FM제주M1P6',   '가족끼리 제주도 캠핑 여행!',   
'FM',   '제주도',
500000,   3,   30,   
'1박2일', '제주도 캠핑 일정입니다. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'KR제부30.png',   'KR제부30tb.png',   0.1,   5, 1,   1);
insert into product values('FM군산M1P6',   '역사속으로 군산여행!',   
'FM',   '군산',
500000,   3,   30,   
'1박2일', '군산여행 일정입니다. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'KR제부30.png',   'KR제부30tb.png',   0.1,   0, 2,   0);

insert into product values('HU동남A2T9',   '동남아 최고 휴양지 랑카위',   
'HU',   '동남아-랑카위',
289000,   2,   50,   
'3박6일', '랑카위 일정. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'GLOK아18.png',   'GLOK아18tb.png',   0.1,   0.0, 1,   0);
insert into product values('HU동남B2C4',   '코사무이로 힐링하러 가자~',   
'HU',   '동남아-코사무이',
289000,   2,   50,   
'3박6일', '코사무이 일정. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'GLOK아18.png',   'GLOK아18tb.png',   0,   0.0, 2,   0);
insert into product values('HU동남Q2C1',   '롬복이라고 들어나 봤나?',   
'HU',   '동남아-롬복',
289000,   2,   50,   
'3박6일', '롬복 일정. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'GLOK아18.png',   'GLOK아18tb.png',   0,   0.0, 3,   0);
insert into product values('HU동남A8Z4',   '지상 최고의 휴양지 시아누크빌',   
'HU',   '동남아-시아누크빌',
289000,   2,   50,   
'3박6일', '시아누크빌 일정. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'GLOK아18.png',   'GLOK아18tb.png',   0,   0.0, 4,   0);

insert into product values('HU동남A8Z4',   '지상 최고의 휴양지 시아누크빌',   
'HU',   '동남아-시아누크빌',
289000,   2,   50,   
'3박6일', '시아누크빌 일정. 궁금한 사항은 아래 문의사항을 이용하거나 또는 고객센터를 이용해 주세요.',   
'GLOK아18.png',   'GLOK아18tb.png',   0,   0.0, 4,   0);


select * from guest

insert into guest values(8888,'888',sysdate,88)

update product set discount=0.1 where proid='JP_O_35_P_30'
update product set cat='GL'

create table cat(
code varchar(20),
name varchar(40)
);
create table loc(
locname varchar(40),
catcode varchar(20)
);
select * from cat
SELECT * FROM LOC INNER JOIN CAT ON LOC.CATCODE = CAT.CODE
SELECT * FROM product INNER JOIN CAT ON product.CAT = CAT.code
select sum(goperson) as cnt from oder where oder.proid='KR제주부산305'
SELECT product.proid,  maxp  FROM oder INNER JOIN product ON oder.proid=product.proid where oder.proid='KR제주부산305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR제주부산305') where proid='KR제주부산305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR제주부산305') where proid='KR제주부산305'
SELECT price, orderid FROM oder INNER JOIN product ON oder.proid=product.proid where orderid='k_i_9'
select * from oder where cancel =0 or cancel = 1
update oder set cancel=0 where cancel=2
select * from oder
insert into cat values('HD','핫딜');
insert into cat values('KR','국내');
insert into cat values('GL','해외');
insert into cat values('HU','휴양지');
insert into cat values('FM','가족여행');
insert into cat values('FO','맛집탐방');
insert into cat values('OD','당일치기');




insert into loc values('일본-오키나와','GL');
insert into loc values('동남아-랑카위','HU');
insert into loc values('동남아-보홀','HU');
insert into loc values('동남아-코사무이','HU');
insert into loc values('동남아-루앙프라방','HU');
insert into loc values('동남아-시아누크빌','HU');
insert into loc values('동남아-롬복','HU');
insert into loc values('일본-도쿄','GL');
insert into loc values('일본-오사카','GL');
insert into loc values('일본-큐슈','GL');
insert into loc values('제주도','KR');
insert into loc values('군산','KR');
insert into loc values('여수','KR');


select * from cat
select * from loc

select * from loc inner join CAT on loc.catcode = cat.code where cat.name='해외';

drop table loc;


create table event(
eid varchar2(30),
ename varchar2(50),
eimg varchar2(50),
eexp varchar2(500),
eurl varchar2(100),
eprio number,
eduring varchar2(30)
)
insert into event values('openEvent_1','오픈이벤트!', 'openEvent.png','오픈이벤트 전 해외카테고리 10% 할인'
, 'www.naver.com',null,'2016-12-30');
select sum(goperson) as sum from oder where proid='FM제주M1P6' and startday='2016-12-30' and trans='부산에어' 
insert into ODER values('F_i_2','FM제주M1P6','iuser1',450000,'2016-12-10',1,0,'2016-12-30','부산에어');
insert into ODER values('F_i_2','FM제주M1P6','user2',1800000,'2016-12-10',4,0,'2016-12-30','부산에어');
select * from event
select * from product
select * from oder
drop table oder
create table oder(
orderid varchar2(30),
proid varchar2(30),
customid varchar2(20),
paycash number,
payd varchar2(20),
goperson number,
cancel number,
startday varchar2(50),
trans varchar2(50)
)
insert into PROdetail values('GL일본A2T9','2016-12-30','아시아나항공');
insert into PROdetail values('GL일본A2T9','2016-01-05','아시아나항공');
insert into PROdetail values('GL일본A2T9','2016-01-20','Peach항공');
insert into PROdetail values('KR제주B5Q3','2016-12-30','부산에어');
insert into PROdetail values('KR제주B5Q3','2016-01-05','아시아나항공');
insert into PROdetail values('KR제주B5Q3','2016-01-20','부산에어');
insert into ODER values('k_u_9','KR제주B5Q3','user1',1200000,'2016-12-01',4,0,'2016-12-30','부산에어');
insert into ODER values('k_i_9','KR제주B5Q3','iuser1',300000,'2016-12-10',1,0,'2016-12-30','부산에어');
insert into ODER values('k_i_1','KR제주B5Q3','iuser1',300000,'2016-12-10',1,0,'2016-01-20','부산에어');
delete from oder where orderid='k_i_9'
insert into ODER values('G_u_1','GL일본A2T9','user2',712000,'2016-12-16',2,0,'2016-01-20','Peach항공');
insert into ODER values('G_i_4','GL일본A2T9','iuser2',712000,'2016-12-16',2,1,'2016-01-05','아시아나항공');
insert into ODER values('G_i_9','GL일본A2T9','iuser2',712000,'2016-12-28',2,0,'2016-12-30','아시아나항공');
insert into ODER values('G_i_9','GL일본A2T9','admin',712000,'2016-12-28',2,0,'2016-12-30','아시아나항공');
select * from (SELECT product.proid, maxp, startday, trans FROM oder 
INNER JOIN product ON oder.proid=product.proid), 
(select sum(goperson) as cnt from oder where oder.proid='GL일본A2T9' and oder.startday='2016-12-30' and oder.trans='아시아나항공') 
where proid='GL일본A2T9' and startday='2016-12-30' and trans='아시아나항공'
select * from custest


delete from oder

update oder set cancel=1 where customid='iuser2'

GL일본아시183


고객 테이블

create table custest(
id varchar2(20),
cash number,
tcash number
)


CREATE TABLE customer(
id varchar2(20),
pw varchar2(20),
name varchar2(20),
phone number,
cash number,
tcash number,
grade varchar2(20)
);

drop table custest
insert into customer values('user1','12341234','유저1',01012341234,12000,1200000,'프로썸러');
insert into customer values('iuser1','12341234','아이유저1',01012341234,20000,3000000,'카사노바');
insert into customer values('user2','12341234','유저2',01012341234,0,0,'프로썸러');
insert into customer values('iuser2','12341234','아이유저2',01012341234,7120,712000,'프로썸러');
insert into customer values('admin','12341234','관리자',01012341234,99999,99999999,'흙흙모쏠');
delete from customer where id='admin'
delete from customer 
select * from custest
select * from custest where id like '%i%'


CREATE TABLE "SCOTT"."CUSTOMER" 
   (   "ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
   "PW" VARCHAR2(20 BYTE), 
   "NAME" VARCHAR2(20 BYTE), 
   "PHONE" NUMBER(20,0), 
   "CASH" NUMBER, 
   "GRADE" VARCHAR2(20 BYTE), 
   "TCASH" NUMBER, 
    CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  create table coupon(
  cupid varchar2(30),
  cupname varchar2(50),
  percent number,
  customid varchar2(20),
  cupperi varchar2(20)  
  )
  select * from coupon
drop table custest
drop table notice

create table notice(
notid varchar2(20),
notitle varchar2(100),
notcontent varchar2(1000),
notfile varchar2(50),
notday date
)

insert into notice values('pop', '팝업',null,'popup.png',sysdate);
insert into notice values('notice1', '신규오픈 공지사항입니다.',
'greenlight 여행사가 신규오픈하게 되었습니다. 가입하셔서 다양한 즐거움을 누리시길 바랍니다.',null,sysdate);
select * from notice

 CREATE TABLE "SCOTT"."QNA" 
   (   "NUM" VARCHAR2(1111 BYTE) NOT NULL ENABLE, 
   "LIST" VARCHAR2(100 BYTE), 
   "CONTENT" VARCHAR2(4000 BYTE), 
   "NALJA" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;


create table voc(
vocid varchar2(20),
voctitle varchar2(100),
voccontent varchar2(1000),
customid varchar2(100),
answer varchar2(1000),
proid varchar2(30)
)

select * from product

  
1:1문의
insert into voc values('us아이7','아이디를 바꾸고 싶어요.','아이디를 바꾸고 싶은데 어떻게 하나요?','user1',null,null);
insert into voc values('1','아이디를 바꾸고 싶어요.','아이디를 바꾸고 싶은데 어떻게 하나요?','user1',null,null);
insert into voc values('us환불4','환불하고 싶어요.','환불환불환불환불환불환불환불예에~','user1','환불신청을 하시면 환불해 드립니다~',null);
insert into voc values('iu아이7','아이디를 바꾸고 싶어요.','아이디를 바꾸고 싶은데 어떻게 하나요?','iuser1',null,null);
insert into voc values('adte2','testtesttest','테스트중입니다.','admin','test',null);
상품문의
insert into voc values('us오키9','오키나와 패키지에 대해 문의드립니다.','오키나와 패키지 안에는 무엇이 있나요?','user1',null,'GL일본아시183');
insert into voc values('us제주7','제주도 패키지에 대해 문의드립니다.','제주 패키지 안에는 무엇이 있나요?','user1',null,'FM제주M1P6');
insert into voc values('iu제주8','제주도 패키지에 대해 문의드립니다.','제주 패키지 안에는 무엇이 있나요?','iuser1',null,'FM제주M1P6');
insert into voc values('iu오키3','오키나와 가격이요','가격이 왜케 비싸나요?','iuser1','고객님께 저렴한 상품으로 다가가겠습니다. 감사합니다.','GL일본아시183');
faq
insert into voc values('FAQ_3_N','회원가입은 어떻게 하나요?','회원가입을 하고 싶은데 회원가입을 어떻게 해야 하나요?',null,
'회원가입 버튼을 누른 후 회원가입 페이지에서 회원가입을 진행하시면 됩니다.',null);
insert into voc values('FAQ_4_Y','회원탈퇴는 어떻게 하나요?','회원탈퇴 하고 싶은데 회원가입을 어떻게 해야 하나요?',null,
'로그인 후 회원 탈퇴버튼을 누르면 회원탈퇴 신청이 됩니다. 관리자에서 확인 후 회원 탈퇴가 가능합니다. 탈퇴 후에는 고객님의 모든 정보를 삭제합니다.',null);


select * from voc where proid is not null
select * from voc where customid is not null and proid is null
select * from voc where vocid like 'FAQ%'
delete from voc where vocid like 'FAQ%'
delete from voc

create table masterid(
mid varchar2(30),
mpw varchar2(30)
)
drop table masterid
insert into masterid values('admin','admin1234!');

select * from masterid

select * from customer
insert into customer values('test1','12341234','테스트',00000000000,0,4000000,'흙흙모쏠')
select * from customer where tcash >= 2000000 and tcash < 6000000
update customer set grade='프로썸러' where tcash >= 2000000 and tcash < 6000000

insert into coupon values('grade_2','등급쿠폰!',0.1,(select id from customer where grade='프로썸러'),'2016-12-20');
select * from coupon

cupid varchar2(30),
  cupname varchar2(50),
  percent number,
  customid varchar2(20),
  cupperi varchar2(20)  

select cupid, cupname, percent, id, cupperi from coupon inner join customer on customer.id = coupon.customid where customer.grade='프로썸러'
insert all
into coupon values('grade_test','grade_test',0.1,)
select * from customer

CREATE SEQUENCE seq_gcup
MINVALUE 1
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE seq_wish
MINVALUE 1
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE BASKET_SEQ 
INCREMENT BY 1 
START WITH 0 
MINVALUE 0 
NOMAXVALUE CACHE 2;

CREATE SEQUENCE  "SCOTT"."SEQUENCE1"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
CREATE SEQUENCE  "SCOTT"."SEQ_VOC"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;


drop sequence seq_gcup
drop sequence seq_wish
drop sequence seq_basket

'grade'||seq_gcup.nextval
drop sequence seq_gcup

select * from product
/
INSERT INTO coupon (cupid,cupname,percent,customid,cupperi) (select 'grade'||seq_gcup.nextval,'등급 쿠폰',0.1,id, TO_CHAR(LAST_DAY(SYSDATE),'YYYY-MM-DD') cupperi from customer, dual where customer.grade='프로썸러')
select * from coupon
SELECT  TO_CHAR(LAST_DAY(SYSDATE),'YYYY-MM-DD') MONTH_LAST_DAY FROM DUAL
delete from coupon where cupid like 'grade%'
delete from wish
create table wish(
  wishid varchar2(20),
  proid varchar2(20),
  customid varchar2(20)
);
select * from wish
create table basket(
  basketid varchar2(20),
  proid varchar2(20),
  customid varchar2(20),
  PAYD date
);
 user4  12341234 힘찬   1012121212     0         0 흙흙모쏠

select * from CUSTOMER
create table mainimg(
mainid varchar2(20),
title varchar2(100),
img varchar2(100)
)

select * from voc where proid='FM제주M1P6'
select * from mainimg
insert into mainimg values('main1','역사가 살아숨쉬는 곳, 경주','main3.jpg');
insert into mainimg values('main2','한겨울의 보라카이 3박 5일','main1.jpg');
insert into mainimg values('main3','동해를 품은 포항 호미곶','main2.jpg');
drop table mainimg
delete from mainimg

 select count(*) as cnt from mainimg
 
select * from wish
delete from wish where wishid='wish_83'
create table review(
reviewid varchar2(20),
proid varchar2(30),
customid varchar2(20),
title varchar2(200),
contents varchar2(1000),
score number
)
select * from review
insert into review values('FMiuAO9','FM제주M1P6','iuser2','정말 잘 다녀왔습니다.','멋진 제주도 여행이었습니다. 다른분들도 꼭 한번 가세요! 추천추천!!',5);