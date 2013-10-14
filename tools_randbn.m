function x = tools_randbn(n,std)
    istd = 1/std;
    x = norminv(rand(1,n) * (normcdf(istd) - normcdf(-istd)) + normcdf(-istd)) * std;
end
