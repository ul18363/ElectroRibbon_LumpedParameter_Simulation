parpool(6)
%%
nmel_exps=[1:8];
a=zeros(size(nmel_exps));
b=a;c=a;
for nmel_exp=nmel_exps
    nmel_exp
mat=rand(2,10^nmel_exp);
norm_mat=mat*0;
mat_1=mat(1,:);
mat_2=mat(2,:);
%c=zeros(1000,6*24);
tic
parfor i=1:length(mat), norm_mat(:,i) = mat(:,i)/sqrt(mat_1(i)^2+mat_2(i)^2); end
a(nmel_exp)=toc;

%c=zeros(1000,6*24);
norm_mat=mat*0;
tic
% for i=1:6*24
%      norm_mat(:,i) = eig(rand(1000));
% end
norm_mat=normc(mat); % Most efficient for 
b(nmel_exp)=toc;

my_normc = @(m)bsxfun(@rdivide,m,sqrt(sum(m.^2)));
tic
norm_mat=my_normc(mat); % Most efficient for big matrices
c(nmel_exp)=toc;
end
%%
semilogy(nmel_exps,a)
hold on
semilogy(nmel_exps,b)
semilogy(nmel_exps,c)
legend({'Parallel','normc','bsxfun'})
