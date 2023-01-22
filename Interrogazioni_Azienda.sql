-- Si trovino la data di nascita e l'indirizzo del dipendente (o dei dipendenti) il cui nome è 'John Smith'.
select nome, data_nascita
from impiegato
where nome = 'John' and cognome = 'Smith';

-- Si trovino il nome e l'indirizzo di tutti i dipendenti che lavorano per il dipartimento 'Ricerca'
select nome, indirizzo
from impiegato, dipartimento
where nome_dipartimento = 'Ricerca' and impiegato.numero_dipartimento = dipartimento.numero_dipartimento;

-- Per ogni progetto con sede a 'Stafford' si elenchi il numero del progetto, il numero del progetto, il numero del dipartimento
-- che lo controlla, nonchè il cognome, l'indirizzo e la data di nascita del direttore del dipartimento.

select numero_progetto, dipartimento.numero_dipartimento, cognome, indirizzo, data_nascita
from progetto, dipartimento, impiegato
where progetto.numero_dipartimento = dipartimento.numero_dipartimento and ssn_dir = impiegato.ssn and sede_progetto = 'Stafford';

-- Si trovino il nome, il cognome e l'indirizzo di tutti i dipendenti che lavorano per il dipartimento 'Ricerca'
select nome, cognome, indirizzo
from impiegato, dipartimento
where nome_dipartimento = 'Ricerca' and dipartimento.numero_dipartimento = impiegato.numero_dipartimento;

-- Per ciascun dipendente si trovino il suo nome e cognome e il nome e il cognome del suo immediato supervisore.
select I.nome, I.cognome, S.nome, S.cognome
from impiegato as I, impiegato as S
where I.super_ssn = S.ssn;

-- Si trovi il valore di stipendio di ogni dipendente e poi tutti i valori distinti di stipendio
select  all stipendio
from impiegato;

select distinct stipendio
from impiegato;

-- Si crei un elenco di tutti i numeri di progetto che coinvolgono un dipendente il cui cognome è 'Smith', come
-- partecipante oppure come dirigente del dipartimento che controlla il progetto.
(select distinct numero_progetto
from progetto, dipartimento, impiegato
where progetto.numero_dipartimento = dipartimento.numero_dipartimento and ssn_dir = ssn and cognome = 'Smith')
union
(select distinct numero_progetto
from progetto, lavora_su, impiegato
where numero_progetto = lavora_su.n_progetto and ssn_i = impiegato.ssn and cognome = 'Smith');

-- Si trovino tutti i dipendenti del dipartimento 5 il cui stipendio è compreso tra 30.000 e 40.000.
select nome
from impiegato
where (stipendio between 30000 and 40000) and impiegato.numero_dipartimento = 5;

-- Si determini un elenco di dipendenti e i progetti su cui lavorano ordinati per dipartimento, e all'interno di ciascun dipartimento li si ordini alfabeticamente per cognome e nome.
select D.nome_dipartimento, I.cognome, I.nome, P.nome_progetto
from dipartimento D, impiegato I, lavora_su L, progetto P
where D.numero_dipartimento = I.numero_dipartimento and I.ssn = L.ssn_i and L.n_progetto = P.numero_progetto
order by D.numero_dipartimento, I.cognome, I.nome;

