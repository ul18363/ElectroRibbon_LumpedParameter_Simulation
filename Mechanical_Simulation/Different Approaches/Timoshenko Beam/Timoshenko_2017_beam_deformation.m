%% Timoshenko Beam Deformation
% updated: May 23, 2017
clc; clear all; close all;
% Some default commands for standardized graphics
set(0,'DefaultAxesFontSize',24,'DefaultTextFontSize',24,...
'DefaultAxesFontName','Helvetica',...
'DefaultTextFontName','Helvetica',...
'DefaultAxesFontWeight','bold','DefaultTextFontWeight','bold',...
'DefaultLineLineWidth',3,'DefaultLineMarkerSize',12,...
'DefaultFigureColor','w','DefaultAxesColorOrder',...
[0 0 1;0 .5 0;1 0 0;0 .75 .75;.75 0 .75;.75 .75 0;.25 .25 .25],...
'DefaultFigurePosition',[5 100 [900 420]*.9],'DefaultFigureResize',...
'off')
% User Inputs Below
Nel = 50; % Number of elements
L = 10; % Beam length
h = 1; % beam height
rhoA = 1; % Beam density (per length)
EI = 1 ; % Beam flexural rigidity
R = 174.3; % R = rhoI/rhoA
S = .03728; % S = kAG/EI
% Begin FE setup -- element length, phi parameter, and local matrices
% built from shape functions
% nw0w0 is integral 0^Lel [N w]^T [N w] dx
% nt1w1 is integral 0^Lel [N phi']^T [N w'] dx
% etc.
Lel = L/Nel;
phi = 12/S/Lel^2;

nw0w0 = 1/840/(1+phi)^2*Lel*...
[4*(78+147*phi+70*phi^2) Lel*(44+77*phi+35*phi^2) ...
4*(27+63*phi+35*phi^2) -Lel*(26+63*phi+35*phi^2);
Lel*(44+77*phi+35*phi^2) Lel^2*(8+14*phi+7*phi^2) ...
Lel*(26+63*phi+35*phi^2) -Lel^2*(6+14*phi+7*phi^2);
4*(27+63*phi+35*phi^2) Lel*(26+63*phi+35*phi^2) ...
4*(78+147*phi+70*phi^2) -Lel*(44+77*phi+35*phi^2);
-Lel*(26+63*phi+35*phi^2) -Lel^2*(6+14*phi+7*phi^2) ...
-Lel*(44+77*phi+35*phi^2) Lel^2*(8+14*phi+7*phi^2)];

nw1w1 = 1/60/(1+phi)^2/Lel*...
[12*(6+10*phi+5*phi^2) 6*Lel ...
-12*(6+10*phi+5*phi^2) 6*Lel;
6*Lel Lel^2*(8+10*phi+5*phi^2) ...
-6*Lel -Lel^2*(2+10*phi+5*phi^2);
-12*(6+10*phi+5*phi^2) -6*Lel ...
12*(6+10*phi+5*phi^2) -6*Lel;
6*Lel -Lel^2*(2+10*phi+5*phi^2) ...
-6*Lel Lel^2*(8+10*phi+5*phi^2)];

nt0t0 = 1/30/(1+phi)^2/Lel*...
[36 -3*Lel*(-1+5*phi) ...
-36 -3*Lel*(-1+5*phi);
-3*Lel*(-1+5*phi) Lel^2*(4+5*phi+10*phi^2) ...
3*Lel*(-1+5*phi) Lel^2*(-1-5*phi+5*phi^2);
-36 3*Lel*(-1+5*phi) ...
36 3*Lel*(-1+5*phi);
-3*Lel*(-1+5*phi) Lel^2*(-1-5*phi+5*phi^2) ...
3*Lel*(-1+5*phi) Lel^2*(4+5*phi+10*phi^2)];

nt1t1 = 1/(1+phi)^2/Lel^3*...
[12 6*Lel -12 6*Lel ;
6*Lel Lel^2*(4+2*phi+phi^2) -6*Lel -Lel^2*(-2+2*phi+phi^2);
-12 -6*Lel 12 -6*Lel ;
6*Lel -Lel^2*(-2+2*phi+phi^2) -6*Lel Lel^2*(4+2*phi+phi^2) ];

