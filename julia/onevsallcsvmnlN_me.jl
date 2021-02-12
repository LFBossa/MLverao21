include("csvm_nl_me.jl")
include("classificadorcsvmnl_me.jl")
function onevsallcsmvnlN(C,X,y,N,Xt)
m,n = size(X)
y1 = zeros(N)
y2 = zeros(N)
y3 = zeros(N)
#vamos agora criar as classes
X = X[1:N,:]
for i = 1: N
    if y[i] == 1.
        y1[i] = 1.
    else
        y1[i] = -1
    end
    if y[i] == 0.
        y2[i] = 1.
    else
        y2[i] = -1
    end

    if y[i] == -1.
        y3[i] = 1.
    else
        y3[i] = -1
    end
end

w1,b1= csvm_nl(X,y1,C)
w2,b2= csvm_nl(X,y2,C)
w3,b3= csvm_nl(X,y3,C)


m1,n1 = size(Xt)
c= zeros(m1)
for i = 1: m1
   c[i] = classificadorcsvmnl(C,w1,b1,w2,b2,w3,b3,Xt[i,:])
end

return c

end
