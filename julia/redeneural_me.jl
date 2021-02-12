using LinearAlgebra
function redeneural(K, θ, x)
    #theta deve ser um vetor com n*K+2*K+1 componentes
n = length(x)
W = reshape(θ[1:n*K],n,K)
b = θ[n*K+1:n*K+K]
w1 = θ[n*K+K+1:n*K+K+K]
b1 = θ[n*K+2K+1]
c = W'*x+b
g1(z) = 1/(1+exp(-z))
g2(z) = 1/(1+exp(-z))

g=zeros(K)
    for j=1:K
        g[j] = g1(c[j])
    end
    mod = g2(dot(w1,g)+b1)
return mod
end