nw0t1 = 1/60/(1+phi)^2/Lel*...
[-72-60*phi -6*Lel*(11+15*phi+5*phi^2) ...
72+60*phi 6*Lel*(-1+5*phi+5*phi^2);
-6*Lel -Lel^2*(8+10*phi+5*phi^2) ...
6*Lel Lel^2*(2+10*phi+5*phi^2);
72+60*phi -6*Lel*(-1+5*phi+5*phi^2) ...
-72-60*phi 6*Lel*(11+15*phi+5*phi^2);
-6*Lel Lel^2*(2+10*phi+5*phi^2) ...
6*Lel -Lel^2*(8+10*phi+5*phi^2)];

nt1w0 = nw0t1';

nw1t0 = 1/60/(1+phi)^2/Lel*...
[72+60*phi -6*Lel*(-1+5*phi+5*phi^2) ...
-72-60*phi -6*Lel*(-1+5*phi+5*phi^2);
6*Lel Lel^2*(8+10*phi+5*phi^2) ...
-6*Lel -Lel^2*(2+10*phi+5*phi^2);
-72-60*phi 6*Lel*(-1+5*phi+5*phi^2) ...
72+60*phi 6*Lel*(-1+5*phi+5*phi^2);
6*Lel -Lel^2*(2+10*phi+5*phi^2) ...
-6*Lel Lel^2*(8+10*phi+5*phi^2)];

nt0w1 = 1/60/(1+phi)^2/Lel*...
[72+60*phi 6*Lel ...
-72-60*phi 6*Lel;
-6*Lel*(-1+5*phi+5*phi^2) Lel^2*(8+10*phi+5*phi^2) ...
6*Lel*(-1+5*phi+5*phi^2) -Lel^2*(2+10*phi+5*phi^2);
-72-60*phi -6*Lel ...
72+60*phi -6*Lel;
-6*Lel*(-1+5*phi+5*phi^2) -Lel^2*(2+10*phi+5*phi^2) ...
6*Lel*(-1+5*phi+5*phi^2) Lel^2*(8+10*phi+5*phi^2)];
% Initialize mass, stiffenss, & damping matrices; calculate in terms of
% shape function matrices above

