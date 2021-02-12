using LinearAlgebra
include("redeneural_me.jl")
function gradredeneural(K,θ,X,y)
m,n= size(X)
W = reshape(θ[1:n*K],n,K)
b = θ[n*K+1:n*K+K]
w1 = θ[n*K+K+1:n*K+K+K]
b1 = θ[n*K+2K+1]
g1(z) = 1/(1+exp(-z))
g2(z) = 1/(1+exp(-z))
dg1(z) = exp(-z)/(exp(-z)+1)^2 #derviadag1

gradrn = zeros(n*K+2K+1)
for p = 1 :m
     x = X[p, :]
     c = W'*x+b
     gradq = zeros(n*K+2K+1)
    for j = 1: K
        for i = 1: n
             gradq[i+(j-1)n] = w1[j]*dg1(c[j])*x[i]
         end
        gradq[n*K+j] =  w1[j]*dg1(c[j])
        gradq[n*K+K+j] = g1(c[j])
    end
         gradq[n*K+2K+1] = 1
         mod = redeneural(K, θ, x)
    gradr = zeros(n*K+2K+1)
    for i = 1 : n*K+2K+1
        gradr[i] = (mod - y[p])*gradq[i]
    end
    gradrn += gradr
end

return gradrn
end
