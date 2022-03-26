# This file was generated, do not modify it. # hide
mu(a) = (a^(1e-10) - 1) / 1e-10
for i = 1:10
    println("mu($i) = $(mu(i))")
end