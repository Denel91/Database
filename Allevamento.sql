create schema Allevamento;
set search_path to Allevamento;

create table Allevatore (
    CF char(16) primary key,
    Nome varchar(20) not null,
    Cognome varchar(20) not null,
    Data_nascita date not null,
    Licenza char(5) not null unique
);

create table Bovino (
    Codice char(5) primary key,
    Data_nascita date not null,
    Vaccinato boolean not null,
    Razza varchar(30) not null,
    Allevatore char(16) references Allevatore(CF)
                    on delete set null on update cascade
);

create function check_allevatore() returns trigger as
$$
declare
    codice char(5);
BEGIN

    select allevatore into codice from bovino where allevatore = new.cf;
    if not found
    then
        delete from allevatore where cf = new.cf;
        return null;
    else
        return new;
    end if;
end;

$$ language plpgsql;

create function Controllo_allevatore() returns trigger as
$$
declare
    codice char(5);
BEGIN

    select allevatore into codice from bovino where allevatore = new.cf;
    if not found
    then
        raise exception 'Non puoi inserire un allevatore che non alleva almeno un bovino';
        return null;
    else
        return new;
    end if;
end;

$$ language plpgsql;

create trigger check_insert
    after insert
    on allevatore
    for each row
execute function check_allevatore();

create trigger Controllo_CF_allevatore
    before insert on allevatore
    for each row
    execute function Controllo_allevatore();