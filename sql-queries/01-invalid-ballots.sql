select symbol_kontrolny, karty_niewazne, siedziba
from runda1
where karty_niewazne > 3
order by karty_niewazne desc;