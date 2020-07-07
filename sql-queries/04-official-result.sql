select (100.0 * sum(wynik_biedron)/wazne) as biedron,
    (100.0 * sum(wynik_bosak)/wazne) as bosak,
    (100.0 * sum(wynik_duda)/wazne) as duda,
    (100.0 * sum(wynik_holownia)/wazne) as holownia,
    (100.0 * sum(wynik_jakubiak)/wazne) as jakubiak,
    (100.0 * sum(wynik_kosiniak)/wazne) as kosiniak,
    (100.0 * sum(wynik_piotrowski)/wazne) as piotrowski,
    (100.0 * sum(wynik_tanajno)/wazne) as tanjano,
    (100.0 * sum(wynik_trzaskowski)/wazne) as trzaskowski,
    (100.0 * sum(wynik_witkowski)/wazne) as witkowski,
    (100.0 * sum(wynik_zoltek)/wazne) as zoltek
from runda1,
    (select sum(glosy_wazne) as wazne
    from runda1);