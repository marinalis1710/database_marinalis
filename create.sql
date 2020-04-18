-------------------------
-- Create Cocktails table
-------------------------

CREATE TABLE  Cocktails 
(
cocktail_name varchar(50) NOT NULL PRIMARY KEY
);

-------------------------
-- Create Bartenders table
-------------------------

CREATE TABLE Bartenders
(
bartender_name varchar(30) PRIMARY KEY
);

-------------------------
-- Create Bars table
-------------------------

CREATE TABLE Bars
(
bar_name varchar(30) PRIMARY KEY
, location varchar(20) 
);

create table BarBartender (
bar_name varchar(40) references Bar(bar_name),
bartender_name varchar(40) references Bartender(bartender_name),
primary key (bar_name, bartender_name)
);

create table BartenderCocktail(
bartender_name varchar(40) references Bartender(bartender_name),
cocktail_name varchar(40) references Cocktail(cocktail_name),
primary key(bartender_name, cocktail_name)
);
