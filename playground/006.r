library(tcltk)
library(corrplot)
# library(RColorBrewer)
library(ggpubr)
library(ggplot2)

# df <- read.csv(file = 'data-round-2-official/wyniki_gl_na_kand_po_obwodach_proc_utf8.csv', header=TRUE, sep = ",")
df <- read.csv(file = 'data-round-1-converted/data.csv', header=TRUE, sep = ",")

# head(wyniki_gl_na_kand_po_obwodach_proc_utf8)

# df2 <- wyniki_gl_na_kand_po_obwodach_proc_utf8[c(12:18)]

head(df)

# df2 <- df[c(12:18)]
df2 <- df[c(0:60)]
#df2small = subset(df2)



head(df2)
nrow(df2)

# correlation  <- cor(df2)



# corrplot(  df2 , type="upper", order="hclust", col=brewer.pal(n=8, name="RdYlBu"))

X11()

# ggscatter(df2$result_duda, y = rnorm(n = 1, mean = 5, sd = 4), 
#           add = "reg.line", conf.int = TRUE, 
#           cor.coef = TRUE, cor.method = "pearson",
#           xlab = "Result Duda", ylab = "Invalid votes", add.params = list(color = "red"))

# ggscatter(df2, x = "result_duda", y = "votes_invalid", 
#           add = "reg.line", conf.int = TRUE, 
#           cor.coef = TRUE, cor.method = "pearson",
#           xlab = "Duda Result - second round[pp]", ylab = "Invalid votes [pp]", add.params = list(color = "red"))

# ggscatter(df2, x = "result_trzaskowski", y = "votes_invalid", 
#           add = "reg.line", conf.int = TRUE, 
#           cor.coef = TRUE, cor.method = "pearson",
#           xlab = "Trzaskowski Result - second round [pp]", ylab = "Invalid votes [pp]", add.params = list(color = "red"))


par(mfrow=c(3,3))
p1 <- hist(df2$wynik_duda_proc, breaks = 1000, xlim = range(0, 100))
p2 <- hist(df2$wynik_trzaskowski_proc, breaks = "FD", xlim = range(0, 60))
p2 <- hist(df2$wynik_holownia_proc, breaks = "FD", xlim = range(0, 30))
p2 <- hist(df2$wynik_bosak_proc, breaks = "FD", xlim = range(0, 15))
p1 <- hist(df2$wynik_kosiniak_proc, breaks = 1000, xlim = range(0, 15))
p2 <- hist(df2$wynik_biedron_proc, breaks = "FD", xlim = range(0, 15))
p2 <- hist(df2$wynik_jakubiak_proc, breaks = "FD", xlim = range(0, 2))


# shapiro.test(sample(df2$wynik_duda_proc, 500))
# shapiro.test(sample(df2$wynik_trzaskowski_proc, 500))
# shapiro.test(sample(df2$wynik_holownia_proc, 500))
# shapiro.test(sample(df2$wynik_bosak_proc, 500))
# shapiro.test(sample(df2$wynik_kosiniak_proc, 500))
# shapiro.test(sample(df2$wynik_biedron_proc, 500))
# shapiro.test(sample(df2$wynik_jakubiak_proc, 500))
# shapiro.test(sample(df2$wynik_zoltek_proc, 500))


prompt  <- "hit spacebar to close plots"
extra   <- "some extra comment"
capture <- tk_messageBox(message = prompt, detail = extra)


# g = d$mydata
# m<-mean(g)
# std<-sqrt(var(g))
# hist(g, density=20, breaks=20, prob=TRUE, 
#      xlab="x-variable", ylim=c(0, 2), 
#      main="normal curve over histogram")
# curve(dnorm(x, mean=m, sd=std), 
#       col="darkblue", lwd=2, add=TRUE, yaxt="n")
