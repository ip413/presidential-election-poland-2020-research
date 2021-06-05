
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




mean(df2$result_duda)    # 56.63608
sd(df2$result_duda)      # 17.88868

mean(df2$result_trzaskowski)    # 43.35657
sd(df2$result_trzaskowski)      # 17.88595