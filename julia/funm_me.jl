using LinearAlgebra
function mx(θ,x)
    m = 1/(1+ exp(-dot(θ,x)))
    return m
end
