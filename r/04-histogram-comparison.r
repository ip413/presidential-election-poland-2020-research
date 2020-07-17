library(tcltk)

df <- read.csv(file = 'data-round-1-converted/data.csv', header=TRUE, sep = ",")
df2 <- read.csv(file = 'data-round-2-converted/data.csv', header=TRUE, sep = ",")
X11()

#---------------------------------------- all

# png("r-results/04-histogram-comparison/04-histogram-comparison-round-1.png", width = 900, height = 1200)
# par(mfrow=c(4,3))
# chart <- hist(df$wynik_duda_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "duda")
# chart <- hist(df$wynik_trzaskowski_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "trzaskowski")
# chart <- hist(df$wynik_holownia_proc, breaks = 1000, xlim = range(0, 30), ylim = range(0, 300), xlab = "result [%]", main = "holownia")
# chart <- hist(df$wynik_bosak_proc, breaks = 1000, xlim = range(0, 15), ylim = range(0, 300), xlab = "result [%]", main = "bosak")
# chart <- hist(df$wynik_kosiniak_proc, breaks = 10000, xlim = range(0, 8), ylim = range(0, 200), xlab = "result [%]", main = "kosiniak")
# chart <- hist(df$wynik_biedron_proc, breaks = 10000, xlim = range(0, 8), ylim = range(0, 100), xlab = "result [%]", main = "biedron")
# chart <- hist(df$wynik_zoltek_proc, breaks = 10000, xlim = range(0, 1), ylim = range(0, 150), xlab = "result [%]", main = "zoltek")
# chart <- hist(df$wynik_jakubiak_proc, breaks = 80000, xlim = range(0, 1), ylim = range(0, 90), xlab = "result [%]", main = "jakubiak")
# chart <- hist(df$wynik_tanajno_proc, breaks = 10000, xlim = range(0, 1), ylim = range(0, 150), xlab = "result [%]", main = "tanajno")
# chart <- hist(df$wynik_piotrowski_proc, breaks = 10000, xlim = range(0, 1), ylim = range(0, 150), xlab = "result [%]", main = "piotrowski")

#---------------------------------------- last 4

# png("r-results/04-histogram-comparison/04-histogram-comparison-zolte-jakubiak-tanajno-piotrowski-round-1.png", width = 480, height = 700)
# par(mfrow=c(2,2))
# chart <- hist(df$wynik_zoltek_proc, breaks = 2000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "zoltek")
# chart <- hist(df$wynik_jakubiak_proc, breaks = 20000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "jakubiak")
# chart <- hist(df$wynik_tanajno_proc, breaks = 2000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "tanajno")
# chart <- hist(df$wynik_piotrowski_proc, breaks = 2000, xlim = range(0, 20), ylim = range(0, 10), xlab = "result [%]", main = "piotrowski")

#---------------------------------------- round 1, duda trzask comparison

# png("r-results/04-histogram-comparison/04-histogram-comparison-duda-trzaskowski-round-1.png", width = 480, height = 700)
# par(mfrow=c(2,1))
# chart <- hist(df$wynik_duda_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "duda - round 1")
# chart <- hist(df$wynik_trzaskowski_proc, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "trzaskowski - round 1")


#---------------------------------------- round 2, duda trzask comparison

# png("r-results/04-histogram-comparison/04-histogram-comparison-duda-trzaskowski-round-2.png", width = 480, height = 700)
# par(mfrow=c(2,1))
# chart <- hist(df2$result_duda, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "duda - round 2")
# chart <- hist(df2$result_trzaskowski, breaks = 1000, xlim = range(0, 100), ylim = range(0, 100), xlab = "result [%]", main = "trzaskowski - round 2")

#---------------------------------------- round 1, 2 trzask

# png("r-results/04-histogram-comparison/04-histogram-comparison-trzaskowski-curve-round-1.png", width = 600, height = 480)
# x <- df$wynik_trzaskowski_proc
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.031), main = "trzaskowski - round 1", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.031), col="red")

