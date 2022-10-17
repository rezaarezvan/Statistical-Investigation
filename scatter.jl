using Plots
using Dates
using GLM
using DataFrames

# Years from data
x_1 = [Date(2018), Date(2019, 2, 14), Date(2019, 9, 17), Date(2020, 2, 13), Date(2020, 6, 11), Date(2021, 10, 11)]
x = [2018, 2019, 2019, 2020, 2020, 2021]

# Number of parameters in billions, from data
y = [0.0936, 1.5, 8.3, 17, 175, 530]

# Y_i = log10(X_i)
y_1 = map(log10, y)

# data = DataFrame(x = [Date(2018), Date(2019, 2, 14), Date(2019, 9, 17), Date(2020, 2, 13), Date(2020, 6, 11), Date(2021, 10, 11)], 
#                  y_1 = map(log10, y))
#
# ols = lm(@formula(y_1 ~ x), data)
# print(ols)

b=(x'x)\(x'y_1)

ŷ=x*b

print(ŷ)

# Plot and save scatterplot
# gr()
# plotd = plot(x, y_1, seriestype = :scatter, title = "Scatter plot of Machine Learning models", xlabel = "X_i = Dates()", ylabel = "Y_i = log_10((X_i))")
# savefig(plotd,"scatterplot_3.png")
