using LinearAlgebra
include("gradientern_me.jl")
include("funcaoredeneural_me.jl")

function metgradrn(K,θ,X,y)
    m,n = size(X)
    g = gradredeneural(K,θ,X,y)
    ng = norm(g)
    L = norm(X)^2
    α = 1/L
    k = 0
    ϵ = 0.0001
    kmax = 10000

    f = [funcaorn(K,θ, X,y)]
    while k< kmax && ng >= ϵ
        g = gradredeneural(K,θ,X,y)
        θ = θ - α*g
        ng = norm(g)
        push!(f,funcaorn(K,θ,X,y))
        k += 1
    end
    return k, f, θ
end
