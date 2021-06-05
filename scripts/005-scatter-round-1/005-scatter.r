data <- read.csv(file = 'data-round-1-converted/data.csv')

png("r-results/01-scatter-duda-vs/duda-biedron.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_biedron_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_biedron_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-bosak.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_bosak_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_bosak_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-duda.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_duda_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_duda_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-holownia.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_holownia_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_holownia_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-jakubiak.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_jakubiak_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_jakubiak_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-kosiniak.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_kosiniak_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_kosiniak_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-piotrowski.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_piotrowski_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_piotrowski_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-tanajno.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_tanajno_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_tanajno_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-trzaskowski.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_trzaskowski_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_trzaskowski_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-witkowski.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_witkowski_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_witkowski_proc), col = "#CC0000")

png("r-results/01-scatter-duda-vs/duda-zoltek.png", width = 640, height = 480)
smoothScatter(data$wynik_duda_proc, data$wynik_zoltek_proc, bandwidth = 1, ylim = c(0, 100), xlim = c(0, 100), cex = 0.1)
abline(lm(data$wynik_duda_proc ~ data$wynik_zoltek_proc), col = "#CC0000")