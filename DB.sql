USE master
GO
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name ='Book')
DROP DATABASE Book;
GO
CREATE  DATABASE Book
GO
USE  Book
GO 
IF EXISTS (SELECT * FROM sys.sysobjects WHERE name ='Users')
DROP TABLE Users
GO
CREATE TABLE Users(
  uid       int  PRIMARY KEY IDENTITY(1,1),      --�û����
  username  varchar(20) NOT null ,   --�û���
  password  varchar(20) NOT null ,    --����
  name      varchar(20) NOT null,     -- ��ʵ����
  sex      varchar(20) NOT null,     --�Ա�
  email     varchar(50) NOT null,      --����
  address    varchar(20) NOT null,        --���ڵ� 
city    varchar(20) NOT null,        --���ڵ� 
   phone     varchar(20) NOT null,          --�绰
  isadmin   bit default(0) --�Ƿ����Ա
)
GO
IF EXISTS (SELECT * FROM sys.sysobjects WHERE name ='category')
DROP TABLE Category
GO
CREATE TABLE Categories(
   cid int  PRIMARY KEY IDENTITY(1,1) ,  --������
   cname varchar(40) DEFAULT NULL,  --��������
)
GO
IF EXISTS (SELECT * FROM sys.sysobjects WHERE name ='Products')
DROP TABLE Products
GO
CREATE TABLE Products(
  pid       int  PRIMARY KEY IDENTITY(1,1),      --��Ʒ���
  pname     varchar(MAX) NOT null ,   --��Ʒ����
  price     MONEY NOT null ,    --��Ʒ�۸�
  imgurl    varchar(100) NOT null,     -- ��ƷͼƬ��ַ
  pdesc     varchar(200) NOT null,      --��Ʒ����
  cid       INT REFERENCES Categories(cid), --��Ʒ����ID
  pcount    int default(0), --��Ʒ��������
  pdate     datetime default(getdate()) --��Ʒ�ϼ�ʱ��
)
go
IF EXISTS (SELECT * FROM sys.sysobjects WHERE name ='Admins')
DROP TABLE Admins
go
create table Admins
(
	adminid		int	identity(1,1) primary key,		--����Աid(ʶ�����Ա)
	adminame	varchar(20) unique not null,		--����Ա�˺�
	adminpwd	varchar(20) not null,		--����Ա����
	status		int check(status = 1 or status = 2),--����Ա״̬(���á�������)
	remark		varchar(100) not null,		--����Ա��ϸ˵��(Ȩ��)
	admindate	datetime not null		--�����ù���Ա��ʱ��
)
go
--��ʼ������
INSERT INTO  Users VALUES ('mike.jiang','123','mike.jiang','��','mikejiang@163.com','����','�人','13582730231',1);
INSERT INTO  Users VALUES ('eric','123','eric.song','��','eric.song@163.com','����','�人','13927295820',default);
insert into Admins values('admin','svse',1,'ϵͳ����Ա',getdate());
INSERT INTO Categories VALUES ('����');
INSERT INTO Categories VALUES ('����');
INSERT INTO Categories VALUES ('����');
INSERT INTO Products VALUES ('׷���ݵ���',88,'/Content/images/selling01','���İ棬���ִ�Ӫ��ԲԲ�ж��Ƽ����°����͸�Ů������������',1,66,'2018-1-1');
INSERT INTO Products VALUES ('����õ�',99,'/Content/images/newBook01','��8��12��20:00ǰ�µ��˿ͣ�100%�д���ױ�ǩ����֮���µ��˿��ȵ��ȵ�ǩ�������ֵ���ʱ�䲻һ�£����λ���ĵȴ���',3,22,'2018-9-1');
INSERT INTO Products VALUES ('�����ӻ���',39,'/Content/images/selling02','����ҹ�С���Ұ���ᱸ�ܻ�ӭ��Ʒ����������С˵��ȴ����������',3,22,'2018-9-10');
INSERT INTO Products VALUES ('��������������',58,'/Content/images/selling03','����10������ɱƪ�£��������̷�����ε�Ϸ�����������ˣ��̸�ԲԲ��Ů����Ƕ�â��̨ʢ���Ƽ���',1,62,'2018-7-1');
INSERT INTO Products VALUES ('��ҹ��',38,'/Content/images/selling04','��Ұ��������С˵����֮����ȫ�¾�װ��ذ�',1,22,'2018-5-1');
INSERT INTO Products VALUES ('�ڶ���',66,'/Content/images/selling06','����ŷ��33�����ң��ٻ����ͼ��󽱡����������һ���¶��ĺ�����˭���������İڶ��ˣ��������Ĵ��ڣ�Ҳ����Ϊ����Ҫ�ҡ�',1,88,'2018-6-1');
INSERT INTO Products VALUES ('�������',33,'/Content/images/selling07','ÿ���˵������У������ޱȼ��ѵ���һ�꣬������������ö�����',1,52,'2018-8-12');
INSERT INTO Products VALUES ('����¶�',35,'/Content/images/selling08','�����������˹�����������İ��״���Ȩ��',1,55,'2018-7-21');
INSERT INTO Products VALUES ('������',46,'/Content/images/selling09','�����������������׫д�ļ�ͥ�������¼�����������棬Ӱ�켸���˵���Ʒ�������������ɢ�ģ�',1,58,'2018-8-21');
INSERT INTO Products VALUES ('�����ȫ����·��',35,'/Content/images/selling10','�����ȫ����·�� 2014�й�������ͼ��',1,88,'2018-10-11');
INSERT INTO Products VALUES ('��ļ�֣��ս�����',25,'/Content/images/newBook03','�������ھ���ʲô�������㲻Ҫ���Է�������Ϊ����û��һ�ּ�ֻᱻ����',1,28,'2018-9-11');
INSERT INTO Products VALUES ('��������ϵ��',18,'/Content/images/newBook06','ȫ8�ᣬ3-7������ɳ��汾��',1,58,'2018-6-25');

SElECT * from  Admins
SELECT * FROM  Users
SELECT * FROM  Categories
SELECT * FROM  Products


--select * from products order by pcount desc

--select * from products order by pdate desc
