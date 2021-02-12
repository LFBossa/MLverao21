include("csvm_me.jl")
include("classificadorcsvm_me.jl")
function onevsallcsmv(C,X,y)
m,n = size(X)
y1 = zeros(m)
y2 = zeros(m)
y3 = zeros(m)
#vamos agora criar as classes

for i = 1: m
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

w1,b1= csvm(X,y1,C)
w2,b2= csvm(X,y2,C)
w3,b3= csvm(X,y3,C)

c = zeros(m)
for i = 1: m
   c[i] = classificadorcsvm(C,w1,b1,w2,b2,w3,b3,X[i,:])
end

return w1,b1,w2,b2,w3,b3,c

end
