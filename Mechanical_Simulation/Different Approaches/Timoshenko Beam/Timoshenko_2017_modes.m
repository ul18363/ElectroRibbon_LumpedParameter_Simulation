% TIMOSHENKO BEAM FINITE ELEMENT MODEL
% Written by Jeffrey L. Kauffman & Brandi McPherson
% Source https://stars.library.ucf.edu/cgi/viewcontent.cgi?article=6505&context=etd
clc; clear all; close all;
% Some default commands for standardized graphics
set(0,'DefaultAxesFontSize',24,'DefaultTextFontSize',24,...
'DefaultAxesFontName','Helvetica',...
'DefaultTextFontName','Helvetica',...
'DefaultAxesFontWeight','bold','DefaultTextFontWeight','bold',...
'DefaultLineLineWidth',3,'DefaultLineMarkerSize',12,...
'DefaultFigureColor','w','DefaultAxesColorOrder',...
[0 0 1;0 .5 0;1 0 0;0 .75 .75;.75 0 .75;.75 .75 0;.25 .25 .25],...
'DefaultFigurePosition',[5 100 [900 650]*.9],...
'DefaultFigureResize','off')
format short
%% Set up for variable number of elements
Nel = 50; % Number of elements
L = 10; % Beam length
rhoA = 1; % Beam density (per length)
EI = 1; % Beam flexural rigidity
R = 1.48; % R = rhoI/rhoA
S = .439; % S = kAG/EI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for ie = 1:length(Nel)
% Begin FE setup -- element length, phi parameter, and local matrices
% built from shape functions
% nw0w0 is integral 0^Lel [N w]^T [N w] dx
% nt1w1 is integral 0^Lel [N phi']^T [N w'] dx
% etc.
Lel = L/Nel(ie);
phi = 12/S/Lel^2; %Timoshenko

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

nt0w1 = nw1t0';

nw0w2 = [ -(phi + 6/5)/(Lel*(phi + 1)^2),...
- (phi/2 + 3/5)/(phi + 1)^2 - 1/2, ...
(phi + 6/5)/(Lel*(phi + 1)^2), 1/2 - (phi/2 + 3/5)/(phi + 1)^2;
-1/(10*(phi + 1)^2), ...
- Lel/12 - Lel/(20*(phi + 1)^2), ...
1/(10*(phi + 1)^2), Lel/12 - Lel/(20*(phi + 1)^2);
(phi + 6/5)/(Lel*(phi + 1)^2),...
(phi/2 + 3/5)/(phi + 1)^2 - 1/2,...
-(phi + 6/5)/(Lel*(phi + 1)^2), (phi/2 + 3/5)/(phi + 1)^2 + 1/2;
-1/(10*(phi + 1)^2), Lel/12 - Lel/(20*(phi + 1)^2),...
1/(10*(phi + 1)^2), - Lel/12 - Lel/(20*(phi + 1)^2)];

nw0w4 = [ 0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0];

nt0w3 = [-12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2), ...
12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2);
(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2), ...
-(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2);
12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2), ...
-12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2);
(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2), ...
-(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2)];

nw0t3 = [ 0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0];

nt0t2 = [ -12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2),...
12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2);
(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2),...
-(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2);
12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2), ...
-12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2);
(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2), ...
-(6*phi)/(Lel^2*(phi + 1)^2), (3*phi)/(Lel*(phi + 1)^2)];

nt0t3 = [ 0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0];

nw2w2 = [ 12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2),...
-12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2);
6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) + 1/Lel,...
-6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) - 1/Lel;
-12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2),...
12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2);
6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) - 1/Lel, ...
-6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) + 1/Lel];

nt2t2 = [ 144/(Lel^5*(phi + 1)^2), 72/(Lel^4*(phi + 1)^2), ...
-144/(Lel^5*(phi + 1)^2), 72/(Lel^4*(phi + 1)^2);
72/(Lel^4*(phi + 1)^2), 36/(Lel^3*(phi + 1)^2), ...
-72/(Lel^4*(phi + 1)^2), 36/(Lel^3*(phi + 1)^2);
-144/(Lel^5*(phi + 1)^2), -72/(Lel^4*(phi + 1)^2), ...
144/(Lel^5*(phi + 1)^2), -72/(Lel^4*(phi + 1)^2);
72/(Lel^4*(phi + 1)^2), 36/(Lel^3*(phi + 1)^2), ...
-72/(Lel^4*(phi + 1)^2), 36/(Lel^3*(phi + 1)^2)];

