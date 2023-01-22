create schema university;
set search_path to university;

create domain dom_corso as varchar;
create domain dom_docente as varchar;
create domain dom_materia as text;
create domain dom_grado as integer;
create domain dom_dottorando as varchar;
create domain dom_nome as varchar;
create domain dom_cognome as varchar;
create domain dom_area as varchar;

create table corsi (
    cod_corso dom_corso primary key,
    cod_docente dom_docente not null,
    materia dom_materia not null,
    grado_specializzazione dom_grado not null
);

create table dottorandi (
    cod_dottorando dom_dottorando primary key,
    nome dom_nome not null,
    cognome dom_cognome not null,
    area_interesse dom_area not null
);

create table frequenta (
    cod_dottorando dom_dottorando not null,
    cod_corso dom_corso not null,
    constraint pk_frequenta primary key (cod_dottorando, cod_corso)
);

alter table frequenta
add constraint fk_frequenta_dott foreign key (cod_dottorando) references dottorandi(cod_dottorando)
on delete cascade on update restrict;

alter table frequenta
add constraint fk_frequenta_corso foreign key (cod_corso) references corsi(cod_corso)
on delete cascade on update restrict;