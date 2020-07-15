library(tcltk)

df <- read.csv(file = 'data-round-1-converted/data.csv', header=TRUE, sep = ",")
X11()

png("r-results/04-histogram-comparison-round-1/04-histogram-comparison-round-1.png", width = 900, height = 900)
par(mfrow=c(3,4))
chart <- hist(df$wynik_duda_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "duda")
chart <- hist(df$wynik_trzaskowski_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "trzaskowski")
chart <- hist(df$wynik_holownia_proc, breaks = 1000, xlim = range(0, 30), ylim = range(0, 300), xlab = "result [%]", main = "holownia")
chart <- hist(df$wynik_bosak_proc, breaks = 1000, xlim = range(0, 15), ylim = range(0, 300), xlab = "result [%]", main = "bosak")
chart <- hist(df$wynik_kosiniak_proc, breaks = 10000, xlim = range(0, 8), ylim = range(0, 200), xlab = "result [%]", main = "kosiniak")
chart <- hist(df$wynik_biedron_proc, breaks = 10000, xlim = range(0, 8), ylim = range(0, 100), xlab = "result [%]", main = "biedron")
chart <- hist(df$wynik_zoltek_proc, breaks = 10000, xlim = range(0, 1), ylim = range(0, 150), xlab = "result [%]", main = "zoltek")
chart <- hist(df$wynik_jakubiak_proc, breaks = 20000, xlim = range(0, 1), ylim = range(0, 350), xlab = "result [%]", main = "jakubiak")
chart <- hist(df$wynik_tanajno_proc, breaks = 10000, xlim = range(0, 1), ylim = range(0, 150), xlab = "result [%]", main = "tanajno")
chart <- hist(df$wynik_piotrowski_proc, breaks = 10000, xlim = range(0, 1), ylim = range(0, 150), xlab = "result [%]", main = "piotrowski")

png("r-results/04-histogram-comparison-round-1/04-histogram-comparison-duda-trzaskowski-round-1.png", width = 480, height = 700)
par(mfrow=c(2,1))
chart <- hist(df$wynik_duda_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "duda")
chart <- hist(df$wynik_trzaskowski_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "trzaskowski")


png("r-results/04-histogram-comparison-round-1/04-histogram-comparison-zolte-jakubiak-tanajno-piotrowski-round-1.png", width = 480, height = 700)
par(mfrow=c(2,2))
chart <- hist(df$wynik_zoltek_proc, breaks = 2000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "zoltek")
chart <- hist(df$wynik_jakubiak_proc, breaks = 20000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "jakubiak")
chart <- hist(df$wynik_tanajno_proc, breaks = 2000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "tanajno")
chart <- hist(df$wynik_piotrowski_proc, breaks = 2000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "piotrowski")

# shapiro.test(sample(df$wynik_zoltek_proc, 500))
# shapiro.test(sample(df$wynik_jakubiak_proc, 500))
# shapiro.test(sample(df$wynik_tanajno_proc, 500))
# shapiro.test(sample(df$wynik_piotrowski_proc, 500))

#         Shapiro-Wilk normality test

# data:  sample(df$wynik_zoltek_proc, 500)
# W = 0.47642, p-value < 2.2e-16


#         Shapiro-Wilk normality test

# data:  sample(df$wynik_jakubiak_proc, 500)
# W = 0.28982, p-value < 2.2e-16


#         Shapiro-Wilk normality test

# data:  sample(df$wynik_tanajno_proc, 500)
# W = 0.68764, p-value < 2.2e-16


#         Shapiro-Wilk normality test

# data:  sample(df$wynik_piotrowski_proc, 500)
# W = 0.18801, p-value < 2.2e-16


prompt  <- "hit spacebar to close plots"
extra   <- "some extra comment"
capture <- tk_messageBox(message = prompt, detail = extra)