nt1w2 = [ 12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2),...
-12/(Lel^3*(phi + 1)^2), 6/(Lel^2*(phi + 1)^2);
6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) + 1/Lel, ...
-6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) - 1/Lel;
-12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2), ...
12/(Lel^3*(phi + 1)^2), -6/(Lel^2*(phi + 1)^2);
6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) - 1/Lel, ...
-6/(Lel^2*(phi + 1)^2), 3/(Lel*(phi + 1)^2) + 1/Lel];
nw1t2 = [ -12/(Lel^3*(phi + 1)), -6/(Lel^2*(phi + 1)), ...
12/(Lel^3*(phi + 1)), -6/(Lel^2*(phi + 1));
0, 0, ...
0, 0;
12/(Lel^3*(phi + 1)), 6/(Lel^2*(phi + 1)),...
-12/(Lel^3*(phi + 1)), 6/(Lel^2*(phi + 1));
0, 0, ...
0, 0];

nt0t4 = [ 0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0;
0, 0, 0, 0];

nw0w1 = [- 3*phi - 3, (Lel*(5*phi + 6))/10, 3*phi + 3,...
-(Lel*(5*phi + 6))/10;
-(Lel*(5*phi + 6))/10, 0, (Lel*(5*phi + 6))/10, -Lel^2/10;
- 3*phi - 3, -(Lel*(5*phi + 6))/10, 3*phi + 3,...
(Lel*(5*phi + 6))/10;
(Lel*(5*phi + 6))/10, Lel^2/10, -(Lel*(5*phi + 6))/10, 0];

