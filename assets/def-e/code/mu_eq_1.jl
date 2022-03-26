# This file was generated, do not modify it. # hide
a = 2
b = 3
ma = mu(a)
mb = mu(b)

for i = 1:100
    v = (a + b) / 2
    mv = mu(v)

    if mv > 1
        global b, mb = v, mv
    elseif mv < 1
        global a, ma = v, mv
    end
end

e = (a + b) / 2
@show e