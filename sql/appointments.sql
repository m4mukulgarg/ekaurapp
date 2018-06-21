create table Appointment(
	id varchar(100) primary key,
	patient varchar(100) not null,
	doctor  varchar(100) not null,
	department varchar (30) not NULL,
	dt Varchar(30) not null,
	isPending int(1) not null
);