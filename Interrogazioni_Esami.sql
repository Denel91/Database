-- gli studenti che hanno registrato solo esami relativi ad insegnamenti del biennio iniziale del corso di laurea;
select distinct nome_studente, cognome_studente
from studenti S join esami E on S.matricola = E.studente join insegnamenti I on I.cod_insegnamento = E.insegnamento
where cod_insegnamento in (select cod_insegnamento
                           from insegnamenti
                           where anno_corso = 2 or anno_corso = 1);
-- l'insegnamento (gli insegnamenti) col maggior numero di esami registrati;
select nome_insegnamento
from esamiregistrati E join insegnamenti I on E.insegnamento = I.cod_insegnamento
where numeroesami = (select max(numeroesami) from esamiregistrati);