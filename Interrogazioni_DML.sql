-- Selezionare per ogni studente matricola e numero di esami superati
select matricola, count(*) as Esami_Superati
from esamisuperati
group by matricola;

-- Selezionare matricola studente, codice corso e numero di volte
-- che lo studente ha sostenuto l'esame del corso per tutti gli studenti e i relativi corsi.
select matricola, cod_corso, count(*) as Esami_Sostenuti
from iscritti_esami
group by matricola, cod_corso;

-- Selezionare la matricola degli studenti che hanno almeno un
-- corso per cui hanno sostenuto almeno 5 volte l'esame
select distinct matricola
from iscritti_esami
group by matricola, cod_corso
having count(*) >= 5;

-- Selezionare la matricola degli studenti
-- che hanno preso il voto più alto all’esame identificato dal codice corso 45
select matricola
from esamisuperati
where cod_corso = 45 and voto = (select max(voto)
                                 from esamisuperati
                                 where cod_corso = 45);

--
select nome_corso, max(voto)
from esamisuperati E join corsi C on E.cod_corso = C.cod_corso
where C.cod_corso = 45
group by nome_corso;

-- Selezionare la matricola degli studenti che hanno
-- superato il maggior numero d’esami
create view Numero_Esami_Superati (Matricola, Num_esami_superati) as
    select matricola, count(cod_corso)
from esamisuperati
group by matricola;

select matricola
from numero_esami_superati
where num_esami_superati = (select max(num_esami_superati) from numero_esami_superati);

-- Selezionare matricola, nome e cognome dei docenti che hanno uno
-- stipendio maggiore rispetto allo stipendio medio dei propri colleghi
-- di dipartimento (docenti dello stesso dipartimento)
create view StipendioMedioPerDipartimento (Dipartimento, StipendioMedio)
as select dipartimento, avg(stipendio)
from docenti
group by dipartimento;

select matricola_doc, nome_doc, cognome_doc
from docenti D, stipendiomedioperdipartimento S
where D.dipartimento = S.dipartimento and D.stipendio > S.stipendiomedio;

-- Selezionare la matricola degli studenti che hanno superato l’esame di tutti i corsi possibili
-- (tutti i corsi presenti nella tabella CORSI).
-- Si supponga l'esistenza di almeno un corso (esiste almeno una tupla nell'istanza della tabella CORSI)
select matricola
from esamisuperati
group by matricola
having count(*) = (select count(*) from corsi);

--Selezionare la matricola degli studenti che hanno superato l’esame di Relazioni pubbliche
-- con 30 o quello di Economia aziendale con 26.
select matricola
from esamisuperati E, corsi C
where E.cod_corso = C.cod_corso and C.nome_corso = 'Relazioni pubbliche' and E.voto = 30
union
select matricola
from esamisuperati E, corsi C
where E.cod_corso = C.cod_corso and C.nome_corso = 'Economia aziendale' and E.voto = 26;

-- Selezionare la matricola degli studenti che hanno superato l’esame di Ingegneria gestionale con 30 e quello di Informatica con 25.
select matricola
from esamisuperati E, Corsi C
where E.cod_corso = C.cod_corso and C.nome_corso = 'Ingegneria gestionale' and E.voto = 30
intersect
select matricola
from esamisuperati E, Corsi C
where E.cod_corso = C.cod_corso and C.nome_corso = 'Informatica' and E.voto = 25;

-- Selezionare la matricola degli studenti che non hanno mai preso 30
select matricola
from studenti
except
select matricola
from esamisuperati E
where E.voto = 30;