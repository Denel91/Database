create schema Negozio;
set search_path to Negozio;

create table Negozi(
    ID_negozio integer primary key,
    Nome varchar(30),
    Città varchar(30)
);

create table Prodotti(
    Cod_prodotto integer primary key,
    Nome_prodotto varchar(30) not null,
    Marca varchar(30)
);

create table Listino(
    Negozio integer,
    Prodotto integer,
    Prezzo integer not null,
    primary key (Negozio, Prodotto)
);

alter table Listino
add constraint listino_FK1 foreign key (Negozio) references Negozi(ID_negozio)
on delete cascade on update restrict;

alter table Listino
add constraint listino_FK2 foreign key (Prodotto) references Prodotti(Cod_prodotto)
on delete cascade on update restrict;

