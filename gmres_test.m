clear
n=1000;
A=sprandsym(n,0.01,1e-2);
x=rand(n,1);
b=A*x;

[~,~,~,~,gres] = gmres(A,b,n,1e-6,n);
[~,~,~,~,gres50] = gmres(A,b,50,1e-6,20);
[~,~,~,~,gres100] = gmres(A,b,100,1e-6,10);
[~,~,~,~,gres200] = gmres(A,b,200,1e-6,5);

semilogy(0:size(gres)-1,gres/gres(1), 0:size(gres50)-1,gres50/gres50(1), 0:size(gres100)-1,gres100/gres100(1), 0:size(gres200)-1,gres200/gres200(1))
xlabel('iteration')
ylabel('relative residual')
