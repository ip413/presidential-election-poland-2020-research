select symbol_kontrolny, koperty_wrzucone_do_urny, karty_z_kopert, (karty_z_kopert - koperty_wrzucone_do_urny) as roznica_glosy_z_kopert, siedziba
from runda1
where koperty_wrzucone_do_urny <> karty_z_kopert
order by (koperty_wrzucone_do_urny - karty_z_kopert) desc;