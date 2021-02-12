using LinearAlgebra
include("funm_me.jl")
function funlog(θ, X, y)
m,n= size(X)
p = length(θ)
r = length(y)

f = 0
    for i = 1 : m
        f-=  y[i]*log(mx(θ,X[i,:])) + (1-y[i])*log(1-mx(θ,X[i,:]))
    end

return f

end
