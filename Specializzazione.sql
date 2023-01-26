create or replace function valida_PDF()
returns trigger as
$$
  declare
    dummy dom_codice;
  begin
	-- controllo se in Video esiste una tupla con codice uguale a quello che voglio inserire/modificare in PDF
    select codice into dummy from Video where codice = new.codice;
    if found
    then
      raise exception 'Specializzazione non esclusiva';
      return null;
    else
      return new;
    end if;
  end;
$$ language plpgsql;

create trigger PDF_esclusivo before insert or update
  on PDF for each row execute procedure valida_PDF();

create or replace function valida_Video()
returns trigger as
$$
  begin
  -- 'perform' è equivalente a 'select', ma permette di ignorare il risultato
  -- (si può usare solo  all'interno di funzioni).
  -- "A PERFORM statement sets FOUND true if it produces (and discards) one or more rows, false if no row is produced." (§40.5.5)
    perform * from PDF where codice = new.codice;
    if found
    then
      raise exception 'Specializzazione non esclusiva';
      return null;
    else
      return new;
    end if;
  end;
$$ language plpgsql;

create trigger Video_esclusivo before insert or update
  on Video for each row execute procedure valida_Video();