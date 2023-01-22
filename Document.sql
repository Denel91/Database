create domain dom_codice as integer;
create domain dom_titolo as text;
create domain dom_pagine as integer;
create domain dom_durata as decimal;

create table Documento (
    codice dom_codice primary key,
    titolo dom_titolo not null
);

create table pdf (
    codice dom_codice primary key references Documento,
    pagine dom_pagine not null
);

create table video (
    codice dom_codice primary key references Documento,
    durata dom_durata not null
);

