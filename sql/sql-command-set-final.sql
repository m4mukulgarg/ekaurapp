drop table patient;
create table patient(
	email varchar(100) PRIMARY KEY,
	password varchar(100) NOT NULL,
	name varchar(32) NOT NULL,
	address varchar(1000) NOT NULL,
	age int(3) NOT NULL,
	allergies varchar(1000),
	appointmentId varchar (100),
	bloodGroup varchar(3) NOT NULL,
	bloodPressure varchar (7),
	currentMedications varchar(1000),
	height int(3) not null,
	pastDiseases varchar(1000),
	weight int(3) not null
);
create table doctor(
	email varchar(100) PRIMARY KEY,
	password varchar(100) NOT NULL,
	name varchar(32) NOT NULL,
	department varchar(32) NOT NULL
)