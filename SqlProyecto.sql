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


--------------
CREATE TABLE [User]
(   
	 idUser int IDENTITY (1,1),
	 [name] varchar(50) NOT NULL,
	 [password] varchar(50) NOT NULL,
	 email  varchar(50) NOT NULL,
	 [status] bit NOT NULL DEFAULT 1,
	 CONSTRAINT PK_User PRIMARY KEY (idUser)
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
CREATE TABLE Objective (    
 idObjective int IDENTITY (1,1), 
 specific varchar(50) NOT NULL, 
 general varchar(50) NOT NULL, 
 [status] bit NOT NULL DEFAULT 1, 
 idUserCreate int NULL,
dateCreate date NULL,
idUserModified int NULL,
dateModified date NULL
 CONSTRAINT PK_Objective PRIMARY KEY (idObjective)
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

---------------
CREATE INDEX IX_User ON User(idUser)
CREATE INDEX IX_Purpose ON Purpose(idPurpose)
CREATE INDEX IX_Objective ON Objective(idObjective)
CREATE INDEX IX_Territory ON Territory(idTerritory)
CREATE INDEX IX_Agreement ON Agreement(idAgreement)
CREATE INDEX IX_Zone ON [Zone](idZone)

-------------------
ALTER TABLE Purpose
ADD CONSTRAINT FK_UserCreatePurpose FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Purpose
ADD CONSTRAINT FK_UserModifiedPurpose FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)
ALTER TABLE Objective
ADD CONSTRAINT FK_UserCreateObjective FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Objective
ADD CONSTRAINT FK_UserModifiedObjective FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)
ALTER TABLE Territory
ADD CONSTRAINT FK_UserCreateTerritory FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Territory
ADD CONSTRAINT FK_UserModifiedTerritory FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Agreement
ADD CONSTRAINT FK_UserCreateAgreement FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE Agreement
ADD CONSTRAINT FK_UserModifiedAgreement FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE [Zone]
ADD CONSTRAINT FK_UserCreateZone FOREIGN KEY (idUserCreate)
REFERENCES [User](idUser)

ALTER TABLE [Zone]
ADD CONSTRAINT FK_UserModifiedZone FOREIGN KEY (idUserModified)
REFERENCES [User](idUser)

ALTER TABLE Agreement
ADD CONSTRAINT FK_AgreementObjective FOREIGN KEY (idObjetive)
REFERENCES Objective (idObjective)

ALTER TABLE Agreement
ADD CONSTRAINT FK_AgreementTerritory FOREIGN KEY (idTerritory)
REFERENCES Territory (idTerritory)
-------------
INSERT INTO  Purpose(investigation,practice,resindence,socialService,external1,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('si','no','si','no','no',1,GETDATE(),1,GETDATE());

INSERT INTO Objective(specific,general,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES ('si','no','no',1,GETDATE(),1,GETDATE());

INSERT INTO Zone(regional, local,national,idUsercreate,datecreate,idusermodified,datemodified )
values  ('si','no','no' ,1,GETDATE(),1,GETDATE());

INSERT INTO Territory(nacional,internacional,idStudent,idUsercreate,dateCreate,idUserModified,dateModified)
VALUES  ('no','si',1,1,GETDATE(),1,GETDATE());

INSERT INTO Agreement(acronym,objetive,idObjetive,idTerritory,statusAgreement,idUserCreate,dateCreate,idUserModified,dateModified)
VALUES ('cfe','servicio',1,1,1,'vigente',GETDATE(),1,GETDATE());