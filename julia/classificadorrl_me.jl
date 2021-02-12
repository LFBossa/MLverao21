include("funm_me.jl")
function classificadorrl(θ1,θ2,θ3,y)
    r1 = mx(θ1,y)
    r2 = mx(θ2,y)
    r3 = mx(θ3,y)
    c = argmax([r1,r2,r3])
    return c
end
