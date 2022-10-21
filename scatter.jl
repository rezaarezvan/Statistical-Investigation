using Plots
using Dates
using GLM
using DataFrames

df = DataFrame(x = [2018.0, 2019.09, 2019.71, 2020.12, 2020.44, 2021.77])
y  = [0.0936, 1.5, 8.3, 17, 175, 530]

df.y = map(log10, y)

scatter(df.x, df.y, label="Data points")
model = lm(@formula(y ~ x), df)  # Note how the formula looks exactly like the model you want to build
plot!(df.x, predict(model, df), label="Linear regression")
#savefig(plotd,"scatter_regression.png")