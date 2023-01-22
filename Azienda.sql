create schema if not exists Azienda;
set search_path to Azienda;

create table Dipartimento (
    Nome_Dipartimento varchar(15) not null,
    Numero_Dipartimento integer not null check (Numero_Dipartimento > 0 and Numero_Dipartimento < 25),
    SSN_Dir char(9) not null,
    Data_inizio_Dir date,
    primary key (Numero_Dipartimento),
    unique (Nome_Dipartimento)
);

create table Impiegato (
    Nome varchar(15) not null,
    Cognome varchar(15) not null,
    SSN char(9) not null,
    Data_Nascita date,
    Indirizzo varchar(30),
    Sesso char,
    Stipendio decimal(10,2),
    super_SSN char(9),
    Numero_Dipartimento integer not null,
    primary key (SSN)
);

create table Sedi_Dipartimento (
    Numero_Dipartimento integer not null,
    Sede_Dipartimento varchar(15) not null,
    primary key (Numero_Dipartimento, Sede_Dipartimento),
    foreign key (Numero_Dipartimento) references Dipartimento (Numero_Dipartimento)
    on delete set null on update cascade
);

create table Progetto (
    Nome_Progetto varchar(15) not null,
    Numero_Progetto integer not null,
    Sede_Progetto varchar(15),
    Numero_Dipartimento integer not null,
    primary key (Numero_Progetto),
    unique (Nome_Progetto),
    foreign key (Numero_Dipartimento) references Dipartimento (Numero_Dipartimento)
    on delete set null on update cascade
);

create table Lavora_su (
    SSN_I char(9) not null,
    N_Progetto integer not null,
    Ore decimal(3,1) not null,
    primary key (SSN_I, N_Progetto),
    foreign key (N_Progetto) references Progetto (Numero_Progetto)
    on delete set null on update cascade,
    foreign key (SSN_I) references Impiegato (SSN)
    on delete set null on update cascade
);

alter table Dipartimento
add constraint fk_dir_ssn foreign key (SSN_Dir) references Impiegato(SSN)
on delete set null on update cascade initially deferred;

alter table Impiegato
add constraint fk_Imp_ssn foreign key (super_SSN) references Impiegato (SSN)
on delete set null on update cascade initially deferred;

alter table Impiegato
add constraint fk_Imp_Num_Dip foreign key (Numero_Dipartimento) references  Dipartimento (Numero_Dipartimento)
on delete set null on update cascade initially deferred;


