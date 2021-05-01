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
select sum(goperson) as sum from oder where proid='FM����M1P6'
select * from product
delete from PRODETAIL
insert into PROdetail values('GL�Ϻ�A2T9','2016-12-30','�ƽþƳ��װ�');
insert into PROdetail values('GL�Ϻ�A2T9','2016-01-05','�ƽþƳ��װ�');
insert into PROdetail values('GL�Ϻ�A2T9','2016-01-20','Peach�װ�');
insert into PROdetail values('KR����B5Q3','2016-12-30','�λ꿡��');
insert into PROdetail values('FM����M1P6','2016-12-30','�λ꿡��');
insert into PROdetail values('FM����M1P6','2016-01-15','�λ꿡��');
insert into PROdetail values('KR����B5Q3','2016-01-05','�ƽþƳ��װ�');
insert into PROdetail values('KR����B5Q3','2016-01-20','�λ꿡��');
insert into product values('GL�Ϻ�A2T9',   '��Ű���� 3�� 5�� ����',   
'GL',   '�Ϻ�-��Ű����',
356000,   4,   20,   
'3��5��', '��Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ���Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ�',   
'GLOK��18.png',   'GLOK��18tb.png',   null,   4.5, null,   1);
insert into product values('KR����B5Q3',   '������~ ���ֵ�~',   
'KR',   '���ֵ�',
300000,   2,   10,   
'0��1��', '���ֵ� ����. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'KR����30.png',   'KR����30tb.png',   null,   3.5, null,   0);
delete from product where proid='FM����M1P6'
insert into product values('FM����M1P6',   '�������� ���ֵ� ķ�� ����!',   
'FM',   '���ֵ�',
500000,   3,   30,   
'1��2��', '���ֵ� ķ�� �����Դϴ�. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'KR����30.png',   'KR����30tb.png',   0.1,   5, 1,   1);
insert into product values('FM����M1P6',   '��������� ���꿩��!',   
'FM',   '����',
500000,   3,   30,   
'1��2��', '���꿩�� �����Դϴ�. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'KR����30.png',   'KR����30tb.png',   0.1,   0, 2,   0);

insert into product values('HU����A2T9',   '������ �ְ� �޾��� ��ī��',   
'HU',   '������-��ī��',
289000,   2,   50,   
'3��6��', '��ī�� ����. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'GLOK��18.png',   'GLOK��18tb.png',   0.1,   0.0, 1,   0);
insert into product values('HU����B2C4',   '�ڻ繫�̷� �����Ϸ� ����~',   
'HU',   '������-�ڻ繫��',
289000,   2,   50,   
'3��6��', '�ڻ繫�� ����. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'GLOK��18.png',   'GLOK��18tb.png',   0,   0.0, 2,   0);
insert into product values('HU����Q2C1',   '�Һ��̶�� �� �ó�?',   
'HU',   '������-�Һ�',
289000,   2,   50,   
'3��6��', '�Һ� ����. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'GLOK��18.png',   'GLOK��18tb.png',   0,   0.0, 3,   0);
insert into product values('HU����A8Z4',   '���� �ְ��� �޾��� �þƴ�ũ��',   
'HU',   '������-�þƴ�ũ��',
289000,   2,   50,   
'3��6��', '�þƴ�ũ�� ����. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'GLOK��18.png',   'GLOK��18tb.png',   0,   0.0, 4,   0);

insert into product values('HU����A8Z4',   '���� �ְ��� �޾��� �þƴ�ũ��',   
'HU',   '������-�þƴ�ũ��',
289000,   2,   50,   
'3��6��', '�þƴ�ũ�� ����. �ñ��� ������ �Ʒ� ���ǻ����� �̿��ϰų� �Ǵ� �����͸� �̿��� �ּ���.',   
'GLOK��18.png',   'GLOK��18tb.png',   0,   0.0, 4,   0);


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
select sum(goperson) as cnt from oder where oder.proid='KR���ֺλ�305'
SELECT product.proid,  maxp  FROM oder INNER JOIN product ON oder.proid=product.proid where oder.proid='KR���ֺλ�305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR���ֺλ�305') where proid='KR���ֺλ�305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR���ֺλ�305') where proid='KR���ֺλ�305'
SELECT price, orderid FROM oder INNER JOIN product ON oder.proid=product.proid where orderid='k_i_9'
select * from oder where cancel =0 or cancel = 1
update oder set cancel=0 where cancel=2
select * from oder
insert into cat values('HD','�ֵ�');
insert into cat values('KR','����');
insert into cat values('GL','�ؿ�');
insert into cat values('HU','�޾���');
insert into cat values('FM','��������');
insert into cat values('FO','����Ž��');
insert into cat values('OD','����ġ��');




insert into loc values('�Ϻ�-��Ű����','GL');
insert into loc values('������-��ī��','HU');
insert into loc values('������-��Ȧ','HU');
insert into loc values('������-�ڻ繫��','HU');
insert into loc values('������-��������','HU');
insert into loc values('������-�þƴ�ũ��','HU');
insert into loc values('������-�Һ�','HU');
insert into loc values('�Ϻ�-����','GL');
insert into loc values('�Ϻ�-����ī','GL');
insert into loc values('�Ϻ�-ť��','GL');
insert into loc values('���ֵ�','KR');
insert into loc values('����','KR');
insert into loc values('����','KR');


select * from cat
select * from loc

select * from loc inner join CAT on loc.catcode = cat.code where cat.name='�ؿ�';

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
insert into event values('openEvent_1','�����̺�Ʈ!', 'openEvent.png','�����̺�Ʈ �� �ؿ�ī�װ� 10% ����'
, 'www.naver.com',null,'2016-12-30');
select sum(goperson) as sum from oder where proid='FM����M1P6' and startday='2016-12-30' and trans='�λ꿡��' 
insert into ODER values('F_i_2','FM����M1P6','iuser1',450000,'2016-12-10',1,0,'2016-12-30','�λ꿡��');
insert into ODER values('F_i_2','FM����M1P6','user2',1800000,'2016-12-10',4,0,'2016-12-30','�λ꿡��');
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
insert into PROdetail values('GL�Ϻ�A2T9','2016-12-30','�ƽþƳ��װ�');
insert into PROdetail values('GL�Ϻ�A2T9','2016-01-05','�ƽþƳ��װ�');
insert into PROdetail values('GL�Ϻ�A2T9','2016-01-20','Peach�װ�');
insert into PROdetail values('KR����B5Q3','2016-12-30','�λ꿡��');
insert into PROdetail values('KR����B5Q3','2016-01-05','�ƽþƳ��װ�');
insert into PROdetail values('KR����B5Q3','2016-01-20','�λ꿡��');
insert into ODER values('k_u_9','KR����B5Q3','user1',1200000,'2016-12-01',4,0,'2016-12-30','�λ꿡��');
insert into ODER values('k_i_9','KR����B5Q3','iuser1',300000,'2016-12-10',1,0,'2016-12-30','�λ꿡��');
insert into ODER values('k_i_1','KR����B5Q3','iuser1',300000,'2016-12-10',1,0,'2016-01-20','�λ꿡��');
delete from oder where orderid='k_i_9'
insert into ODER values('G_u_1','GL�Ϻ�A2T9','user2',712000,'2016-12-16',2,0,'2016-01-20','Peach�װ�');
insert into ODER values('G_i_4','GL�Ϻ�A2T9','iuser2',712000,'2016-12-16',2,1,'2016-01-05','�ƽþƳ��װ�');
insert into ODER values('G_i_9','GL�Ϻ�A2T9','iuser2',712000,'2016-12-28',2,0,'2016-12-30','�ƽþƳ��װ�');
insert into ODER values('G_i_9','GL�Ϻ�A2T9','admin',712000,'2016-12-28',2,0,'2016-12-30','�ƽþƳ��װ�');
select * from (SELECT product.proid, maxp, startday, trans FROM oder 
INNER JOIN product ON oder.proid=product.proid), 
(select sum(goperson) as cnt from oder where oder.proid='GL�Ϻ�A2T9' and oder.startday='2016-12-30' and oder.trans='�ƽþƳ��װ�') 
where proid='GL�Ϻ�A2T9' and startday='2016-12-30' and trans='�ƽþƳ��װ�'
select * from custest


delete from oder

update oder set cancel=1 where customid='iuser2'

GL�Ϻ��ƽ�183


�� ���̺�

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
insert into customer values('user1','12341234','����1',01012341234,12000,1200000,'���ν淯');
insert into customer values('iuser1','12341234','��������1',01012341234,20000,3000000,'ī����');
insert into customer values('user2','12341234','����2',01012341234,0,0,'���ν淯');
insert into customer values('iuser2','12341234','��������2',01012341234,7120,712000,'���ν淯');
insert into customer values('admin','12341234','������',01012341234,99999,99999999,'������');
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

insert into notice values('pop', '�˾�',null,'popup.png',sysdate);
insert into notice values('notice1', '�űԿ��� ���������Դϴ�.',
'greenlight ����簡 �űԿ����ϰ� �Ǿ����ϴ�. �����ϼż� �پ��� ��ſ��� �����ñ� �ٶ��ϴ�.',null,sysdate);
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

  
1:1����
insert into voc values('us����7','���̵� �ٲٰ� �;��.','���̵� �ٲٰ� ������ ��� �ϳ���?','user1',null,null);
insert into voc values('1','���̵� �ٲٰ� �;��.','���̵� �ٲٰ� ������ ��� �ϳ���?','user1',null,null);
insert into voc values('usȯ��4','ȯ���ϰ� �;��.','ȯ��ȯ��ȯ��ȯ��ȯ��ȯ��ȯ�ҿ���~','user1','ȯ�ҽ�û�� �Ͻø� ȯ���� �帳�ϴ�~',null);
insert into voc values('iu����7','���̵� �ٲٰ� �;��.','���̵� �ٲٰ� ������ ��� �ϳ���?','iuser1',null,null);
insert into voc values('adte2','testtesttest','�׽�Ʈ���Դϴ�.','admin','test',null);
��ǰ����
insert into voc values('us��Ű9','��Ű���� ��Ű���� ���� ���ǵ帳�ϴ�.','��Ű���� ��Ű�� �ȿ��� ������ �ֳ���?','user1',null,'GL�Ϻ��ƽ�183');
insert into voc values('us����7','���ֵ� ��Ű���� ���� ���ǵ帳�ϴ�.','���� ��Ű�� �ȿ��� ������ �ֳ���?','user1',null,'FM����M1P6');
insert into voc values('iu����8','���ֵ� ��Ű���� ���� ���ǵ帳�ϴ�.','���� ��Ű�� �ȿ��� ������ �ֳ���?','iuser1',null,'FM����M1P6');
insert into voc values('iu��Ű3','��Ű���� �����̿�','������ ���� ��γ���?','iuser1','���Բ� ������ ��ǰ���� �ٰ����ڽ��ϴ�. �����մϴ�.','GL�Ϻ��ƽ�183');
faq
insert into voc values('FAQ_3_N','ȸ�������� ��� �ϳ���?','ȸ�������� �ϰ� ������ ȸ�������� ��� �ؾ� �ϳ���?',null,
'ȸ������ ��ư�� ���� �� ȸ������ ���������� ȸ�������� �����Ͻø� �˴ϴ�.',null);
insert into voc values('FAQ_4_Y','ȸ��Ż��� ��� �ϳ���?','ȸ��Ż�� �ϰ� ������ ȸ�������� ��� �ؾ� �ϳ���?',null,
'�α��� �� ȸ�� Ż���ư�� ������ ȸ��Ż�� ��û�� �˴ϴ�. �����ڿ��� Ȯ�� �� ȸ�� Ż�� �����մϴ�. Ż�� �Ŀ��� ������ ��� ������ �����մϴ�.',null);


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
insert into customer values('test1','12341234','�׽�Ʈ',00000000000,0,4000000,'������')
select * from customer where tcash >= 2000000 and tcash < 6000000
update customer set grade='���ν淯' where tcash >= 2000000 and tcash < 6000000

insert into coupon values('grade_2','�������!',0.1,(select id from customer where grade='���ν淯'),'2016-12-20');
select * from coupon

cupid varchar2(30),
  cupname varchar2(50),
  percent number,
  customid varchar2(20),
  cupperi varchar2(20)  

select cupid, cupname, percent, id, cupperi from coupon inner join customer on customer.id = coupon.customid where customer.grade='���ν淯'
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
INSERT INTO coupon (cupid,cupname,percent,customid,cupperi) (select 'grade'||seq_gcup.nextval,'��� ����',0.1,id, TO_CHAR(LAST_DAY(SYSDATE),'YYYY-MM-DD') cupperi from customer, dual where customer.grade='���ν淯')
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
 user4  12341234 ����   1012121212     0         0 ������

select * from CUSTOMER
create table mainimg(
mainid varchar2(20),
title varchar2(100),
img varchar2(100)
)

select * from voc where proid='FM����M1P6'
select * from mainimg
insert into mainimg values('main1','���簡 ��Ƽ����� ��, ����','main3.jpg');
insert into mainimg values('main2','�Ѱܿ��� ����ī�� 3�� 5��','main1.jpg');
insert into mainimg values('main3','���ظ� ǰ�� ���� ȣ�̰�','main2.jpg');
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
insert into review values('FMiuAO9','FM����M1P6','iuser2','���� �� �ٳ�Խ��ϴ�.','���� ���ֵ� �����̾����ϴ�. �ٸ��е鵵 �� �ѹ� ������! ��õ��õ!!',5);