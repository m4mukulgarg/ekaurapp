drop table cardiology;
drop table ophthalmology;
drop table dermatology;
drop table neurology;
drop table psychology;
create table cardiology(
	name varchar(100) not null,
	email varchar(100) primary key,
	dt Varchar(30) not null,
	tm varchar(30) not null
);
create table ophthalmology(
	name varchar(100) not null,
	email varchar(100) primary key,
	dt Varchar(30) not null,
	tm varchar(30) not null
);
create table dermatology(
	name varchar(100) not null,
	email varchar(100) primary key,
	dt Varchar(30) not null,
	tm varchar(30) not null
);
create table psychology(
	name varchar(100) not null,
	email varchar(100) primary key,
	dt Varchar(30) not null,
	tm varchar(30) not null
);
create table neurology(
	name varchar(100) not null,
	email varchar(100) primary key,
	dt Varchar(30) not null,
	tm varchar(30) not null
);