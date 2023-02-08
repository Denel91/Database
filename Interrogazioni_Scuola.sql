-- Trovare studenti che non hanno superato esami
select *
from studenti
where matricola not in (select distinct studente from esami where voto >= 18);

-- Trovare gli studenti che hanno riportato in almeno un esame un voto più alto di Longo Filippo
select *
from studenti S join esami E on S.matricola = E.studente
where voto > any (select voto from esami E2 join studenti S2 on E2.studente = S2.matricola
                              where S2.nome = 'Filippo' and S2.cognome = 'Longo');

-- Trovare i nomi degli studenti che hanno superato almeno due esami
select distinct nome, cognome
from studenti S, esami E1 join esami E2 on E1.studente = E2.studente
where E1.codice_corso > E2.codice_corso and E1.voto >= 18 and E2.voto >= 18 and S.matricola = E1.studente;

-- Trovare per ogni studente il numero di esami superati e la relativa media
select nome, cognome, count(*) as Esami_Superati, avg(voto) as Media_Esami
from studenti S, esami E
where S.matricola = E.studente
group by nome, cognome;