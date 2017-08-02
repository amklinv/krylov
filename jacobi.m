clear
n = 1000;
randmat = sprand(1000,1000,.005);
A=randmat+10*speye(1000);
n = size(A,1);
b = rand(n,1);
x = zeros(n,1);

D = spdiags(diag(A),0,n,n);
R = A - D;

iter = 1;
r = b-A*x;
rnorm(iter) = norm(r);
while(rnorm(iter)/rnorm(1) > 1e-6 && iter < 100)
    x=D\(b-R*x);
    r = b-A*x;
    iter = iter + 1;
    rnorm(iter) = norm(r);
    
    fprintf('Error at iteration %i: %f\n', iter-1, rnorm(iter))
end

A=randmat+5*speye(1000);
x = zeros(n,1);

D = spdiags(diag(A),0,n,n);
R = A - D;

iter = 1;
r = b-A*x;
rnorm2(iter) = norm(r);
while(rnorm2(iter)/rnorm2(1) > 1e-6 && iter < 100)
    x=D\(b-R*x);
    r = b-A*x;
    iter = iter + 1;
    rnorm2(iter) = norm(r);
    
    fprintf('Error at iteration %i: %f\n', iter-1, rnorm2(iter))
end

A=randmat+2.5*speye(1000);
x = zeros(n,1);

D = spdiags(diag(A),0,n,n);
R = A - D;

iter = 1;
r = b-A*x;
rnorm3(iter) = norm(r);
while(rnorm3(iter)/rnorm3(1) > 1e-6 && iter < 100)
    x=D\(b-R*x);
    r = b-A*x;
    iter = iter + 1;
    rnorm3(iter) = norm(r);
    
    fprintf('Error at iteration %i: %f\n', iter-1, rnorm3(iter))
end

semilogy(0:size(rnorm,2)-1,rnorm/rnorm(1), 0:size(rnorm2,2)-1,rnorm2/rnorm2(1), 0:size(rnorm3,2)-1,rnorm3/rnorm3(1))
xlabel('iteration')
ylabel('relative residual')
legend('big diag', 'medium diag', 'little diag')
