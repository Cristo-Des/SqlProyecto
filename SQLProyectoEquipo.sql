USE master;
GO
IF DB_ID (N'Vinculation') IS NOT NULL
 DROP DATABASE Vinculation;
GO
CREATE DATABASE	Vinculation
ON
(NAME = Vinculation_dat,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\Vinculation.mdf', 
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
(NAME =Vinculation_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\Vinculation.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB )
GO
USE Vinculation;

GO	
--------------------------------------------------------
CREATE TABLE [User]
(   
	 idUser int IDENTITY (1,1),
	 [name] varchar(50) NOT NULL,
	 [password] varchar(50) NOT NULL,
	 email  varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 CONSTRAINT PK_User PRIMARY KEY (idUser)
);

CREATE TABLE Career (
idCareer int IDENTITY(1,1),
[name] varchar(50) NOT NULL,
duration varchar(20) NOT NULL,
[description] varchar(20) NOT NULL,
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Career Primary KEY(idCareer)
);

CREATE TABLE Objective (    
 idObjective int IDENTITY (1,1), 
 specific varchar(50) NOT NULL, 
 general varchar(50) NOT NULL, 
 status bit NOT NULL DEFAULT 1, 
 idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
 CONSTRAINT PK_Objective PRIMARY KEY (idObjective)
); 

CREATE TABLE TypePosition (    
 idTypePosition int IDENTITY (1,1), 
 [level] varchar(50) NOT NULL, 
 technicalAnalyst varchar(50) NOT NULL, 
 teacher varchar(50) NOT NULL, 
 divisionChief varchar(50) NOT NULL, 
 holderofthetransparencyUnit varchar(50) NOT NULL, 
 headofDepartment varchar(50) NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
 CONSTRAINT PK_TypePosition PRIMARY KEY (idTypePosition) 
); 

CREATE TABLE Proof(
idProof int IDENTITY (1,1), 
[date] date NOT NULL,
reason varchar(50) NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
  CONSTRAINT PK_Proof PRIMARY KEY (idProof)
); 

CREATE TABLE Purpose
(   
	 idPurpose int IDENTITY (1,1),
	investigation varchar(50) NOT NULL,
	practice varchar(50) NOT NULL,
	resindence varchar(50) NOT NULL,
	socialService varchar(50) NOT NULL,
	external1 varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
	 CONSTRAINT PK_Purpose PRIMARY KEY (idPurpose)
);
CREATE TABLE Sector 
(  
idSector int IDENTITY (1,1), 
public1 varchar(3) NOT NULL, 
private1 varchar(3) NOT NULL, 
service1 varchar(3) NOT NULL, 
social varchar(3) NOT NULL, 
educative varchar(3) NOT NULL, 
productive varchar(3) NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Sector PRIMARY KEY (idSector) 
); 
CREATE TABLE [Subject]
(   
	 idSubject int IDENTITY (1,1),
	 [name] varchar(50) NOT NULL,
	 credit varchar(30) NOT NULL,
	 unit varchar(50) NOT NULL,
	  characteristic varchar(50) NOT NULL,
	  keyMatter varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
	 CONSTRAINT PK_Subject PRIMARY KEY (idSubject)
);
CREATE TABLE Territory
(   
	 idTerritory int IDENTITY (1,1),
	nacional varchar(2) NOT NULL,
	internacional varchar(2) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
	 CONSTRAINT PK_Territory PRIMARY KEY (idTerritory)
);

CREATE TABLE [Zone] (
idZone int IDENTITY (1,1) ,
regional varchar(30)NOT NULL,
[local] varchar(30)NOT NULL, 
[national] varchar(30)NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idUsercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_Zone Primary KEY(idZone) 
);
 CREATE TABLE Student
(   
	 idStudent int IDENTITY (1,1),
	[name] varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	mothersthestName varchar(50) NOT NULL,
	enrollment varchar(50) NOT NULL,
	birthdate date NOT NULL,
	curp char (18 )NOT NULL,
	phone char (10 )NOT NULL,
	rfc char (13 )NOT NULL,
	socialSegurity char (11) NOT NULL,
	idVisit int NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 IdUserCreate int null,
	 creationdate date NULL,
	 IdUserModify int null,
	 modified date null
	 CONSTRAINT PK_Student PRIMARY KEY (idStudent)
);

 CREATE TABLE Activity 
(    
 idActivity int IDENTITY (1,1), 
 practice varchar(50) NOT NULL, 
 residence varchar(50) NOT NULL, 
 stay varchar(50) NOT NULL, 
 socialservice varchar(50) NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idStudent int NOT NULL, 
 idusercreate int NULL, 
 datecreate date NULL, 
 idusermodified int NULL, 
 datemodified date NULL 
 CONSTRAINT PK_Activity PRIMARY KEY (idActivity) 
 );

 CREATE TABLE Agreement (
idAgreement int IDENTITY  (1,1),
acronym varchar(50) NOT NULL,
objetive varchar(25)NOT NULL,
idObjetive int NOT NULL,
idTerritory int NOT NULL,
statusAgreement varchar(50) NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Agreement Primary KEY(idAgreement)
);

CREATE TABLE Company (
idCompany int IDENTITY(1,1),
[name] varchar(50) NOT NULL,
email varchar(50) NOT NULL,
phone char(10) NOT NULL,
[address] varchar(50) NOT NULL,
identificationNumber varchar(50) NOT NULL,
idSector int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Company Primary KEY(idCompany)
);


CREATE TABLE CompanyStudent (
IdCompanyStudent int IDENTITY(1,1),
[date] Date NULL,
workplace varchar(50) NOT NULL,
idStudent int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_CompanyStudent Primary KEY(idCompanyStudent)
);

CREATE TABLE Employee (
idEmployee int IDENTITY(1,1),
[name] varchar(50) NOT NULL,
lastname varchar (50) NOT NULL,
[mother'sLastName] varchar(50)NOT NULL,
gender varchar(50) NOT NULL,
phone char(10) NOT NULL,
email varchar(50) NOT NULL,
[address] varchar(100)NOT NULL, 
socialSecurity char(11)NOT NULL,
dateOfHire date NOT NULL,
idSubject int NOT NULL,
idStudent int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Employee Primary KEY(idEmployee)
);
CREATE TABLE Empreneur(
idEmpreneur int IDENTITY(1,1),
request varchar(50) NOT NULL,
objetive varchar(50) NOT NULL,
codeOfEmpreneur varchar(50) NOT NULL,
workteam varchar(50)NOT NULL,
startdate date NOT NULL,
finaldate date NOT NULL,
duration varchar(50) NOT NULL,
idEmployee int NOT NULL,
idStudent int NOT NULL,
[status] bit NOT NULL DEFAULT 1, 
idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
CONSTRAINT PK_Empreneur Primary KEY(idEmpreneur)
);
Create table Visit 
(
idVisit int IDENTITY (1,1) ,
numberofstudent int NOT NULL, 
duration varchar(50) NOT NULL, 
objetive varchar(100)NOT NULL ,
aplicacion date NOT NULL, 
datevisit date NOT NULL,
requiretransportation varchar(10) NOT NULL ,
result varchar(150)NOT NULL ,
idCompany int NOT NULL ,
idZone int NOT NULL,
idEmployee int NOT NULL,
status bit NOT NULL DEFAULT 1 ,
idUsercreate int NOT NULL ,
datecreate date NOT NULL,
idusermodified int NOT NULL ,
datemodified date NOT NULL ,
CONSTRAINT PK_Visit Primary KEY(idVisit) 
);

CREATE TABLE OfficeRequestcommission 
(    
 idOfficeRequestcommission int IDENTITY (1,1), 
 addressee varchar(50) NOT NULL, 
 header varchar(50) NOT NULL, 
 afftair varchar(150) NOT NULL, 
 date1 date NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idEmploye int NOT NULL, 
 IdUserCreate int null, 
 creationdate date NULL, 
 IdUserModify int null, 
 modified date null 
 CONSTRAINT PK_OfficeRequestcommission PRIMARY KEY (idOfficeRequestcommission) 
); 

CREATE TABLE Position 
(    
 idPosition int IDENTITY (1,1), 
 jobDescription varchar(50) NOT NULL, 
 wage varchar(50) NOT NULL, 
 workingHours varchar(50) NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idTypePosition int NOT NULL, 
 IdUserCreate int null, 
 creationdate date NULL, 
 IdUserModify int null, 
 modified date null 
 CONSTRAINT PK_Position PRIMARY KEY (idPosition) 
); 
 CREATE TABLE StudyPlan 
(    
 idStudyPlan int IDENTITY (1,1), 
 objetive varchar(50) NOT NULL, 
 starDate date NOT NULL, 
 finalDate date NOT NULL, 
 key1 varchar(50) NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idCareer int NOT NUll, 
 IdUserCreate int NULL, 
 creationdate date NULL, 
 IdUserModify int NULL, 
 modified date NULL 
 CONSTRAINT PK_StudyPlan PRIMARY KEY (idStudyPlan) 
); 

CREATE TABLE Viatic
(    
	 idViatic int IDENTITY (1,1),
	place varchar(200) NOT NULL,
	description1 varchar(250) NOT NULL,
	amount decimal (10,2) NOT NULL,
	idEmployee int NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 IdUserCreate int null,
	 creationdate date NULL,
	 IdUserModify int null,
	 modified date null
	 CONSTRAINT PK_Viatic PRIMARY KEY (idViatic)
);

CREATE TABLE ActivityCompany 
(
idActivityCompany int IDENTITY (1,1),
idActivity int NOT NULL,
IdCompany int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUsercreate int NULL,
datecreate date NULL,
idusermodified int NULL, 
datemodified date NULL
CONSTRAINT PK_ActivityCompany Primary KEY(idActivityCompany) 
);

CREATE TABLE AgreementCompany 
(
idAgreementCompany int IDENTITY (1,1),
idAgreement int NOT NULL, 
IdCompany int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUsercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_AgreementCompany Primary KEY(idAgreementCompany) 
);

CREATE TABLE AgreementPurpose
(
idAgreementPurpose int IDENTITY (1,1),
idAgreement int NOT NULL, 
IdPurpose int NOT NULL,
[status] bit NOT NULL DEFAULT 1,
idUsercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_AgreementPurpose Primary KEY(idAgreementPurpose) 
);

CREATE TABLE EmployeePosition 
(    
idEmployeePosition int IDENTITY (1,1), 
IdEmployee int NOT NULL, 
IdPosition int NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idusercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_EmployeePosition PRIMARY KEY (idEmployeePosition) 
); 

CREATE TABLE SubjectStudyPlan 
(    
idSubjectStudyPlan int IDENTITY (1,1), 
IdSubject int NOT NULL, 
IdStudyPlan int NOT NULL, 
[status] bit NOT NULL DEFAULT 1, 
idusercreate int NULL, 
datecreate date NULL, 
idusermodified int NULL, 
datemodified date NULL 
CONSTRAINT PK_SubjectStudyPlan PRIMARY KEY (idSubjectStudyPlan) 
); 

---------------------Index----------------
CREATE INDEX IX_Activity ON Activity(idActivity)
CREATE INDEX IX_Agreement ON Agreement(idAgreement)
CREATE INDEX IX_Career ON Career(idCareer)
CREATE INDEX IX_Company ON Company(idCompany)
CREATE INDEX IX_CompanyStudent ON CompanyStudent(idCompanyStudent)
CREATE INDEX IX_Employee ON Employee(idEmployee)
CREATE INDEX IX_Entrepreneur ON Empreneur(idEmpreneur)
CREATE INDEX IX_Objective ON Objective(idObjective)
CREATE INDEX IX_OfficeRequestcommission ON OfficeRequestcommission(idOfficeRequestcommission)
CREATE INDEX IX_Position ON Position(idPosition)
CREATE INDEX IX_TypePosition ON TypePosition(idTypePosition)
CREATE INDEX IX_Proof ON Proof (idProof)
CREATE INDEX IX_Purpose ON Purpose(idPurpose)
CREATE INDEX IX_Sector ON Sector(idSector)
CREATE INDEX IX_Student ON Student  (idStudent )
CREATE INDEX IX_StudyPlan ON StudyPlan(idStudyPlan)
CREATE INDEX IX_Subject ON Subject(idSubject)
CREATE INDEX IX_Territory ON Territory(idTerritory)
CREATE INDEX IX_User ON [User](idUser)
CREATE INDEX IX_Viatic ON Viatic(idViatic)
CREATE INDEX IX_Visit ON Visit(idVisit)
CREATE INDEX IX_Zone ON Zone (idZone)
CREATE INDEX IX_ActivityCompany ON ActivityCompany(idActivityCompany)
CREATE INDEX IX_AgreementCompany ON AgreementCompany(idAgreementCompany)
CREATE INDEX IX_AgreementPurpose ON AgreementPurpose(idAgreementPurpose)
CREATE INDEX IX_EmployePosition ON EmployeePosition(idEmployeePosition)
CREATE INDEX IX_SubjectStudyPlan ON SubjectStudyPlan(idSubjectStudyPlan)

-------------------Alter Table----------------------------

ALTER TABLE Career
ADD CONSTRAINT FK_UserCreateCareer FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Career
ADD CONSTRAINT FK_UserModifiedCareer FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)
------
ALTER TABLE Objective
ADD CONSTRAINT FK_UserCreateObjective FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Objective
ADD CONSTRAINT FK_UserModifiedObjective FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE TypePosition
ADD CONSTRAINT FK_UserCreateTypePosition FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE TypePosition
ADD CONSTRAINT FK_UserModifiedTypePosition FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Activity
ADD CONSTRAINT FK_UserCreateActivity FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Activity
ADD CONSTRAINT FK_UserModifiedActivity FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Student
ADD CONSTRAINT FK_UserCreateStudent FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Student
ADD CONSTRAINT FK_UserModifiedStudent FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Agreement
ADD CONSTRAINT FK_UserCreateAgreement FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Agreement
ADD CONSTRAINT FK_UserModifiedAgreement FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Employee
ADD CONSTRAINT FK_UserCreateEmployee FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Employee
ADD CONSTRAINT FK_UserModifiedEmployee FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Empreneur
ADD CONSTRAINT FK_UserCreateEmpreneur FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Empreneur
ADD CONSTRAINT FK_UserModifiedEmpreneur FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Company
ADD CONSTRAINT FK_UserCreateCompany FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Company
ADD CONSTRAINT FK_UserModifiedCompany FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE CompanyStudent
ADD CONSTRAINT FK_UserCreateCompanyStudent FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE CompanyStudent
ADD CONSTRAINT FK_UserModifiedCompanyStudent FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Proof
ADD CONSTRAINT FK_UserCreateProof FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Proof
ADD CONSTRAINT FK_UserModifiedProof FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE [Subject]
ADD CONSTRAINT FK_UserCreateSubject FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE [Subject]
ADD CONSTRAINT FK_UserModifiedSubject FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE OfficeRequestcommission
ADD CONSTRAINT FK_UserCreateOfficeRequestcommission FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE OfficeRequestcommission
ADD CONSTRAINT FK_UserModifiedOfficeRequestcommission FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserCreateStudyPlan FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_UserModifiedStudyPlan FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Purpose
ADD CONSTRAINT FK_UserCreatePurpose FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Purpose
ADD CONSTRAINT FK_UserModifiedPurpose FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Position
ADD CONSTRAINT FK_UserCreatePosition FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Position
ADD CONSTRAINT FK_UserModifiedPosition FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Sector
ADD CONSTRAINT FK_UserCreateSector FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Sector
ADD CONSTRAINT FK_UserModifiedSector FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Territory
ADD CONSTRAINT FK_UserCreateTerritory FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Territory
ADD CONSTRAINT FK_UserModifiedTerritory FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserCreateViatic FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Viatic
ADD CONSTRAINT FK_UserModifiedViatic FOREIGN KEY (idUserModify)
REFERENCES [User](idUser)

ALTER TABLE Visit
ADD CONSTRAINT FK_UserCreateVisit FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Visit
ADD CONSTRAINT FK_UserModifiedVisit FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE [Zone]
ADD CONSTRAINT FK_UserCreateZone FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE [Zone]
ADD CONSTRAINT FK_UserModifiedZone FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE ActivityCompany
ADD CONSTRAINT FK_UserCreateActivityCompany FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE ActivityCompany
ADD CONSTRAINT FK_UserModifiedActivityCompany FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_UserCreateAgreementCompany FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_UserModifiedAgreementCompany FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_UserCreateAgreementPurpose FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_UserModifiedAgreementPurpose FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_UserCreateEmployeePosition FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_UserModifiedEmployeePosition FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_UserCreateSubjectStudyPlan FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_UserModifiedSubjectStudyPlan FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Activity
ADD CONSTRAINT FK_ActivityStudent FOREIGN KEY (idStudent)
REFERENCES Student(idStudent)

ALTER TABLE Student
ADD CONSTRAINT FK_StudentVisit FOREIGN KEY (idVisit)
REFERENCES Visit(idVisit)

ALTER TABLE Agreement
ADD CONSTRAINT FK_AgreementObjective FOREIGN KEY (idObjetive)
REFERENCES Objective (idObjective)

ALTER TABLE Agreement
ADD CONSTRAINT FK_AgreementTerritory FOREIGN KEY (idTerritory)
REFERENCES Territory (idTerritory)

ALTER TABLE Employee
ADD CONSTRAINT FK_AgreementSubject FOREIGN KEY (idSubject)
REFERENCES Subject (idSubject)

ALTER TABLE Employee
ADD CONSTRAINT FK_AgreementStudent FOREIGN KEY (idStudent)
REFERENCES Student (idStudent)


ALTER TABLE Empreneur
ADD CONSTRAINT FK_EmpreneurStudent FOREIGN KEY (idStudent)
REFERENCES Student (idStudent)

ALTER TABLE Empreneur
ADD CONSTRAINT FK_EmpreneurEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)

