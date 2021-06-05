library(corrplot)
library(tcltk)
# library("Hmisc")
# library(RColorBrewer)
# library("PerformanceAnalytics")
# library(ggplot2)
# install.packages("magrittr") # package installations are only needed the first time you use it
# install.packages("dplyr")

# library(dplyr)

data <- read.csv(file = 'data-round-1-converted/data.csv')
X11();




# png("r-results/02-correlation/02-correlation-1-invalid-vs-all.png", width = 900, height = 900)
# df1 = data[, c("glosy_niewazne", "wynik_biedron_proc", "wynik_bosak_proc", "wynik_duda_proc", "wynik_holownia_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc", "wynik_piotrowski_proc", "wynik_tanajno_proc", "wynik_trzaskowski_proc", "wynik_witkowski_proc", "wynik_zoltek_proc")]
# corrplot(cor(df1, use = "complete.obs"), type="upper", order="hclust", col=brewer.pal(n=8, name="RdYlBu"))


# png("r-results/02-correlation/02-correlation-2-invalid-many-x-vs-all.png", width = 900, height = 900)
# df1 = data[, c("glosy_niewazne_wiele_x", "wynik_biedron_proc", "wynik_bosak_proc", "wynik_duda_proc", "wynik_holownia_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc", "wynik_piotrowski_proc", "wynik_tanajno_proc", "wynik_trzaskowski_proc", "wynik_witkowski_proc", "wynik_zoltek_proc")]
# corrplot(cor(df1, use = "complete.obs"), type="upper", order="hclust", col=brewer.pal(n=8, name="RdYlBu"))





# df1 = data[, c("glosy_niewazne", "wynik_duda_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc")]
# chart.Correlation(df1, histogram=TRUE, pch=19)



# df1 = data[, c("glosy_niewazne", "wynik_biedron_proc", "wynik_bosak_proc", "wynik_duda_proc", "wynik_holownia_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc", "wynik_piotrowski_proc", "wynik_tanajno_proc", "wynik_trzaskowski_proc", "wynik_witkowski_proc", "wynik_zoltek_proc")]
# corrplot(M, method="pie")

#df1 = data[, c("glosy_niewazne", "wynik_biedron_proc", "wynik_bosak_proc", "wynik_duda_proc", "wynik_holownia_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc", "wynik_piotrowski_proc", "wynik_tanajno_proc", "wynik_trzaskowski_proc", "wynik_witkowski_proc", "wynik_zoltek_proc")]
# corrplot(cor(df1), method="number", col = c("darkred", "lightblue"), order="original", shade.method = c("all"),
#     lwd.shade = 1, col.shade = "red", 
#     corr.mtest = TRUE, p.mat = NULL, conf.level = 0.95)

# corrplot(cor(df1$glosy_niewazne, df1), order = "hclust", addrect = 2, col = whiteblack, bg = "gold2")
# head(cor(df1$glosy_niewazne, df1))


names.arg

# df1 = data[, c("glosy_niewazne", "wynik_biedron_proc", "wynik_bosak_proc", "wynik_duda_proc", "wynik_holownia_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc", "wynik_piotrowski_proc", "wynik_tanajno_proc", "wynik_trzaskowski_proc", "wynik_witkowski_proc", "wynik_zoltek_proc")]
# barplot(cor(df1$glosy_niewazne, df1)[1, 3:12], horiz=TRUE, cex.names=0.8, las = 2)

df1 = data[, c("glosy_niewazne_wiele_x", "wynik_biedron_proc", "wynik_bosak_proc", "wynik_duda_proc", "wynik_holownia_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc", "wynik_piotrowski_proc", "wynik_tanajno_proc", "wynik_trzaskowski_proc", "wynik_witkowski_proc", "wynik_zoltek_proc")]
# data[order(data[,1],decreasing=TRUE),]
df2 = cor(df1$glosy_niewazne_wiele_x, df1)[1, 3:12]
# df3 = order(df2, decreasing=TRUE)
print(df2)

# print(sort(df2, decreasing = FALSE))
# df2 <- data.frame(name=letters[1:5])
# print(df2[,order(df2[,2], decreasing = T)])
# barplot(sort(df2, decreasing = FALSE), horiz=FALSE, cex.names=0.8, las = 2)
# ggplot(df1,aes(x= reorder(cat,-num),num))+geom_bar(stat ="identity")


# x <- df1 %>% 
#   correlate() %>% 
#   focus(glosy_niewazne)

# barplot(x, horiz=TRUE, cex.names=0.8, las = 2)

# df1 %>% correlate() %>% focus(glosy_niewazne) %>%
#   ggplot(aes(x = rowname, y = glosy_niewazne)) +
#     geom_bar(stat = "identity")


# rs %>%
#   focus(mpg) %>%
#   mutate(rowname = reorder(rowname, mpg)) %>%
#   ggplot(aes(rowname, mpg)) +
#     geom_col() + coord_flip()

# col<- colorRampPalette(c("blue", "white", "red"))(20)
# heatmap(x = cor(df1), col = col, symm = TRUE)




# png("r-results/02-correlation/02-correlation-duda.png", width = 480, height = 700)
# df1 = data[, c("glosy_niewazne", "wynik_duda_proc", "wynik_jakubiak_proc", "wynik_kosiniak_proc")]
# corrplot(cor(df1, use = "complete.obs"), type="upper", order="hclust", col=brewer.pal(n=8, name="RdYlBu"))


# corrplot:corrplot(df1, type = "upper", order = "hclust", 
        #  tl.col = "black", tl.srt = 45)


# M <-cor(mtcars)
# corrplot(M, type="upper", order="hclust", col=brewer.pal(n=8, name="RdYlBu"))

prompt  <- "hit spacebar to close plots"
extra   <- "some extra comment"
capture <- tk_messageBox(message = prompt, detail = extra)
