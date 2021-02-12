include("csvm_nl_me.jl")

function classificadorcsvmnl(C,w1,b1,w2,b2,w3,b3,y)
    r1 = dot(w1,polinomialkernel(y)) + b1
    r2 = dot(w2,polinomialkernel(y)) + b2
    r3 = dot(w3,polinomialkernel(y)) + b3
    c = argmax([r1,r2,r3])
    return c
end