ALTER TABLE Company
ADD CONSTRAINT FK_CompanySector FOREIGN KEY (idSector)
REFERENCES Sector  (idSector)

ALTER TABLE CompanyStudent
ADD CONSTRAINT FK_CompanyStudentStudent FOREIGN KEY (idStudent)
REFERENCES Student (idStudent)

ALTER TABLE OfficeRequestcommission
ADD CONSTRAINT FK_OfficeRequestcommissionEmployee FOREIGN KEY (idEmploye)
REFERENCES Employee (idEmployee)

ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (idCareer)
REFERENCES Career (idCareer)

ALTER TABLE Position
ADD CONSTRAINT FK_PositionTypePosition FOREIGN KEY (idTypePosition)
REFERENCES TypePosition (idTypePosition)

ALTER TABLE Viatic
ADD CONSTRAINT FK_ViaticEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)


ALTER TABLE Visit
ADD CONSTRAINT FK_VisitCompany FOREIGN KEY (idCompany)
REFERENCES Company (idCompany)

ALTER TABLE Visit
ADD CONSTRAINT FK_VisitZone FOREIGN KEY (idZone)
REFERENCES Zone (idZone)

ALTER TABLE Visit
ADD CONSTRAINT FK_VisitidEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)

ALTER TABLE ActivityCompany
ADD CONSTRAINT FK_ActivityCompanyActivity FOREIGN KEY (idActivity)
REFERENCES Activity (idActivity)

