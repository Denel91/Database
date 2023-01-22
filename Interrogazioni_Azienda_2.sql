-- Si trovino i nomi di tutti gli impiegati che non hanno supervisori.
select nome, cognome
from impiegato
where super_ssn is null;

-- Seleziona i numeri di progetto di cui 'Smith' è dirigente, mentre la seconda seleziona i numeri dei progetti a cui lavora
-- un dipendente di cognome 'Smith'.
select numero_progetto
from progetto
where numero_progetto in (select numero_progetto from progetto,dipartimento,impiegato
where progetto.numero_dipartimento = dipartimento.numero_dipartimento and ssn_dir = impiegato.ssn and  cognome = 'Smith')
or
numero_progetto in (select n_progetto from lavora_su, impiegato where ssn_i = impiegato.ssn and cognome = 'Smith');

-- Restituire i nomi dei dipendenti il cui stipendio è superiore a quello di tutti i dipendenti del dipartimento 5.
select nome, cognome
from impiegato
where stipendio > all (select stipendio from impiegato where numero_dipartimento = 5);

-- Si recuperi il nome di ogni dipendente che lavora su tutti i progetti controllati dal dipartimento numero 5.
select nome, cognome
from impiegato
where not exists((select numero_progetto from progetto where progetto.numero_dipartimento = 5) except (select n_progetto from lavora_su where ssn_i = azienda.impiegato.ssn));

-- Si trovino i numeri del servizio sanitario di tutti i dipendenti che lavorano sui progetti numero 1, 2 o 3.
select distinct ssn_i
from lavora_su
where n_progetto in (1, 2, 3);

-- Trovare il cognome di ciascun impiegato e del suo supervisore.
select I.nome as Nome_Impiegato, S.nome as Nome_Supervisore
from impiegato as I, impiegato as S
where I.super_ssn = S.ssn;

-- Si calcoli la somma degli stipendi di tutti gli impiegati, lo stipendio massimo, quello minimo e quello medio.
select sum(stipendio), max(stipendio), min(stipendio), avg(stipendio)
from impiegato;

-- Si calcoli la somma degli stipendi di tutti gli impiegati del dipartimento 'Ricerca', e anche lo stipendio massimo, quello minimo e quello medio di questo dipartimento.
select sum(stipendio), max(stipendio), min(stipendio), avg(stipendio)
from impiegato I join dipartimento D on D.numero_dipartimento = I.numero_dipartimento
where nome_dipartimento = 'Ricerca';

-- Si trovi il numero totale degli impiegati della società.
select count(*)
from impiegato;

-- Si trovi il numero dei dipendenti del dipartimento 'Ricerca'.
select count(*)
from impiegato I join dipartimento D on D.numero_dipartimento = I.numero_dipartimento
where nome_dipartimento = 'Ricerca';

-- Si calcoli il numero dei valori distinti degli stipendi presenti nella base di dati.
select count(distinct stipendio)
from impiegato;