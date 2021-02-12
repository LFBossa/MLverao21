using LinearAlgebra
include("funm_me.jl")
include("funlog_me.jl")
function gradlog(θ, X, y)
    mt= length(θ)
    n,p = size(X)
    m = zeros(n)

    for i = 1 : n
        m[i]= mx(θ,(X[i,:]))
    end

    gradf = X'*(m-y)


    return gradf
end
