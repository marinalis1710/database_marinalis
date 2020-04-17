-------------------------
-- Create Cocktails table
-------------------------

CREATE TABLE  Cocktails 
(
cocktail_name varchar(20) NOT NULL
);

-------------------------
-- Create Bartenders table
-------------------------

CREATE TABLE Bartenders
(
bartender_name varchar(30) NOT NULL
, cocktail_name varchar(20) NOT NULL
);

-------------------------
-- Create Bars table
-------------------------

CREATE TABLE Bars
(
bar_name varchar(30) NOT NULL
, bartender_name varchar(30) NOT NULL
, location varchar(20) NOT NULL
);

----------------------
-- Define primary keys
----------------------
ALTER TABLE Cocktails ADD CONSTRAINT PK_Cocktails PRIMARY KEY (cocktail_name);
ALTER TABLE Bartenders ADD CONSTRAINT PK_Bartenders PRIMARY KEY (bartender_name);
ALTER TABLE Bars ADD CONSTRAINT PK_Bars PRIMARY KEY (bar_name);

----------------------
-- Define foreign keys
----------------------
ALTER TABLE Bartenders
ADD CONSTRAINT FK_Bartenders_Cocktails FOREIGN KEY (cocktail_name) REFERENCES Cocktails (cocktail_name);
ALTER TABLE Bars
ADD CONSTRAINT FK_Bars_Bartenders FOREIGN KEY (bartender_name) REFERENCES Bartenders (bartender_name);
