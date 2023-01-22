create view Docenti (Docente, Num_Corsi_Tenuti ) as
select cod_docente, count(cod_corso) from corsi
group by cod_docente;

select Docente
from Docenti
where Num_Corsi_Tenuti = (select min(Num_Corsi_Tenuti) from Docenti);