nw0w3 =[ 6/(Lel^2*(phi + 1)), 3/(Lel*(phi + 1)),...
-6/(Lel^2*(phi + 1)), 3/(Lel*(phi + 1));
1/(Lel*(phi + 1)), 1/(2*(phi + 1)), ...
-1/(Lel*(phi + 1)), 1/(2*(phi + 1));
6/(Lel^2*(phi + 1)), 3/(Lel*(phi + 1)),...
-6/(Lel^2*(phi + 1)), 3/(Lel*(phi + 1));
-1/(Lel*(phi + 1)), -1/(2*(phi + 1)), ...
1/(Lel*(phi + 1)), -1/(2*(phi + 1))];
nt0t1 =[ 0, 1/(Lel*(phi + 1)), 0, -1/(Lel*(phi + 1));
-1/(Lel*(phi + 1)), -1/2, 1/(Lel*(phi + 1)), 1/2 - 1/(phi + 1);
0, -1/(Lel*(phi + 1)), 0, 1/(Lel*(phi + 1));
1/(Lel*(phi + 1)), 1/(phi + 1) - 1/2, -1/(Lel*(phi + 1)), 1/2];
% Initialize mass, stiffness, & damping matrices; calculate in terms of
% shape function matrices above
mmat = zeros(4,4); kmat = mmat;
mmat = nw0w0 + R*nt0t0;
mrhoI = R*nt0t0; mrhoA = nw0w0;
kmat = nt1t1 + S*nw1w1 + S*nt0t0 -S*nw1t0 - S*nt0w1;
cmat1 = nw0w0;
cmat2 = nw0w2;
cmat3 = nw0w4;
cmat4 = nw0t1;
cmat5 = nw0t3;
cmat6 = nt0w1;
cmat7 = nt0w3;
cmat8 = nt0t0;
cmat9 = nt0t2;
cmat10 = nt0t4;
cmat11 = .5*(nw1t0 + nt0w1);
cmat12 = nw1w1;
cmat13 = cmat11 + cmat12;
cmat14 = rhoA*nw0w0;
cmat15 = rhoA*R*nt0t0;
cmat16 = nt1t1;
crot = cmat2 + cmat4 + cmat6 + cmat8;
cmot = cmat1;
cstr = cmat7 + cmat9;
ctot = cmat1+cmat2+cmat3+cmat4+cmat5+cmat6+cmat7+cmat8+cmat9+cmat10;
cind1 = cmat1*(1+R/S) + 2*cmat4 + 2*R*cmat7 + cmat11
cind2 = cmat1*(1+R/S) + 2*cmat4 + 2*R*cmat7 + S*cmat11
% Initialize & construct global mass, stiffness, and damping matrices
K = zeros(2*Nel(ie)+2); Cind = zeros(2*Nel(ie)+2,2*Nel(ie)+2,25);
M = K; MrhoA = K; MrhoI = K;
for n=1:Nel(ie)
i1 = 2*n-1; i2 = 2*n+2;
%Stiffness Matrix
K(i1:i2,i1:i2) = K(i1:i2,i1:i2) + EI*kmat;
%Effect of individual damping terms
Cind(i1:i2,i1:i2,1) = Cind(i1:i2,i1:i2,1) + cmat1;
Cind(i1:i2,i1:i2,2) = Cind(i1:i2,i1:i2,2) + cmat2;
Cind(i1:i2,i1:i2,3) = Cind(i1:i2,i1:i2,3) + cmat3; %0
Cind(i1:i2,i1:i2,4) = Cind(i1:i2,i1:i2,4) + cmat4;
Cind(i1:i2,i1:i2,5) = Cind(i1:i2,i1:i2,5) + cmat5; %0
Cind(i1:i2,i1:i2,6) = Cind(i1:i2,i1:i2,6) + cmat6;
Cind(i1:i2,i1:i2,7) = Cind(i1:i2,i1:i2,7) + cmat7;
Cind(i1:i2,i1:i2,8) = Cind(i1:i2,i1:i2,8) + cmat8;
Cind(i1:i2,i1:i2,9) = Cind(i1:i2,i1:i2,9) + cmat9;
Cind(i1:i2,i1:i2,10) = Cind(i1:i2,i1:i2,10) + cmat10; %0
Cind(i1:i2,i1:i2,11) = Cind(i1:i2,i1:i2,11) + cmat11;
Cind(i1:i2,i1:i2,12) = Cind(i1:i2,i1:i2,12) + cmat12;
Cind(i1:i2,i1:i2,13) = Cind(i1:i2,i1:i2,13) + cmat13;
Cind(i1:i2,i1:i2,14) = Cind(i1:i2,i1:i2,14) + cmat14;
Cind(i1:i2,i1:i2,15) = Cind(i1:i2,i1:i2,15) + cmat15;
%Using stiffness and mass as damping
Cind(i1:i2,i1:i2,16) = Cind(i1:i2,i1:i2,16) + crot;
Cind(i1:i2,i1:i2,17) = Cind(i1:i2,i1:i2,17) + cstr;
Cind(i1:i2,i1:i2,18) = Cind(i1:i2,i1:i2,18) + cmot;
Cind(i1:i2,i1:i2,19) = Cind(i1:i2,i1:i2,19) + ctot;
Cind(i1:i2,i1:i2,20) = Cind(i1:i2,i1:i2,20) + cind1;
%Additional Damping Terms
Cind(i1:i2,i1:i2,21) = Cind(i1:i2,i1:i2,21) + rhoA*mmat;
Cind(i1:i2,i1:i2,22) = Cind(i1:i2,i1:i2,22) + kmat;
Cind(i1:i2,i1:i2,23) = Cind(i1:i2,i1:i2,23) + cmat16;
Cind(i1:i2,i1:i2,24) = Cind(i1:i2,i1:i2,24) + cind2;
Cind(i1:i2,i1:i2,25) = Cind(i1:i2,i1:i2,25) + S*kmat+ rhoA*mmat;
%Mass Matrix
M(i1:i2,i1:i2) = M(i1:i2,i1:i2) + rhoA*mmat;
MrhoA(i1:i2,i1:i2) = MrhoA(i1:i2,i1:i2) + rhoA*mrhoA;
MrhoI(i1:i2,i1:i2) = MrhoI(i1:i2,i1:i2) + rhoA*mrhoI;
end
% Apply boundary conditions (un-comment the one of interest and comment
% out the rest)
% Pinned-Pinned
K(1,:) = []; K(:,1) = []; K(end-1,:) = []; K(:,end-1) = [];
Cind(1,:,:) = []; Cind(:,1,:) = []; Cind(end-1,:,:) = [];
Cind(:,end-1,:) = [];
M(1,:) = []; M(:,1) = []; M(end-1,:) = []; M(:,end-1) = [];
% % Clamped-Clamped
% K(1:2,:) = []; K(:,1:2) = []; K(end-1:end,:) = []; K(:,end-1:end)=[];
% C(1:2,:) = []; C(:,1:2) = []; C(end-1:end,:) = []; C(:,end-1:end)=[];
% M(1:2,:) = []; M(:,1:2) = []; M(end-1:end,:) = []; M(:,end-1:end)=[];
% % Clamped-Free
% K(1:2,:) = []; K(:,1:2) = [];
% C(1:2,:) = []; C(:,1:2) = [];
% M(1:2,:) = []; M(:,1:2) = [];
% % Clamped-Pinned
% K(1:2,:) = []; K(:,1:2) = []; K(end-1,:) = []; K(:,end-1) = [];
% C(1:2,:) = []; C(:,1:2) = []; C(end-1,:) = []; C(:,end-1) = [];
% M(1:2,:) = []; M(:,1:2) = []; M(end-1,:) = []; M(:,end-1) = [];

% Solve eigenvalue problem in first-order form; sort modes and compute
% natural frequencies and damping ratios
%To observe effects of individual damping terms...
for i = [1:10]
clearvars damps freqs
C(:,:,i) = Cind(:,:,i)*.01;
val_damp = eig([C(:,:,i) K;-eye(size(K)) zeros(size(K))],...
[M zeros(size(K));zeros(size(K)) eye(size(K))]);
val_damp_sort = sort(val_damp);
freqs = abs(val_damp_sort );
damps = real(val_damp_sort )./abs(val_damp_sort);
damps = damps(1:2:end)
damps = damps/damps(1); %normalize
%Plot modal damping ratios versus mode number
figure(i);
plot(damps(1:25),'bo'); hold on;
xl = xlabel('Mode Number');
yl = ylabel('Normalized Modal Damping \zeta n/\zeta 1');
set(xl, 'fontsize',30)
set(yl,'fontsize',22)
end
end