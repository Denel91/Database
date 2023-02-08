select distinct P.nome_prodotto, città
from prodotti P, negozi, listino
where prezzo <= all (select prezzo
                     from prodotti P2, listino
                     where P.nome_prodotto = P2.nome_prodotto);

select distinct nome, città
from negozi, prodotti, listino
where id_negozio = listino.negozio
and prodotto = prodotti.cod_prodotto
and marca = 'Apple';

select distinct P1.nome_prodotto
from prodotti P1
where nome_prodotto not in (select P1.nome_prodotto
                            from negozi N1, negozi N2, prodotti P2,
                                 listino L1, listino L2
                            where N1.id_negozio = L1.negozio
                            and N2.id_negozio = L2.negozio);

