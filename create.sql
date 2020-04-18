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

create table BartenderBar(
bartender_name varchar(30) references Bartender(bartender_name),
bar_name varchar(30) references Bar(bar_name),
primary key(bartender_name)
);

create table CocktailBartender(
cocktail_name varchar(30) references Cocktail(cocktail_name),
bartender_name varchar(30) references Bartender(bartender_name),
primary key(cocktail_name)
);
