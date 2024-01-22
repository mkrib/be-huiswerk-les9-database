DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Televisions;
DROP TABLE IF EXISTS Remote;
DROP TABLE IF EXISTS CiModule;
DROP TABLE IF EXISTS Bracket;

CREATE TABLE Users
(
userid serial PRIMARY KEY,
username varchar(100) NOT NULL UNIQUE,
password varchar(100) NOT NULL
);

CREATE TABLE Remote
(
Remoteid serial PRIMARY KEY,
Name varchar (100) UNIQUE,
Brand varchar(50),
Price decimal,
Currentstock integer,
Itemssold integer,
Compatiblewith varchar(50),
Batterytype varchar(50)
);

CREATE TABLE CiModule
(
Cimoduleid serial PRIMARY KEY,
Name varchar (100) UNIQUE,
Brand varchar(50),
Price decimal,
Currentstock integer,
Itemssold integer
);

CREATE TABLE Bracket
(
Bracketid serial PRIMARY KEY,
Name varchar (100) UNIQUE,
Brand varchar(50),
Price decimal,
Currentstock integer,
Itemssold integer,
Adjustable bit
);

CREATE TABLE Televisions 
(
Televisionid serial PRIMARY KEY,
Name varchar(100) UNIQUE,
Brand varchar(50),
Price decimal,
Currentstock integer,
Itemssold integer,
Type varchar(100),
Available decimal,
Refreshrate decimal,
Screentype varchar(30),
Remoteid int,
Cimoduleid int,
Bracketid int,
FOREIGN KEY (Remoteid) REFERENCES Remote(Remoteid),
FOREIGN KEY (Cimoduleid) REFERENCES CiModule(Cimoduleid),
FOREIGN KEY (Bracketid) REFERENCES Bracket(Bracketid)
);

INSERT INTO Users (username, password) values ('Gebruikersnaam1', 'wachtwoord'), ('Gebruikersnaam2', 'wachtwoord'), ('Gebruiker3', 'wachtwoord2');

INSERT INTO Remote (name) values ('Ionic');
INSERT INTO Remote (name, price, compatiblewith) values ('Remote1', 35, 'TV1'), ('Remote2', 18, 'TV2'), ('Remote3', 22, 'TV3');

INSERT INTO CiModule (name, brand, price) values ('CM1', 'Samsung', 100), ('CM2', 'LG', 80), ('CM3', 'Samsung', 84);

INSERT INTO Bracket (name, price, adjustable) values ('Bracket1', 80, B'0'), ('Bracket2', 72, B'1'), ('Bracket3', 60, B'1'), ('Bracket4', 80, B'1');

INSERT INTO Televisions (name, brand, price, currentstock, itemssold, type, available, refreshrate, screentype) values ('Ionic', 'Samsung', 350, 4, 5, '1234', 2, 2, '40 inch');
INSERT INTO Televisions (name, brand, price, screentype, remoteid, bracketid, cimoduleid) values ('TV1', 'Philips', 500, '60 inch', 2, 1, 2), ('TV2', 'Sony', 550, '64 inch', 3, 1, 2), ('TV3', 'Sony', 800, '75 inch', 4, 3, 1);

SELECT * FROM Televisions;
SELECT name, brand, price FROM Televisions;
SELECT name, remoteid, cimoduleid, bracketid FROM Televisions;

SELECT * FROM Users;

SELECT * FROM Remote;
SELECT name, price, compatiblewith FROM Remote;

SELECT * FROM Bracket;
SELECT bracketid, name, price, adjustable FROM Bracket;

SELECT * FROM CiModule;
SELECT cimoduleid, name, brand, price FROM CiModule;