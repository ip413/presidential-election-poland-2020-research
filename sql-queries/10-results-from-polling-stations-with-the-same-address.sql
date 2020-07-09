select symbol_kontrolny, typ_obszaru, numer_obwodu, siedziba, wyborcy_uprawnieni, glosy_niewazne + karty_niewazne as niewazne, wynik_duda_proc, wynik_trzaskowski_proc, wynik_holownia_proc, wynik_bosak_proc, wynik_kosiniak_proc 
from runda1 where siedziba in (SELECT siedziba FROM runda1 GROUP BY siedziba HAVING COUNT(siedziba)>1) 
order by siedziba;