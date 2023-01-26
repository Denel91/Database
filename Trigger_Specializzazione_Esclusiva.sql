create trigger exclusive_book
    before insert or update on libro
    for each row
    execute procedure valida_libro();

create trigger exclusive_dvd
    before insert or update on dvd
    for each row
    execute procedure valida_dvd();

create trigger controllo_inserimento_libro
    before insert on libro
    for each row
    execute procedure valida_prodotto();

create trigger controllo_aggiornamento_libro
    before update on libro
    for each row
    when (new.id <> old.id)
    execute procedure valida_prodotto();

create trigger controllo_inserimento_dvd
    before insert on dvd
    for each row
    execute procedure valida_prodotto();

create trigger controllo_aggiornamento_dvd
    before update on dvd
    for each row
    when (new.id <> old.id)
    execute procedure valida_prodotto();