# png("r-results/04-histogram-comparison/04-histogram-comparison-trzaskowski-curve-round-2.png", width = 600, height = 480)
# x <- df2$result_trzaskowski
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.031), main = "trzaskowski - round 2", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.031), col="red")

#---------------------------------------- round 1, 2 duda

# png("r-results/04-histogram-comparison/04-histogram-comparison-duda-curve-round-1.png", width = 600, height = 480)
# x <- df$wynik_duda_proc
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.031), main = "duda - round 1", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.031), col="red")

# png("r-results/04-histogram-comparison/04-histogram-comparison-duda-curve-round-2.png", width = 600, height = 480)
# x <- df2$result_duda
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.031), main = "duda - round 2", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.031), col="red")

#---------------------------------------- round 2 rural

# df2rural <- df2[df2[, "typ_obszaru"]=="wieś", ]

# png("r-results/04-histogram-comparison/04-histogram-comparison-duda-rural-curve-round-2.png", width = 600, height = 480)
# x <- df2rural$result_duda
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.031), main = "duda, rural areas - round 2", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.031), col="red")

# png("r-results/04-histogram-comparison/04-histogram-comparison-trzaskowski-rural-curve-round-2.png", width = 600, height = 480)
# x <- df2rural$result_trzaskowski
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.031), main = "trzaskowski, rural areas - round 2", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.031), col="red")


#---------------------------------------- round 2 urban

# df2urban <- df2[df2[, "typ_obszaru"]=="miasto", ]

# png("r-results/04-histogram-comparison/04-histogram-comparison-duda-urban-curve-round-2.png", width = 600, height = 480)
# x <- df2urban$result_duda
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.041), main = "duda, urban areas - round 2", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.041), col="red")

# png("r-results/04-histogram-comparison/04-histogram-comparison-trzaskowski-urban-curve-round-2.png", width = 600, height = 480)
# x <- df2urban$result_trzaskowski
# hist(x, breaks = 200, xlab = "result [%]", ylim = range(0, 0.041), main = "trzaskowski, urban areas - round 2", freq=F)
# s = sd(x)
# m = mean(x)
# lines(seq(100), dnorm(seq(100), mean(x), sd(x)), ylim = range(0, 0.041), col="red")

#---------------------------------------- round 2 normal distribution

# Function change values below min and above max to min and max
limit_vector_values <- function(v, min, max) {
    index<-0
    for(i in v) {
        index<-index+1;
        # print(i)
        if(i < min) {
            v[[index]] = min
        }

        if(i > max) {
            v[[index]] = max
        }
    }
    return(v)
}
set.seed(15-09-2020)
df2rnormDuda = rnorm(27000, mean=mean(df2$result_duda), sd=sd(df2$result_duda))
df2rnormTrzaskowski = rnorm(27000, mean=mean(df2$result_trzaskowski), sd=sd(df2$result_trzaskowski))

png("r-results/04-histogram-comparison/04-histogram-comparison-duda-normal-dist-model.png", width = 600, height = 480)
df2rnormDudaLimited <- limit_vector_values(df2rnormDuda, 0, 100)
hist(df2rnormDudaLimited, breaks=100, main="duda, round 2, normal distribution model", freq=F)
lines(seq(100), dnorm(seq(100), mean(df2rnormDudaLimited), sd(df2rnormDudaLimited)), ylim = range(0, 0.031), col="red")

png("r-results/04-histogram-comparison/04-histogram-comparison-trzaskowski-normal-dist-model.png", width = 600, height = 480)
df2rnormTrzaskowskiLimited <- limit_vector_values(df2rnormTrzaskowski, 0, 100)
hist(df2rnormTrzaskowskiLimited, breaks=100, main="trzaskowski, round 2, normal distribution model", freq=F)
lines(seq(100), dnorm(seq(100), mean(df2rnormTrzaskowskiLimited), sd(df2rnormTrzaskowskiLimited)), ylim = range(0, 0.031), col="red")




prompt  <- "hit spacebar to close plots"
extra   <- "some extra comment"
capture <- tk_messageBox(message = prompt, detail = extra)
