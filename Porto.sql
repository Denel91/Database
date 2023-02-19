create schema Porto;
set search_path to Porto;

create table Porto (
    Città varchar(20) primary key,
    Nazione varchar(20) not null,
    Numero_Banchine integer
);

create table Nave (
    Tipo_Nave varchar(50) primary key,
    Numero_Passeggeri integer,
    Quantità_Merci integer
);

create table CorsaGiornaliera (
    Id_Corsa integer primary key,
    Giorno varchar(20) not null,
    Città_Partenza varchar(20) not null references Porto(Città),
    Città_Arrivo  varchar(20) not null references Porto(Città),
    Ora_Partenza time not null,
    Ora_Arrivo time not null,
    Nave varchar(50) not null references Nave(Tipo_Nave)
);