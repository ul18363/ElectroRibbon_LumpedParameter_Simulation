function h= user_interface()
fig_dims=[50 1 27 40];
h.fgh = figure('Units','normalized','Position',[0 0 1 1]);
%sim_object=33;
entered=0;
h.run_sim_flag=0;
%% Define simulation object
% N=21;scale=5.45e-4; dt=10^-7; % Succesful for N=21;M=0
N=11;scale=1.55e-4; dt=10^-6;% Succesful for N=11;M=0

h.obj=Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
h.obj.M=0.02;%
h.obj.update_model();
og_GA=h.obj.plate.GA;
og_k_axial=h.obj.plate.k_axial;
h.obj.retrieve_real_final_position();
%

scale_axial=1;
scale_trans=scale;
h.obj.plate.k_axial=og_k_axial*scale_axial;
h.obj.plate.GA=og_GA*scale_trans;

%old_p=obj.plate.p;

t_refresh=10^-2;
T_Sim=0;
last_refresh=T_Sim;
%% SIMULATION
drunk_scale=1.01;
drunk_scale2=1.01;
dt_timestep=dt;
    function do_sim_timestep(dt)
    end

    function plot_results()
        
        %subplot(3,1,1)
        axes(h.pax11); %set the current axes to axes2
        %h.pax11 = pax11;
        %h.pax21 = pax21;
        %h.pax31 = pax31;
        hold off
        plot(h.obj.real_x_tp,h.obj.real_y_tp,'r-x')
        hold on
        plot(h.obj.plate.p(1,:),(h.obj.plate.p(2,:)),'b-o')
        drawnow
        title(['Graph title',num2str(T_Sim)]);
        %['Profile deflection| Scale:',num2str(scale),...
        %'| M:',num2str(obj.M),'| t:',num2str(i)])
        xlabel('x [m]')
        ylabel('y [m]')
        legend({'Real', 'Simulation'})
        %subplot(3,1,2)
        axes(h.pax21); %set the current axes to axes2
        hold off
        plot(h.obj.plate.v(2,:))
        hold on
        plot(h.obj.plate.v(1,:))
        xlabel('Node #')
        ylabel('V [m/s]')
        legend({'Vy', 'Vx'})
        axis([0 11 -10e-2 10e-2])
        %subplot(3,1,3)
        axes(h.pax31); %set the current axes to axes2
        semilogy(T_Sim,MSE,'rx')
        hold on
        
        xlabel('Node #')
        ylabel('MSE')
        legend({'MSE'})
        drawnow();
        
        
    end

%% Create Left Scroller (Direct Coefficient)

dir_panel=uipanel(h.fgh,'Title','Direct Control',...
    'Units','centimeters' ,'Position',[0 0 5 26]);
txh = uicontrol(dir_panel,'Style','text', 'Units','centimeters' ,'Position',[1 1 1.5 1]);
sld_d_e = uicontrol(dir_panel,'Style','slider','Units','centimeters','Position',[1.2 3 1 20],...
    'Callback',@updateText,'Min',-4,'Max',6);
sld_d_v = uicontrol(dir_panel,'Style','slider','Units','centimeters','Position',[1.2 3 1 20],...
    'Callback',@updateText,'Min',-4,'Max',6);
txh2 = uicontrol(dir_panel,'style','edit','Units','centimeters' ,'Position',[1 2 1.5 1],'Callback',@updateSlider);

function updateText(h,~)
    val = get(h,'Value');
    val= round(val,0);
    set(txh,'String',num2str(val))
    set(txh2,'String',num2str(val))
    set(h,'Value',val)
end

function updateSlider(h,~)
    val = str2double(get(h,'String'));
    disp(val)
    set(sld_d_e,'Value',val)
    set(txh,'String',num2str(val))
end


%% Create Left Scroller (Direct Coefficient)
sh_panel=uipanel(h.fgh,'Title','Shear Control',...
    'Units','centimeters' ,'Position',[5 0 5 26]);