ALTER TABLE ActivityCompany
ADD CONSTRAINT FK_ActivityCompanyCompany FOREIGN KEY (idCompany)
REFERENCES Company (idCompany)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_AgreementCompanyAgreement FOREIGN KEY (idAgreement)
REFERENCES Agreement (idAgreement)

ALTER TABLE AgreementCompany
ADD CONSTRAINT FK_AgreementCompanyCompany FOREIGN KEY (idCompany)
REFERENCES Company (idCompany)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_AgreementPurposePurpose FOREIGN KEY (idPurpose)
REFERENCES Purpose (idPurpose)

ALTER TABLE AgreementPurpose
ADD CONSTRAINT FK_AgreementPurposeAgreement FOREIGN KEY (idAgreement)
REFERENCES Agreement (idAgreement)


ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePositionEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePositionPosition FOREIGN KEY (idPosition)
REFERENCES Position (idPosition)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePositionEmployee FOREIGN KEY (idEmployee)
REFERENCES Employee (idEmployee)

ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePositionPosition FOREIGN KEY (idPosition)
REFERENCES Position (idPosition)

ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_SubjectStudyPlanSubject FOREIGN KEY (idSubject)
REFERENCES Subject (idSubject)

ALTER TABLE SubjectStudyPlan
ADD CONSTRAINT FK_SubjectStudyPlanStudyPlan FOREIGN KEY (idStudyPlan)
REFERENCES StudyPlan (idStudyPlan)


