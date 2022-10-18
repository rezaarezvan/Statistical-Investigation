using Plots
using Dates
using GLM
using DataFrames

function get_beta_coefficent(x::Vector{Date}, y::Vector{Float64})::Float64 
    Date
end

df = DataFrame(x = [2018.0, 2019.09, 2019.71, 2020.12, 2020.44, 2021.77])

y = [0.0936, 1.5, 8.3, 17, 175, 530]
df.y = map(log10, y)
scatter(df.x, df.y, label="Data points")
model = lm(@formula(y ~ x), df)  # Note how the formula looks exactly like the model you want to build
plot!(df.x, predict(model, df), label="Linear regression")

#=
# Years from data
x = [Date(2018), Date(2019, 2, 14), Date(2019, 9, 17), Date(2020, 2, 13), Date(2020, 6, 11), Date(2021, 10, 11)]

# Number of parameters in billions, from data
y = [0.0936, 1.5, 8.3, 17, 175, 530]

# Y_i = log10(X_i)
y_1 = map(log10, y)
x_t = map(Dates.DateTime, x)
x_1 = map(Dates.datetime2unix, x_t)
x_2 = [2018, 2019, 2019, 2020, 2020, 2021]

data = DataFrame(y = y_1, x = x)

ols = lm(@formula(y ~ x), data)


# Plot and save scatterplot
#gr()
scatter(x, y_1, label="data")
plot!(x, predict(ols, data), label="model")
#savefig(plotd,"scatterplot_3.png")
=#