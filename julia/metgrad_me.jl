using LinearAlgebra
function  metgradiente(θ,X,y)
include("gradlog_me.jl")
k = 1
L = norm(X)^2
α = 1/L
kmax = 10000
g = gradlog(θ,X,y)
ng = norm(g)
ϵ = 1e-16

    while k < kmax && ng >= ϵ
        g= gradlog(θ,X,y)
        ng = norm(g)
        θ = θ - α*g
        k = k+1
    end
    return θ
end
