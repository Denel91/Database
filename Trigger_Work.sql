create or replace function limita() returns trigger as
$$
BEGIN
    if tg_op = 'UPDATE' then
        if new.stipendio > old.stipendio * 1.2 then
            update impiegato set stipendio = old.stipendio * 1.2
            where matricola = new.matricola;
        end if;
        return old;
    end if;
end;
$$
language plpgsql;

create trigger Limita_Aumenti
    after update of stipendio on impiegato
    for each row
    when (new.stipendio > old.stipendio * 1.2)
    execute function limita();

create function controlla_stip() returns trigger
    language plpgsql
as
$$
    BEGIN
        if tg_op = 'UPDATE' then
            update impiegato set stipendio = 0.9 * stipendio
            where (select avg(stipendio) from impiegato) > 55;
            return null;
        end if;
    end;
$$;

create trigger Controlla_Stipendi
    after update of stipendio on impiegato
    execute function Controlla_Stip();

create function update_ordini() returns trigger as
$$
    declare
        x integer;
BEGIN
        select count(*) into  x from ordinipendenti
        where parte = new.parte;

        if (x = 0) then
            insert into ordinipendenti (parte, qtariord, date) values (new.parte, new.qtariord, current_date);
            return new;
        end if;
end;
$$ language plpgsql;

create or replace trigger Riordino
    after update of qtadisp on magazzino
    for each row
    when (new.qtadisp < new.qtasoglia)
execute function update_ordini();


