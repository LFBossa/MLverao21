include("redeneural_me.jl")

function classificadorrn(K,θ1,θ2,θ3,y)
    r1 = redeneural(K,θ1,y)
    r2 = redeneural(K,θ2,y)
    r3 = redeneural(K,θ3,y)
    c = argmax([r1,r2,r3])
    return c
end
