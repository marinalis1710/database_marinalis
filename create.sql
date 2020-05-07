CREATE TABLE  Cocktail
(
cocktail_name varchar(50) NOT NULL PRIMARY KEY
);

CREATE TABLE human
(
human_name varchar(50) PRIMARY KEY
);


CREATE TABLE Bar
(
bar_name varchar(50) PRIMARY KEY
, city_name varchar(50) references city(city_name)
);

create table humanBar(
human_name varchar(50) references Human(human_name),
bar_name varchar(50) references Bar(bar_name),
primary key(human_name)
);

create table HumanCocktail(
cocktail_name varchar(50) references Cocktail(cocktail_name),
human_name varchar(50) references human(human_name),
primary key(cocktail_name)
);

create table City(
  city_name varchar(50) primary key
)
