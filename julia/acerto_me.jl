function acertos(x,y)
 m = length(x)
 a=0
 for i= 1: m
     if x[i] == y[i]
         a+=1
    end
end
return a
end