sh_txh = uicontrol(sh_panel,'Style','text', 'Units','centimeters' ,'Position',[1 1 1.5 1]);
sh_sld_d_e = uicontrol(sh_panel,'Style','slider','Units','centimeters','Position',[1.2 3 1 20],...
    'Callback',@sh_updateText,'Min',-4,'Max',6);
sh_sld_d_v = uicontrol(sh_panel,'Style','slider','Units','centimeters','Position',[1.2 3 1 20],...
    'Callback',@sh_updateText,'Min',-4,'Max',6);
sh_txh2 = uicontrol(sh_panel,'style','edit','Units','centimeters' ,'Position',[1 2 1.5 1],...
    'Callback',@sh_updateSlider);

    function sh_updateText(h,~)
        val = get(h,'Value');
        val= round(val,0);
        set(sh_txh,'String',num2str(val))
        set(sh_txh2,'String',num2str(val))
        set(h,'Value',val)
    end

    function sh_updateSlider(h,~)
        val = str2double(get(h,'String'));
        disp(val)
        set(sh_sld_d_e,'Value',val)
        set(sh_txh,'String',num2str(val))
    end
%% Create Simulation Control Panel
sc_panel=uipanel(h.fgh,'Title','Simulation Control',...
    'Units','centimeters' ,'Position',[10 0 20 6]);
% Simulation Button
h.stop_btn = uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 1.5 4 1],'String','Resume/Stop',...
    'Callback',@sim_btn_callback);%,...%'Callback',@sh_updateSlider);
function sim_btn_callback(hObject, ~, ~)
        if get(hObject,'Value')
            disp("Start")
        else
            disp("Stop")
        end
end

h.refresh_params_btn= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 2.5 4 1],'String','Update Params');
h.save_status= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 3.5 4 1],'String','Save','Callback',@save_status);
    function save_status(hObject, ~, ~)
save([datestr(now,'yyyy_mm_dd_HH_MM_SS'),'.mat'],'h')
end
%
plot_selector = uicontrol(sc_panel,...
                'Style','popupmenu',...
                'units','centimeters',...
                'Position',[15 4.5 4 1],...
                'String',{'Deformation','Velocity','Error','Force','F.Elastic.','F.Damp.','F.Electr.'},...
                'Value',1);%,...
                %'ValueChangedFcn',@(dd,event) selection(dd,p));



%Parameters update buttons

% Editable parameters
h.refresh_sim_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[10 1 2 1],'String',sprintf('%.2e',t_refresh),...
    'Callback',@refresh_sim_box_callback);
uicontrol(sc_panel,'style','text','Units','centimeters' ,...
    'Position',[8 0.8 2 1],'String','Refresh T:');

    function refresh_sim_box_callback(hObject, ~, ~)
        raw=get(hObject,'String');
        [num, status] = str2num(raw);
        if status
            t_refresh=num;
        else
            disp([raw,' needs to be a numeric expression.'])
        end
    end

h.timestep_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[10 2 2 1],'String',sprintf('%.2e',dt),...
    'Callback',@timestep_box_callback);
uicontrol(sc_panel,'style','text','Units','centimeters' ,...
    'Position',[8 1.8 2 1],'String','Timestep:');
function timestep_box_callback(hObject, ~, ~)
        raw=get(hObject,'String');
        [num, status] = str2num(raw);
        if status
            t_refresh=num;
        else
            disp([raw,' needs to be a numeric expression.'])
        end
    end



%% Create Display Panel
% disp_panel=uipanel(h.fgh,'Title','Display',...
%     'Units','centimeters' ,'Position',[10 6 20 20]);
% h.axes=axes(h.fgh,... %One can't plot in panels for some reason
%     'Units','centimeters' ,'Position',[11.5 7 17 17]);