mmat = zeros(4,4); kmat = mmat;
mmat = nw0w0 + R*nt0t0;
kmat = nt1t1 + S*nw1w1 + S*nt0t0 -S*nw1t0 - S*nt0w1;
% Initialize & construct global mass, stiffness, and damping matrices
K = zeros(2*Nel+2); C = K; M = K;
for n=1:Nel
i1 = 2*n-1; i2 = 2*n+2;
K(i1:i2,i1:i2) = K(i1:i2,i1:i2) + EI*kmat;
M(i1:i2,i1:i2) = M(i1:i2,i1:i2) + rhoA*mmat;
end
% Apply boundary conditions (un-comment the one of interest and comment
% out the rest)
% Pinned-Pinned
K(1,:) = []; K(:,1) = []; K(end-1,:) = []; K(:,end-1) = [];
M(1,:) = []; M(:,1) = []; M(end-1,:) = []; M(:,end-1) = [];
% % Clamped-Clamped
% K(1:2,:) = []; K(:,1:2) = []; K(end-1:end,:) = []; K(:,end-1:end) = [];
% M(1:2,:) = []; M(:,1:2) = []; M(end-1:end,:) = []; M(:,end-1:end) = [];
% % Clamped-Free
% K(1:2,:) = []; K(:,1:2) = [];
% M(1:2,:) = []; M(:,1:2) = [];
% % Clamped-Pinned
% K(1:2,:) = []; K(:,1:2) = []; K(end-1,:) = []; K(:,end-1) = [];
% M(1:2,:) = []; M(:,1:2) = []; M(end-1,:) = []; M(:,end-1) = [];
% Solve eigenvalue problem in first-order form; sort modes and compute
% natural frequencies and damping ratios
Nc = size(K,1);
[v,d] = eig(K,M); % solve eigenvalue problem
[omgr,ind] = sort(sqrt(diag(d))); % find omega n and sort modes
for r =1:Nc % sorted & normalized using mass
Phic(:,r) = v(:,ind(r))/sqrt(v(:,ind(r))'*M*v(:,ind(r)));
% constrained e'vecs, column-wise
end
%Restore zeros
% Pinned-Pinned
Phi = [zeros(1,Nc); Phic(1:end-1,:); zeros(1,Nc); Phic(end,:)];
% Clamped-Clamped
% Phi = [zeros(2,Nc); Phic; zeros(2,Nc)];
% Clamped-Free
% Phi = [zeros(2,Nc); Phic];
% Clamped-Pinned
% Phi = [zeros(2,Nc); Phic(1:end-1,:); zeros(1,Nc); Phic(end,:)];
% plotting deformed beam
mode = [1:25];

Nw_p = [-(phi*Lel^2 + 6*Lel*0 - 6*0^2)/(Lel^3*(phi + 1)), ...
(Lel*((phi/2 + 1)/Lel + (3*0^2)/Lel^3 - ...
(2*0*(phi/2 + 2))/Lel^2))/(phi + 1),...
(phi*Lel^2 + 6*Lel*0 - 6*0^2)/(Lel^3*(phi + 1)), ...
-(4*Lel*0 + Lel^2*phi - 6*0^2 - ...
2*Lel*phi*0)/(2*Lel^2*(phi + 1))];
Nphi = [(6/(Lel*(1+phi)))*((0/Lel)^2 - (0/Lel)), ...
(1/(1+phi))*(3*(0/Lel)^2-(4 + phi)*(0/Lel)+(1+phi)),...
-(6/(Lel*(1+phi)))*((0/Lel)^2-(0/Lel)),...
(1/(1+phi))*(3*(0/Lel)^2-(2-phi)*(0/Lel))];
xnode = linspace(0,L,Nel+1); % array of x at the nodes, or x original
%Shape function derivatives to solve for w'
for j = 1:length(xnode)-1
w_p(j,:) = Nw_p*Phi((2*j-1):(2*j-1)+3,:);
rot(j,:) = Nphi*Phi((2*j-1):(2*j-1)+3,:);
end
w_p(length(xnode),:) = [-(phi*Lel^2 + 6*Lel*Lel - ...
6*Lel^2)/(Lel^3*(phi + 1)), ...
(Lel*((phi/2 + 1)/Lel + (3*Lel^2)/Lel^3 - ...
(2*Lel*(phi/2 + 2))/Lel^2))/(phi + 1),...
(phi*Lel^2 + 6*Lel*Lel - 6*Lel^2)/(Lel^3*(phi + 1)), ...
-(4*Lel*Lel + Lel^2*phi - 6*Lel^2 - ...
2*Lel*phi*Lel)/(2*Lel^2*(phi + 1))]*Phi((end-3:end),:);
rot(length(xnode),:) = [(6/(Lel*(1+phi)))*((Lel/Lel)^2 - (Lel/Lel)), ...
(1/(1+phi))*(3*(Lel/Lel)^2-(4 + phi)*(Lel/Lel)+(1+phi)),...
-(6/(Lel*(1+phi)))*((Lel/Lel)^2-(Lel/Lel)),...
(1/(1+phi))*(3*(Lel/Lel)^2-(2-phi)*(Lel/Lel))]*Phi((end-3:end),:);
beta = w_p - rot;
N_colorstep = 50;
%color_scale = redbluemap(N_colorstep);
color_scale = redblue(N_colorstep);
figure
for count = 1:length(mode)
for i = 1:count
beta = beta(:,mode); %to use for max beta in modes in mode vector
beta_scale(i) = max(abs(beta(:)))*1.000001;
%scaled by max beta at all modes
for n = 1:length(xnode)
colorbin(n,i) = round((N_colorstep/2/beta_scale(i))*...
(beta(n,i)) +(N_colorstep/2+.5));
end
end
for i = 1:length(count)
zdef = Phi(1:2:end,count(i))-h/2*(1-cos(Phi(1:2:end,count(i))));
xdef = h/2*sin(Phi(2:2:end,count(i)));
%plot deformed
%figure(count); hold on;
drawnow
hold off
plot(xnode - xdef', h/2 + zdef, '-ok', ...
xnode + xdef', -h/2 + zdef,'-ok')
hold on
%plot vertical lines
for j = 1:length(xnode)
hold on; axis equal;
x = [xnode(j) - xdef(j)',xnode(j) + xdef(j)'];
y = [h/2 + zdef(j),-h/2 + zdef(j)];
plot(x,y,'color',color_scale(colorbin(j,count),:));
%plot centerline
if j < length(xnode)
x = [xnode(j), xnode(j+1)];
y = [zdef(j),zdef(j+1)] ;
plot(x,y,'k--');
%drawnow
else
end
end
end
axis([0-.2 L+.2 -1-.7 1+.7]);
xlabel('Length'); ylabel('Height')
set(gca,'FontSize',30);
set(gca,'LooseInset',get(gca,'TightInset'))
end