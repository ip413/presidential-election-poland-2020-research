# Data and analysis about presidential election in Poland, 2020
* Aim of this repo is to give easier insight into presidential election in Poland, 2020.
* You have to be familiar with sql or/and gnuplot to play around with data, or you can use examples from repo.
* Please share, change, fork, comment, contribute... the more eyes, the more fairer elections.


## Dependencies
Older versions could work also... or not.
* gnuplot 5.2
* sqlite 3.22


## USAGE
Just play around with csv, ods or sqlite3 files. No GUI, sorry.

Gnuplot example

```
gnuplot -p gnuplot/example_invalid_votes_vs_result.plot
```


## Data
Data source:
```
https://pkw.gov.pl/aktualnosci/informacje/protokol-pkw-o-wynikach-glosowania-w-wyborach-prezydenta-rzeczypospolitej-polskiej-przeprowadzonego-

https://wybory.gov.pl/prezydent20200628/data/1/csv/wyniki_gl_na_kand_po_obwodach_xlsx.zip
```

Database ```db/data.sqlite3``` contains single table with all necessary data. The data should the exactly the same as data from ```data-round-1-converted/data.csv``` file. 

The only differences between the files are official data are:
* 7 rows were removed due to malformed spreadsheet formulas,
* columns with percentage results and invalid votes (suffix "proc") were added.

## FAQ

* Why English language in repo? 
The more people looking at this, the better.

* Why should we trust you? You shouldn't! Trust no one!

* Why analysis are so poor and not scientific? I'm not data scientist, I do what I can. I hope people better than me will use it.

* Why not python, not oktawave, not cloud service, not API, not web app, not D3.js? There are some ideas, but there is als so little time. Just do it! 

## License
Attribution-ShareAlike 4.0 International - CC BY-SA 4.0

Please see LICENSE.md file