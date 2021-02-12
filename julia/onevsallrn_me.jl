include("metgradrn_me.jl")
include("classificadorrn_me.jl")
function onevsallrn(K,X,y)
m,n = size(X)
y1 = zeros(m)
y2 = zeros(m)
y3 = zeros(m)
#vamos agora criar as classes

for i = 1: m
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
θ=rand(n*K + 2K +1)
k1, f1, θ1 = metgradrn(K,θ,X,y1)
k2, f2, θ2 = metgradrn(K,θ,X,y2)
k3, f3, θ3 = metgradrn(K,θ,X,y3)

c = zeros(m)
for i = 1: m
    c[i] = classificadorrn(K,θ1,θ2,θ3,X[i,:])
end

return θ,θ1,θ2,θ3,c
end
