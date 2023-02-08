create schema DML;
set search_path to DML;

create table Studenti (
    Matricola integer primary key,
    Nome_Studente varchar(30) not null,
    Cognome_Studente varchar(30) not null,
    Città_Res varchar(30) not null,
    Sesso char(1) not null,
    Num_Telefono numeric
);

create table Docenti (
    Matricola_Doc integer primary key,
    Nome_Doc varchar(30) not null,
    Cognome_Doc varchar(30) not null,
    Stipendio integer,
    Dipartimento varchar(30)
);

create table Corsi (
    Cod_Corso integer primary key,
    Nome_Corso varchar(30) not null,
    Num_Crediti integer not null,
    Matricola_Docente integer not null,
    foreign key (Matricola_Docente) references Docenti(Matricola_Doc)
                   on delete cascade on update cascade
);

create table EsamiSuperati (
    Matricola integer,
    Cod_Corso integer,
    Voto integer,
    primary key (Matricola,Cod_Corso),
    foreign key (Matricola) references Studenti(Matricola)
                           on delete cascade on update cascade,
    foreign key (Cod_Corso) references Corsi(Cod_Corso)
                            on delete cascade on update cascade
);

create table Iscritti_Esami (
    Data date,
    Cod_Corso integer,
    Matricola integer,
    Voto integer,
    primary key (Data,Cod_Corso,Matricola),
    foreign key (Cod_Corso) references Corsi(Cod_Corso)
                            on delete cascade on update cascade,
    foreign key (Matricola) references Studenti(Matricola)
                            on delete cascade on update cascade
);


insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (107753, 'Giovanni', 'Viola', 'Milano', 'M', 3207745683);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (109876, 'Alina', 'Rossi', 'Roma', 'F', 3479032548);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (142465, 'Nadia', 'Battaglia', 'Torino', 'F', 3470055128);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (162780, 'Ernesto', 'Gallo', 'Bologna', 'M', 3339990143);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (110992, 'Mattia', 'Livetti', 'Udine', 'M', 6398163537);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (227456, 'Jacopo', 'Fachin', 'Trieste', 'M', 8253640443);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (108803, 'Carlo', 'Rotter', 'Milano', 'M', null);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (997224, 'Luca', 'Dereani', 'Olbia', 'M', 5571390086);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (443678, 'Clara', 'Sanchez', 'Pordenone', 'F', null);
insert into studenti (matricola, nome_studente, cognome_studente, città_res, sesso, num_telefono)
values (123432, 'Marco', 'Farinelli', 'Padova', 'M', null);

--
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (545868, 'Giovanna', 'Bruni', 20000, 'DAME');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (164382, 'Carla', 'Zoppetto', 25000, 'DILL');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (242124, 'Gianpaolo', 'Galvani', 18000, 'DIES');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (810651, 'Donatella', 'Gallo', 23000, 'DISG');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (947807, 'Elena', 'Visintini', 22000, 'DMIF');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (352530, 'Vito', 'Liguori', 26000, 'DIUM');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (335828, 'Alessandro', 'Treves', 28000, 'DIES');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (178672, 'Mario', 'Corradi', 19000, 'DMIF');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (474481, 'Letizia', 'Albertini', 23500, 'DPIA');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (681778, 'Giuseppe', 'Luria', 30000, 'DAME');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (254002, 'Simone', 'Della Mea', 18000, 'DPIA');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (556734, 'Eleonora', 'Torrisi', 33000, 'DILL');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (804702, 'Lorenzo', 'Mascagni', 38000, 'DIES');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (603697, 'Marta', 'Volpi', 35000, 'DIUM');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (202894, 'Giacomo', 'Mecchia', 16000, 'DISG');
insert into docenti (matricola_doc, nome_doc, cognome_doc, stipendio, dipartimento)
values (101676, 'Fabrizio', 'Rossi', 23500, 'DMIF');

--
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (12, 'Fisioterapia', 9, 545868);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (21, 'Infermieristica', 12, 545868);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (23, 'Scienza dello sport', 9, 681778);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (32, 'Banca e finanza', 10, 242124);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (34, 'Economia aziendale', 6, 335828);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (43, 'Relazioni pubbliche', 8, 352530);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (54, 'Mediazione culturale', 5, 352530);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (45, 'Informatica', 9, 947807);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (64, 'Matematica', 12, 178672);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (46, 'Ingegneria gestionale', 6, 474481);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (86, 'Ingegneria meccanica', 9, 474481);
insert into corsi (cod_corso, nome_corso, num_crediti, matricola_docente)
values (67, 'Giurisprudenza', 8, 810651);

--
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-01-15', 45, 109876, 24);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-01-18', 32, 110992, 22);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-02-20', 64, 227456, 27);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-02-24', 23, 108803, 21);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-06-23', 45, 142465, 18);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-07-16', 86, 107753, 20);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2022-01-07', 34, 162780, 16);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2022-01-28', 34, 162780, 15);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2022-06-23', 34, 162780, 17);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2022-07-18', 34, 162780, 16);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-01-08', 34, 162780, 14);
insert into iscritti_esami (data, cod_corso, matricola, voto)
values ('2023-02-22', 34, 162780, 12);

--
insert into esamisuperati (matricola, cod_corso, voto)
values (109876, 45, 24);
insert into esamisuperati (matricola, cod_corso, voto)
values (110992, 32, 22);
insert into esamisuperati (matricola, cod_corso, voto)
values (227456, 64, 27);
insert into esamisuperati (matricola, cod_corso, voto)
values (108803, 23, 21);
insert into esamisuperati (matricola, cod_corso, voto)
values (142465, 45, 18);
insert into esamisuperati (matricola, cod_corso, voto)
values (107753, 86, 20);
insert into esamisuperati (matricola, cod_corso, voto)
values (123432, 12, 19);
insert into esamisuperati (matricola, cod_corso, voto)
values (443678, 43, 30);
insert into esamisuperati (matricola, cod_corso, voto)
values (109876, 64, 28);
insert into esamisuperati (matricola, cod_corso, voto)
values (110992, 34, 26);
insert into esamisuperati (matricola, cod_corso, voto)
values (109876, 86, 27);
insert into esamisuperati (matricola, cod_corso, voto)
values (123432, 46, 30);
insert into esamisuperati (matricola, cod_corso, voto)
values (123432, 45, 25);
insert into esamisuperati (matricola, cod_corso, voto)
values (443678, 21, 26);