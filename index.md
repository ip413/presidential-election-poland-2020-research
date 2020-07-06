## Candidate result as a function of unused ballot papers
Code used to generate charts:
```
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_biedron 
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_bosak
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_duda
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_holownia
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_jakubiak
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_kosiniak
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_piotrowski
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_tanajno
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_trzaskowski
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_witkowski
    node scripts_node/generate_chart.js --colY niewykorzystane_karty --colX wynik_zoltek
```
Results:

![](charts/niewykorzystane_karty/wynik_biedron_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_bosak_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_duda_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_holownia_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_jakubiak_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_kosiniak_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_piotrowski_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_tanajno_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_trzaskowski_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_witkowski_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_zoltek_as_function_niewykorzystane_karty.png)

---
Why Duda's and Kosiniak's chart is significantly different than Trzaskowski's and all other candidates? I don't know.

![](charts/niewykorzystane_karty/wynik_duda_as_function_niewykorzystane_karty.png)
![](charts/niewykorzystane_karty/wynik_trzaskowski_as_function_niewykorzystane_karty.png)


## Candidate result as a function of invalid votes

Code used to generate charts:
```
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_biedron_proc 
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_bosak_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_duda_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_holownia_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_jakubiak_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_kosiniak_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_piotrowski_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_tanajno_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_trzaskowski_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_witkowski_proc
node scripts_node/generate_chart.js --colY glosy_niewazne_proc --colX wynik_zoltek_proc
```

Results:


![](charts/glosy_niewazne/wynik_biedron_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_bosak_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_duda_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_holownia_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_jakubiak_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_kosiniak_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_piotrowski_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_tanajno_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_trzaskowski_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_witkowski_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_zoltek_proc_as_function_glosy_niewazne_proc.png)

---
Why Duda's chart is significantly different than Trzaskowski's and all other candidates? I don't know.
Is seems that when Duda had high result in some district electoral commission, it was somehow correlated with high ratio of invalid votes.

![](charts/glosy_niewazne/wynik_duda_proc_as_function_glosy_niewazne_proc.png)
![](charts/glosy_niewazne/wynik_trzaskowski_proc_as_function_glosy_niewazne_proc.png)
