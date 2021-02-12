using CSV, DataFrames

df_C2013 = DataFrame(CSV.File("datasets/C2013.csv"))
df_C2014 = DataFrame(CSV.File("datasets/C2014.csv"))
df_C2015 = DataFrame(CSV.File("datasets/C2015.csv"))
df_C2016 = DataFrame(CSV.File("datasets/C2016.csv"))
df_C2017 = DataFrame(CSV.File("datasets/C2017.csv"))
df_C2018 = DataFrame(CSV.File("datasets/C2018.csv"))
df_C2019 = DataFrame(CSV.File("datasets/C2019.csv"))


C2013_Matrix = convert(Matrix, df_C2013)
C2014_Matrix = convert(Matrix, df_C2014)
C2015_Matrix = convert(Matrix, df_C2015)
C2016_Matrix = convert(Matrix, df_C2016)
C2017_Matrix = convert(Matrix, df_C2017)
C2018_Matrix = convert(Matrix, df_C2018)
C2019_Matrix = convert(Matrix, df_C2019)

C_Completo = [C2013_Matrix;C2014_Matrix;C2015_Matrix;C2016_Matrix;C2017_Matrix;C2018_Matrix;C2019_Matrix]

C_Completo[:,5]
Resultados = convert(Array{Float64,1}, C_Completo[:,5])
Matriz_dados = convert(Array{Float64,2}, [C_Completo[:,4] C_Completo[:,6:11]])
