include("onevsallcsvmnlN_me.jl")
include("testeCSV.jl")
include("onevsallcsvm_me.jl")
include("onevsallrl_me.jl")
include("onevsallrn_me.jl")
include("acerto_me.jl")
X = Matriz_dados
y = Resultados

#Conjunto de treino
C_Treino = 2650

#conjunto de teste
C_Teste = 10


Xt=X[C_Treino + 1:(C_Treino + C_Teste),:]
Xtr =[fill(1.,C_Teste) Xt[1:C_Teste,:]]
yt=y[C_Treino + 1:(C_Treino + C_Teste)]

X = X[1:C_Treino,:]
Xr = [fill(1.,C_Treino) X[1:C_Treino,:]]
y = y[1:C_Treino]

c= zeros(C_Teste)
for i = 1 : C_Teste
    if y[i] == 1.0
       c[i] = 1.0
    elseif y[i] == 0.0
        c[i] = 2.0
    else
        c[i] = 3.0
    end
end
# LETRA A

ctotal = onevsallrl(C_Treino,Xr,y,Xtr)

ac = acertos(c,ctotal)

@show eficiencia = (ac/length(c))*100