clear
n=1000;
A=sprandsym(n,0.01,.0001,1);
x=rand(n,1);
b=A*x;

[~,~,~,~,gres] = gmres(A,b,n,1e-6,n);
[~,~,~,~,mres] = minres(A,b,1e-6,n);
[~,~,~,~,cres] = pcg(A,b,1e-6,n);

semilogy(0:size(gres)-1,gres/gres(1), 0:size(mres)-1,mres/mres(1), 0:size(cres)-1,cres/cres(1))
xlabel('iteration')
ylabel('relative residual')
%legend('GMRES','MINRES','CG')
