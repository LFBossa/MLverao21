using LinearAlgebra
include("redeneural_me.jl")

function funcaorn(K,θ, X,y)
m,n = size(X)
W = reshape(θ[1:n*K],n,K)
b = θ[n*K+1:n*K+K]
w1 = θ[n*K+K+1:n*K+K+K]
b1 = θ[n*K+2K+1]

f = 0
for p = 1 : m
    x = X[p,:]
    rn = redeneural(K, θ, x)
     f -= y[p]*log(rn) +(1-y[p])*log(1-rn)
end
return f
end
