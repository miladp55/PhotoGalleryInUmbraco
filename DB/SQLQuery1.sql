create table tblAspNetUsers(
Id nvarchar(450) not null primary key,
UserName nvarchar(256) not null,
NormalizedUserName nvarchar(256) not null,
Email nvarchar(256) not null,
NormalizedEmail nvarchar(256) not null,
EmailConfirmed bit not null,
PasswordHash nvarchar(max) null,
SecurityStamp nvarchar(max) null,
PhoneNumber nvarchar(max) not null,
PhoneNumberConfirmed bit not null,
TwoFactorEnabled bit not null,
LockoutEnd datetimeoffset(7)  null,
LockoutEnabled bit not null,
AccessFailedCount int not null,
ConcurrencyStamp nvarchar(max) null,
AccessKey nvarchar(450) not null,
CreationDateTime datetime not null,
[Name] nvarchar(50) null,
Family nvarchar(250) null,
Age int null,
Gender bit null,
BirthDateTime datetime null
);


create table tblAspNetRoles(
Id nvarchar(450) not null primary key,
Name nvarchar(256) null,
NormalizedName nvarchar(256) null,
ConcurrencyStamp nvarchar(max) null)


create table tblAspNetUserRoles(
UserId nvarchar(450) NOT NULL FOREIGN KEY REFERENCES tblAspNetUsers(Id) ,
RoleId nvarchar(450) NOT NULL FOREIGN KEY REFERENCES tblAspNetRoles(Id) ,
)



create table tblContact(
Id int not null primary key identity(1,1),
[Name] nvarchar(50) not null,
Family nvarchar(250) not null,
[Subject] nvarchar(500) not null,
Email nvarchar(256) not null,
[Message] nvarchar(900) not null,
CreationDateTime datetime not null,
SeenDateTime datetime null,
)

create table tblCategory(
Id int not null primary key identity(1,1),
[Title] nvarchar(500) not null,
Active bit not null
)

alter table tblCategory
	add constraint DF_Cate_Active
	default 1 for Active

create table tblPost(
Id int not null primary key identity(1,1),
CreationUserId nvarchar(450) not null foreign key references tblAspNetUsers(Id),
CategoryId int null foreign key references tblCategory(Id),
[Title] nvarchar(500) not null,
[Text] nvarchar(900) not null,
CreationDateTime datetime not null,
Active bit not null
)

alter table tblPost
	add constraint DF_Post_Active
	default 1 for Active

	create table tblComment(
Id int not null primary key identity(1,1),
MotherId int null foreign key references tblComment(Id),
PostId int not null foreign key references tblPost(Id),
[Text] nvarchar(900) not null,
CreationDateTime datetime not null,
AcceptedAdminUserId nvarchar(450) null foreign key references tblAspNetUsers(Id),
Active bit not null
)
alter table tblComment
	add constraint DF_Comment_Active
	default 0 for Active


		create table tblTag(
Id int not null primary key identity(1,1),
[Title] nvarchar(500) not null,
Active bit not null
)

alter table tblTag
	add constraint DF_Tag_Active
	default 1 for Active



	create table tblTagPosts(
TagId int NOT NULL FOREIGN KEY REFERENCES tblTag(Id) ,
PostId int NOT NULL FOREIGN KEY REFERENCES tblPost(Id) ,
)