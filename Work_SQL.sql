create schema Work;
set search_path to Work;

create table Dipartimento (
    Nome_Dip varchar(20) primary key,
    Indirizzo varchar(50),
    Città varchar(20)
);

create table Impiegato (
    Matricola character(6) primary key,
    Nome varchar(20) not null,
    Cognome varchar(20) not null,
    Dipart varchar(15) references Dipartimento(Nome_Dip)
                       on delete set null
                       on update cascade,
    Ufficio numeric(3),
    Stipendio numeric(9) default 0,
    Città varchar(20),
    unique (Nome, Cognome)
);

--
insert into dipartimento (nome_dip, indirizzo, città)
values ('Amministrazione', 'Via Tito Livio, 27', 'Milano');
insert into dipartimento (nome_dip, indirizzo, città)
values ('Produzione', 'P.le Lavater, 3', 'Torino');
insert into dipartimento (nome_dip, indirizzo, città)
values ('Distribuzione', 'Via Segre, 9', 'Roma');
insert into dipartimento (nome_dip, indirizzo, città)
values ('Direzione', 'Via Tito Livio, 27', 'Milano');
insert into dipartimento (nome_dip, indirizzo, città)
values ('Ricerca', 'Via Venosa, 6', 'Milano');

insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('109987', 'Mario', 'Rossi', 'Amministrazione', 10, 45, 'Milano');
insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('107753', 'Carlo', 'Bianchi', 'Produzione', 20, 36, 'Torino');
insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('106652', 'Giovanni', 'Verdi', 'Amministrazione', 20, 40, 'Roma');
insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('102238', 'Franco', 'Neri', 'Distribuzione', 16, 45, 'Napoli');
insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('107924', 'Carlo', 'Rossi', 'Direzione', 14, 80, 'Milano');
insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('105562', 'Lorenzo', 'Gialli', 'Direzione', 7, 73, 'Genova');
insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('110442', 'Paola', 'Rosati', 'Amministrazione', 75, 40, 'Venezia');
insert into impiegato (matricola, nome, cognome, dipart, ufficio, stipendio, città)
values ('123432', 'Marco', 'Franco', 'Produzione', 20, 46, 'Roma');