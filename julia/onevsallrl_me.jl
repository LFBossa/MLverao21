include("metgrad_me.jl")
include("classificadorrl_me.jl")
function onevsallrl(N,X,y,Xt)
m,n = size(X)
y1 = zeros(N)
y2 = zeros(N)
y3 = zeros(N)

#vamos agora criar as classes
X = X[1:N,:]
for i = 1: N
    if y[i] == 1.
        y1[i] = 1.
    end
    if y[i] == 0.
        y2[i] = 1.
    end

    if y[i] == -1.
        y3[i] = 1.
    end
end

#yi criamos as classes dos jogos (classe 1, 2 ,3)
#X é os jogos
#xi minimizador da função
θ = zeros(n)
x1=  metgradiente(θ,X,y1)
x2 =  metgradiente(θ,X,y2)
x3=  metgradiente(θ,X,y3)


m1,n1 = size(Xt)
c= zeros(m1)
for i = 1: m1
   c[i] = classificadorrl(x1,x2,x3,Xt[i,:])
end


return c
end
