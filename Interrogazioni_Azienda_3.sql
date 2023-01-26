-- Ottenere i nomi dei dipartimenti dislocati in piú sedi.
select distinct nome_dipartimento
from dipartimento as D, sedi_dipartimento as S1, sedi_dipartimento as S2
where D.numero_dipartimento = S1.numero_dipartimento and D.numero_dipartimento = S2.numero_dipartimento and S1.sede_dipartimento <> S2.sede_dipartimento;

-- Ottenere il numero di supervisori.
select distinct count(super_ssn)
from impiegato;

-- Produrre in output l’elenco dei nomi di tutti dipartimenti con il corrispondente numero di sedi, ordinato in modo crescente rispetto al numero di sedi.
select nome_dipartimento, count(sede_dipartimento) as num_sedi
from sedi_dipartimento sd right join dipartimento d on sd.numero_dipartimento = d.numero_dipartimento
group by D.numero_dipartimento
order by num_sedi asc;

-- Ottenere i dati degli impiegati che non sono supervisori.
select * from impiegato
where ssn not in (select super_ssn from impiegato where super_ssn is not null);

-- Ottenere i dati degli impiegati che non sono supervisori.
select * from impiegato I
where not exists(select * from impiegato S where S.super_ssn = I.ssn);

-- Ottenere i nomi degli impiegati che lavorano almeno 20 ore in ciascuno dei progetti in cui sono impiegati.
select I.nome, I.cognome
from impiegato I -- nome e cognome di ciascun impiegato
where not exists(
    select * from lavora_su as L
             where L.ssn_i = I.ssn and L.ore < 20 or L.ore is null)
and exists(
    select * from lavora_su L
             where L.ssn_i = I.ssn);

-- Ottenere i nomi dei manager che guadagnano piú di ogni impiegato che lavora al progetto 3.
select ssn, nome, cognome, stipendio from impiegato
where ssn in (select ssn_dir from dipartimento)
and stipendio > all (select stipendio
                     from impiegato join lavora_su on impiegato.ssn = lavora_su.ssn_i
                            where n_progetto = 3);

create view Lavora as select nome, cognome, nome_progetto, ore
from impiegato, progetto, lavora_su
where ssn = lavora_su.ssn_i and lavora_su.n_progetto = progetto.numero_progetto;

create view Info_Dipartimento(Nome_Dipartimento, Numero_Impiegati, Stipendio_Totale)
    as select nome_dipartimento, count(*), sum(stipendio)
       from dipartimento, impiegato
where dipartimento.numero_dipartimento = impiegato.numero_dipartimento
group by nome_dipartimento;