panhandle = uipanel('Units','centimeters','Position', [10 6 20 20]);
pax11 = subplot(3,1,1,'Parent', panhandle);
pax21 = subplot(3,1,2,'Parent', panhandle);
pax31 = subplot(3,1,3,'Parent', panhandle);
h.panhandle = panhandle;
h.pax11 = pax11;
h.pax21 = pax21;
h.pax31 = pax31;
%% Create Statistics Panel
st_panel=uipanel(h.fgh,'Title','Statistics',...
    'Units','centimeters' ,'Position',[30 0 5 26]);

error_txt=uicontrol(st_panel,'style','text','Units','centimeters' ,...
    'Position',[0.5 20 3 0.5],'String','Error:');
s_axial_txt=uicontrol(st_panel,'style','text','Units','centimeters' ,...
    'Position',[0.5 19.5 3 0.5],'String','K.Ax.:');
s_trans_txt=uicontrol(st_panel,'style','text','Units','centimeters' ,...
    'Position',[0.5 19 3 0.5],'String','K.Tr.:');
avg_tstep_txt=uicontrol(st_panel,'style','text','Units','centimeters' ,...
    'Position',[0.5 18.5 3 0.5],'String','Tstp.:');
    function update_statistics(MSE,avg_tstep)
%         set(error_txt,'String',['Error: ',num2str(MSE)])
%         set(s_axial_txt,'String',['K.Ax.: ',num2str(h.obj.plate.k_axial)])
%         set(s_trans_txt,'String',['K.Tr.: ',num2str(h.obj.plate.k_trans)])
%         set(avg_tstep_txt,'String',['Tstp.: ',num2str(avg_tstep)])
        set(error_txt,'String',['Error: ',sprintf('%.2e',MSE)])
        set(s_axial_txt,'String',['K.Ax.: ',sprintf('%.2e',h.obj.plate.k_axial)])
        set(s_trans_txt,'String',['K.Tr.: ',sprintf('%.2e',h.obj.plate.k_trans)])
        set(avg_tstep_txt,'String',['Tstp.: ',sprintf('%.2e',avg_tstep)])
    end
%% Main
%old_value=get(h.stop_btn,'Value');
drawnow;
tic
%refreshT=0.1;
steps_since_stats_refresh=0;
while 1
    steps_since_stats_refresh=steps_since_stats_refresh+1;
    if toc>0.1 % Using drawnow constantly makes loop super slow.
        tic
        drawnow;
        %update_statistics(0);
        
    end
    
     if get(h.stop_btn,'Value')
        %% Simulation steps goes here
        
        % First do a backup
        p_bu=h.obj.plate.p;
        v_bu=h.obj.plate.v;
        
        
        dt_timestep_reco=0;
        tries=0;
%         h.obj.calculate_all_forces();
%         h.obj.perform_timestep(dt);
        while dt_timestep_reco~=dt_timestep
            h.obj.calculate_all_forces();
            h.obj.perform_timestep(dt_timestep);
            dt_timestep_reco=h.obj.plate.analyze_divergence(dt_timestep);
            if dt_timestep_reco~=dt_timestep %If divergence is detected
                tries=tries+1;
                dt_timestep=dt_timestep/drunk_scale; % Reduce timestep
                h.obj.plate.p=p_bu; %Reset position of particles
                h.obj.plate.v=v_bu; %Reset velocities of particles
                %disp(dt_timestep)
            elseif tries==0 %If in the first go was stable
                dt_timestep=dt_timestep*drunk_scale; % Increase timestep
                break
            end
            %dt_timestep_reco=obj.plate.analyze_divergence(dt_timestep);
            
        end
        T_Sim=T_Sim+dt_timestep;
        if T_Sim> last_refresh+t_refresh % If is time to refresh the picture
            last_refresh=T_Sim;
            MSE=h.obj.estimate_error('MSE');
            plot_results()
            update_statistics(MSE,t_refresh/steps_since_stats_refresh);
            steps_since_stats_refresh=0;
        end
        
    end
end

end
