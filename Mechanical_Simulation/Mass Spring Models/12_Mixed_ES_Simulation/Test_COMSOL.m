%Load From CSV
retrieve_filtered_data
n_samples = length(L);
%Scale Units
mass=mass/1000; %g->Kg
w=w/1000;%mm->m
L=L/1000;%mm->m
t=t/10^6;%um->m
comsol_deflection=zeros([n_samples 1]);
comsol_contraction=zeros([n_samples 1]);
L=L/2; %Half-sheet Model
mass=mass/2; % Half Mass acting on half sheet
dY=dY/1000;

% end
%% Iterate over each sheet configuration and ask COMSOL for the deflection
N=2;
i=1;
base_l=0.01;
sht_dms=[L(i),w(i),t(i)];
h.obj=Param_Estimator(sht_dms,N,'Steel AISI 4340',base_l);
for i=1:n_samples
    %disp(i)
    
    h.obj.og_p=[ 0 t(i); L(i) t(i); L(i) 0 ;0 0];
    h.obj.M=mass(i);%
    h.obj.width=w(i);
    
    h.obj.update_model();
    h.obj.retrieve_real_final_position();
    
    dY_sim=-2*h.obj.real_p(2,3);
    dX_sim=2*(L(i)-h.obj.real_p(1,3));
    comsol_deflection(i)=dY_sim;
    disp([num2str(i),'|',num2str(dY(i)),'|',num2str(dY_sim),'|',num2str(abs(dY_sim-dY(i))/dY(i)),'%'])
    comsol_contraction(i)=dX_sim;
end
%% Output Format for Excel
res_mat=[L,w,t,V,T,mass,dY,comsol_contraction,comsol_deflection];
%% Plot the relative Error
lines={'-','--',':','-.'};% Mark the width
markers={'o','+','*','x','s','d','^','v','>','<','p','h','.'}; % Mark the thickness
colors={'m','c','r','b','k','y','g','w'}; % Color mark the Length
% unique_len=unique(L)*2;
unique_len=unique(L);
unique_w=unique(w);
unique_t=unique(t);
legends={};
% out=100*abs(dY-comsol_deflection)./dY;
out=comsol_deflection;
ixs_out=out>0;
for li =1:length(unique_len)
    lixs=L==unique_len(li);
    if ~any(lixs)
        continue
    end
    for wi= 1:length(unique_w)
        wixs=w==unique_w(wi);
        if ~any(lixs & wixs)
            continue
        end
        for ti= 1:length(unique_t)
            tixs=t==unique_t(ti);
            if  ~any(lixs & wixs & tixs) % ~any(lixs & wixs & tixs & ixs_out)
                continue
            else
                ixs=(lixs & wixs & tixs);%(lixs & wixs & tixs & ixs_out);
                disp([num2str(li),': ',num2str(sum(L==unique_len(li)))])
%                 plot(mass(ixs),dY(ixs))
                
%                 loglog(mass(ixs),out(ixs),[colors{li},lines{wi},markers{ti}])
                 plot(mass(ixs),out(ixs),[colors{li},lines{wi},markers{ti}])
                hold on
                legends{end+1}=['L:',num2str(1000*unique_len(li)),...
                    ' |w:',num2str(1000*unique_w(wi)),...
                    ' |t:',num2str(10^6*unique_t(ti))];
                    
                    
            end
        end
    end
end
legend(legends)
grid on
title('Simulated Stroke per sheet configuration')
xlabel('load [Kg]')
% ylabel('Percentual Error [%]')
ylabel('COMSOL Stroke [mm]')