create database BARSSQL;
use BARSSQL;

CREATE TABLE `Form` (
  `Form ID` serial,
  `First Name` varchar(50),
  `Last Name` varchar(50),
  `Email` varchar(50),
  `Password` varchar(50),
  `GamerID` varchar(15),
  `Console` varchar(15),
  `Alaa` varchar(20),
  `Wayne` varchar(20),
  `THEBASEDGOD` varchar(20),
  `SentMessage` varchar(300),
  `ReceivedMessage` varchar(300),
  PRIMARY KEY (`GamerID`)
);

select * From Form;
truncate table Form;
drop table Form;



create table `admintable`(
`AdminName` varchar(15),
`Password` varchar(15),
`Status` boolean,
`Role` varchar(15)
);

insert into AdminTable values("Alaa", "Alaa", false, "Admin");
insert into AdminTable values("Wayne", "Wayne", false, "Admin");
insert into AdminTable values("THEBASEDGOD", "LilB", false, "Admin");

select * from AdminTable;
truncate table Admin;
drop table AdminTable;

CREATE TABLE `Message` (
  `GamerID` varchar(15),
  `Message` varchar(200),
  KEY `FK` (`GamerID`, `Message`)
);

