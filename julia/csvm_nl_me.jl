using LinearAlgebra, JuMP, Ipopt

function polinomialkernel(x)
    n = length(x)

    φ = Vector{Float64}(undef,0)
    append!(φ,(x[n:-1:1]).^2.)

    for i = n : -1 : 2
        for j = i - 1 : - 1 : 1
            push!(φ,sqrt(2)*x[i]*x[j])
        end
    end
    append!(φ, sqrt(2).*x[n:-1:1])
    push!(φ,1.)
    return φ
end

function csvm_nl(X::Matrix, y::Vector, C::Float64)
(m,n) = size(X)
N = div((n+2)*(n+1),2)
φ(x) = polinomialkernel(x)

model = Model(optimizer_with_attributes(Ipopt.Optimizer))

@variable(model, w[1:N])
@variable(model, b)
@variable(model, ξ[1:m] ≥ 0)

@objective(model, Min, dot(w, w)/2 + C * sum(ξ))

@constraint(model, [i=1:m], (dot(w, φ(X[i,:])) + b) * y[i] ≥ 1 - ξ[i])

print(model)
optimize!(model)

w, b, ξ = value.(w), value.(b), value.(ξ)

return w,b

end
