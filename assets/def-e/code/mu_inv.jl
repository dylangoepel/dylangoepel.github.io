# This file was generated, do not modify it. # hide
function mu_inv(y)
    x = 1
    for i = 1:10
        x = x * (1 - mu(x) + y)
    end
    x
end

@show mu_inv(0)
@show mu_inv(1)
@show mu_inv(2)