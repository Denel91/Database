DROP SCHEMA IF EXISTS movies CASCADE;
CREATE SCHEMA movies;
SET search_path TO movies;

-- Definizione delle tabelle e dei vincoli intrarelazionali
-- Film
create table movie (
    movie_id integer primary key,
    title varchar(50) not null,
    year integer,
    director varchar(50)
);

comment on column movie.year is 'Talvolta l''anno non è noto';
comment on column movie.director is 'Talvolta il regista non è noto';

-- Recensore
create table reviewer (
    reviewer_id integer primary key,
    name varchar(50) not null
);

-- Valutazione
create table rating (
    reviewer_id integer not null,
    movie_id integer not null,
    stars integer not null,
    rating_date date not null,
    constraint pk_rating primary key (reviewer_id, movie_id, rating_date)
);

-- Aggiungo i vincoli interrelazionali
alter table rating
add constraint fk_rating_reviewer foreign key (reviewer_id)
references reviewer (reviewer_id)
on delete cascade on update restrict;

alter table rating
add constraint fk_rating_movie foreign key (movie_id)
references movie (movie_id)
on delete cascade on update restrict;