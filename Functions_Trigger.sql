create or replace function valida_Libro()
returns trigger as
$$
    declare
        dummy dom_cod_prodotto;
    begin
        -- controllo se in DVD esiste una tupla con codice uguale a quello che voglio inserire/modificare in Libro
        select id into dummy from dvd where id = new.id;
        if found
            then
            raise exception 'Specializzazione non esclusica';
            return null;
        else
            return new;
        end if;
    end;
$$ language plpgsql;

create or replace function valida_dvd()
returns trigger as
$$
  begin
    perform * from libro where id = new.id;
    if found
    then
      raise exception 'Specializzazione non esclusiva';
      return null;
    else
      return new;
    end if;
  end;
$$ language plpgsql;

create or replace function valida_prodotto()
returns trigger
language plpgsql as
$$
  begin
    select id from libro where id = new.id
    union
    select id from dvd where id = new.id;
    if found then
      raise notice 'Un prodotto con id % esiste già.', new.id;
      return null;
    end if;

    return new;
  end;
$$;
