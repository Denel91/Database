create schema scuola;
set search_path to scuola;

create table Studenti (
    Matricola numeric primary key,
    Cognome varchar(20) not null,
    Nome varchar(20) not null,
    Data_Nascita date not null
);

create table Esami (
    Codice_corso numeric not null,
    Studente numeric not null references Studenti(Matricola),
    Data date not null,
    Voto numeric not null,
    primary key (Codice_corso, Studente, Data)
);