select * from Visit

-----------------------poblacion-----------
INSERT INTO [User] ([name],[password], email)
VALUES ('CRISTOBAL', 'Cri110100','elizondo@');

INSERT INTO CompanyStudent (date,workplace,idStudent,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('2023-01-23','heb',1,1,GETDATE(),1,GETDATE()),
('2023-01-23','heb',1,1,GETDATE(),1,GETDATE());

INSERt INTO Empreneur(request,objetive,codeOfEmpreneur,workteam,startdate,finaldate,duration,idEmployee,idStudent,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES('registrarse ','crear una app de ventas','76gu87','computadora''2022-01-20','2023-10-13''un año',1,1,1,GETDATE(),1,GETDATE()),
('Mandar papeleria','venta de galletas','7217','cocina''2/01/2022','23/1/2023''un año',1,1,1,GETDATE(),1,GETDATE());


INSERt INTO Activity(practice,residence,stay,socialservice,idStudent,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES('si ','si','no','si','1',1,GETDATE(),1,GETDATE()),
('si ','si','no','si','2',1,GETDATE(),1,GETDATE());

INSERT INTO Student (name,lastname,mothersthestName	,enrollment,birthdate,curp,phone,rfc,socialSegurity,idVisit,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('nallely','toledo','alonso','15171917','04-09-1996','TOASMNL000NLLN9','8771231123','1234256532','45123428',1,1,GETDATE(),1,GETDATE()),
('Nallely','toledo','alonso','15171987','06-09-1996','TOASMNL000fLLN9','87712765123','1234276532','45123428',1,1,GETDATE(),1,GETDATE());

INSERT INTO Agreement(acronym,objetive,idObjetive,idTerritory,statusAgreement,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES ('cfe','servicio',1,1,1,'vigente',GETDATE(),1,GETDATE());

INSERt INTO Company(name,email,phone,address,identificationNumber,idSector,dateCreate,idUserModified,dateModified)
VALUES('altos hornos de mexico','hornos@gmail.com,8661652344','kenedy 122 monclova','124',1,GETDATE(),1,GETDATE());

INSERT INTO  Purpose(investigation,practice,resindence,socialService,external1,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('si','no','si','no','no',1,GETDATE(),1,GETDATE());

INSERT INTO Objective(specific,general,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('si','no','no',1,GETDATE(),1,GETDATE());

INSERT INTO Zone(regional, local,national,idUsercreate,datecreate,idusermodified,datemodified )
values  ('si','no','no' ,1,GETDATE(),1,GETDATE());

INSERT INTO Territory(nacional,internacional,idStudent,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('no','si',1,1,GETDATE(),1,GETDATE());