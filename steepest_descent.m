clear
n = 1000;
b = rand(n,1);

e1 = 1:1000;
A = sprandsym(n,.01,e1);
x = zeros(n,1);

r = b-A*x;
normr(1) = norm(r);
iter = 1;

while normr(iter)/normr(1) > 1e-6 && iter < 1000
    alpha = r'*r/(r'*A*r);
    x = x + alpha*r;
    r = b-A*x;
    iter = iter + 1;
    normr(iter) = norm(r);
end

e2 = 1:.1:100.9;
A = sprandsym(n,.01,e2);
x = zeros(n,1);

r = b-A*x;
normr2(1) = norm(r);
iter = 1;

while normr2(iter)/normr2(1) > 1e-6 && iter < 1000
    alpha = r'*r/(r'*A*r);
    x = x + alpha*r;
    r = b-A*x;
    iter = iter + 1;
    normr2(iter) = norm(r);
end

e3 = 1:.01:10.99;
size(e3)
A = sprandsym(n,.01,e3);
x = zeros(n,1);

r = b-A*x;
normr3(1) = norm(r);
iter = 1;

while normr3(iter)/normr3(1) > 1e-6 && iter < 1000
    alpha = r'*r/(r'*A*r);
    x = x + alpha*r;
    r = b-A*x;
    iter = iter + 1;
    normr3(iter) = norm(r);
end

semilogy(0:size(normr,2)-1,normr/normr(1),0:size(normr2,2)-1,normr2/normr2(1),0:size(normr3,2)-1,normr3/normr3(1))
xlabel('iterations')
ylabel('relative residual')