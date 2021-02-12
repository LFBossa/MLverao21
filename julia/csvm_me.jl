using LinearAlgebra, JuMP, Ipopt

function csvm(X, y, C)
(m,n) = size(X)

model = Model(optimizer_with_attributes(Ipopt.Optimizer))

@variable(model, w[1:n])
@variable(model, b)
@variable(model, ξ[1:m] ≥ 0)

@objective(model, Min, dot(w, w)/2 + C * sum(ξ))

@constraint(model, [i=1:m], (dot(w, X[i,:]) + b) * y[i] ≥ 1 - ξ[i])

print(model)
optimize!(model)

w, b, ξ = value.(w), value.(b), value.(ξ)

return w,b

end
