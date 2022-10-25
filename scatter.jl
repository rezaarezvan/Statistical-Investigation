using Plots
using Dates
using GLM
using DataFrames
using PlotThemes
using Statistics

theme(:dark)
x = [2018.0, 2019.09, 2019.71, 2020.12, 2020.44, 2021.77]
df = DataFrame(x = [2018.0, 2019.09, 2019.71, 2020.12, 2020.44, 2021.77])
y  = [0.0936, 1.5, 8.3, 17, 175, 530]

# Log_10(y)
df.y  = map(log10, y)
model = lm(@formula(y ~ x), df)  # Note how the formula looks exactly like the model you want to build
line  = predict(model, df)

# Scatter data points
scatter(x, y, label="Data points", legend = :topleft)

# Linear regression line
plotd = plot!(df.x, line, label = "Linear regression", legend = false)

# For residuals lines
#for i in 1:length(df.x)
#    plot!([df.x[i], df.x[i]], [df.y[i], line[i]], color = "red")
#end
res = df.y - line
res = map(abs, res)
res = mean(res)

#savefig(plotd, "scatterplot_test.png")