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
  uid       int  PRIMARY KEY IDENTITY(1,1),      --用户编号
  username  varchar(20) NOT null ,   --用户名
  password  varchar(20) NOT null ,    --密码
  name      varchar(20) NOT null,     -- 真实姓名
  sex      varchar(20) NOT null,     --性别
  email     varchar(50) NOT null,      --邮箱
  address    varchar(20) NOT null,        --所在地 
city    varchar(20) NOT null,        --所在地 
   phone     varchar(20) NOT null,          --电话
  isadmin   bit default(0) --是否管理员
)
GO
IF EXISTS (SELECT * FROM sys.sysobjects WHERE name ='category')
DROP TABLE Category
GO
CREATE TABLE Categories(
   cid int  PRIMARY KEY IDENTITY(1,1) ,  --分类编号
   cname varchar(40) DEFAULT NULL,  --分类名称
)
GO
IF EXISTS (SELECT * FROM sys.sysobjects WHERE name ='Products')
DROP TABLE Products
GO
CREATE TABLE Products(
  pid       int  PRIMARY KEY IDENTITY(1,1),      --商品编号
  pname     varchar(MAX) NOT null ,   --商品名称
  price     MONEY NOT null ,    --商品价格
  imgurl    varchar(100) NOT null,     -- 商品图片地址
  pdesc     varchar(200) NOT null,      --商品描述
  cid       INT REFERENCES Categories(cid), --商品分类ID
  pcount    int default(0), --商品销售数量
  pdate     datetime default(getdate()) --商品上架时间
)
go
IF EXISTS (SELECT * FROM sys.sysobjects WHERE name ='Admins')
DROP TABLE Admins
go
create table Admins
(
	adminid		int	identity(1,1) primary key,		--管理员id(识别管理员)
	adminame	varchar(20) unique not null,		--管理员账号
	adminpwd	varchar(20) not null,		--管理员密码
	status		int check(status = 1 or status = 2),--管理员状态(可用、不可用)
	remark		varchar(100) not null,		--管理员详细说明(权限)
	admindate	datetime not null		--任命该管理员的时间
)
go
--初始化数据
INSERT INTO  Users VALUES ('mike.jiang','123','mike.jiang','男','mikejiang@163.com','湖北','武汉','13582730231',1);
INSERT INTO  Users VALUES ('eric','123','eric.song','男','eric.song@163.com','湖北','武汉','13927295820',default);
insert into Admins values('admin','svse',1,'系统管理员',getdate());
INSERT INTO Categories VALUES ('名著');
INSERT INTO Categories VALUES ('玄幻');
INSERT INTO Categories VALUES ('都市');
INSERT INTO Products VALUES ('追风筝的人',88,'/Content/images/selling01','中文版，快乐大本营高圆圆感动推荐，奥巴马送给女儿的新年礼物',1,66,'2018-1-1');
INSERT INTO Products VALUES ('好吗好的',99,'/Content/images/newBook01','凡8月12日20:00前下单顾客，100%有大冰亲笔签名，之后下单顾客先到先得签名。各仓到货时间不一致，请各位耐心等待。',3,22,'2018-9-1');
INSERT INTO Products VALUES ('解忧杂货店',39,'/Content/images/selling02','《白夜行》后东野圭吾备受欢迎作品：不是推理小说，却更扣人心弦',3,22,'2018-9-10');
INSERT INTO Products VALUES ('天才在左疯子在右',58,'/Content/images/selling03','新增10个被封杀篇章！看高智商疯子如何调戏和羞辱正常人！继高圆圆后，女神陈乔恩芒果台盛情推荐！',1,62,'2018-7-1');
INSERT INTO Products VALUES ('白夜行',38,'/Content/images/selling04','东野圭吾推理小说无冕之王。全新精装典藏版',1,22,'2018-5-1');
INSERT INTO Products VALUES ('摆渡人',66,'/Content/images/selling06','畅销欧美33个国家，荣获多项图书大奖。如果命运是一条孤独的河流，谁会是你灵魂的摆渡人？如果我真的存在，也是因为你需要我。',1,88,'2018-6-1');
INSERT INTO Products VALUES ('岛上书店',33,'/Content/images/selling07','每个人的生命中，都有无比艰难的那一年，将人生变得美好而辽阔',1,52,'2018-8-12');
INSERT INTO Products VALUES ('百年孤独',35,'/Content/images/selling08','加西亚马尔克斯代表作，中文版首次授权！',1,55,'2018-7-21');
INSERT INTO Products VALUES ('我们仨',46,'/Content/images/selling09','《我们仨》是杨绛先生撰写的家庭生活回忆录，三联书店出版，影响几代人的作品，杨绛先生经典散文！',1,58,'2018-8-21');
INSERT INTO Products VALUES ('从你的全世界路过',35,'/Content/images/selling10','从你的全世界路过 2014中国好书榜获奖图书',1,88,'2018-10-11');
INSERT INTO Products VALUES ('你的坚持，终将美好',25,'/Content/images/newBook03','无论正在经历什么，都请你不要轻言放弃，因为从来没有一种坚持会被辜负',1,28,'2018-9-11');
INSERT INTO Products VALUES ('遇见美好系列',18,'/Content/images/newBook06','全8册，3-7岁心灵成长绘本。',1,58,'2018-6-25');

SElECT * from  Admins
SELECT * FROM  Users
SELECT * FROM  Categories
SELECT * FROM  Products


--select * from products order by pcount desc

--select * from products order by pdate desc
