function h= user_interface2()
%fig_dims=[50 1 27 40];
h.fgh = figure('Units','normalized','Position',[0 0 1 1]);
%sim_object=33;
entered=0;
h.run_sim_flag=0;
%% Define simulation object
% N=21;scale=5.45e-4; dt=10^-7; % Succesful for N=21;M=0
N=11;%scale=1.55e-4; dt=10^-6;% Succesful for N=11;M=0
M=0.02;
    function define_new_Param_Estimator(N,M)
        h.obj=Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
        h.obj.M=M;%
        h.obj.update_model();
        h.obj.retrieve_real_final_position();
    end
define_new_Param_Estimator(N,M)

MSE=0;
t_refresh=10^-2;
T_Sim=0;
last_refresh=T_Sim;

%% SIMULATION
drunk_scale=1.01;
%drunk_scale2=1.01;
dt=1e-6;
dt_timestep=1e-6;
Voltage=0;
    function plot_results()
        disp(h.obj.plate.k_trans_vec(1))
        
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
        title(['K=',num2str(h.obj.plate.k_trans), 'T: ',num2str(T_Sim)]);
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

%% Create Left Scroller (Voltage Control)

volt_panel=uipanel(h.fgh,'Title','Voltage Control',...
    'Units','centimeters' ,'Position',[0 0 5 25]);
txh = uicontrol(volt_panel,'Style','text', 'Units','centimeters' ,'Position',[1 1 1.5 1]);
voltage_val_slider= uicontrol(volt_panel,'Style','slider','Units','centimeters','Position',[1.2 3 1 20],...
    'Callback',@exp_callback,'Min',0,'Max',12,'SliderStep', [0.01, 0.1]/(12-0));
voltage_edit = uicontrol(volt_panel,'style','edit','Units','centimeters' ,'Position',[1 2 1.5 1],'Callback',@modify_Voltage_from_edit);
voltage_txt = uicontrol(volt_panel,'style','text','Units','centimeters' ,...
    'Position',[3 2 1.5 1],'Callback',@updateSlider);
addlistener(voltage_val_slider, 'Value', 'PostSet',@modify_Voltage_from_slider);

    function modify_Voltage_from_slider(h,~)
        val = get(h,'Value');
        val= round(val,0); %Round Value
        set(voltage_txt,'String',[num2str(val), 'KV'])
        set(voltage_stat_txt,'String',num2str(val))
        set(voltage_edit,'String',num2str(val))
        set(h,'Value',val)
    end

    function modify_Voltage_from_edit(obj,~)
        value = str2double(get(obj,'String'));
        if ~isnan(value)
            disp(val)
            set(sld_d_e,'Value',val)
            set(txh,'String',num2str(val))
        end
    end


%% Create Right Scroller (Shear Coefficient)
sh_panel=uipanel(h.fgh,'Title','Shear Control',...
    'Units','centimeters' ,'Position',[5 0 5 25]);

shear_exp_slider =uicontrol(sh_panel,'Style','slider','Units','centimeters','Position',[1.2 3 1 20],...
    'Callback',@exp_callback,'Min',-9,'Max',20,'Value',floor(log10(h.obj.plate.k_trans)),'SliderStep', [1, 1]/(20+9));
shear_val_slider =uicontrol(sh_panel,'Style','slider','Units','centimeters','Position',[2.2 3 1 20],...
    'Callback',@val_callback,'Min',1,'Max',10,'Value',h.obj.plate.k_trans/10^(floor(log10(h.obj.plate.k_trans))),'SliderStep', [0.01, 0.1]/(10-1));
sh_txh = uicontrol(sh_panel,'Style','text', 'Units','centimeters' ,'Position',[1.2 1 2 1],'String',exp_notation(get(shear_val_slider,'Value'),get(shear_exp_slider,'Value')));
sh_txh2 = uicontrol(sh_panel,'style','edit','Units','centimeters' ,'Position',[1.2 2 2 1],...
    'Callback',@shear_text_edit_callback,'String',exp_notation(get(shear_val_slider,'Value'),get(shear_exp_slider,'Value')));
addlistener(shear_exp_slider, 'Value', 'PostSet',@modify_Shear_coefficient_from_sliders);
addlistener(shear_val_slider, 'Value', 'PostSet',@modify_Shear_coefficient_from_sliders);
    function str=exp_notation(val,exp)
        str=[num2str(val),'e',num2str(exp)];
    end
    function modify_Shear_coefficient_from_sliders(~,~)
        exp=round(get(shear_exp_slider,'Value'),0);
        val=round(get(shear_val_slider,'Value'),2);
        h.obj.plate.k_trans=val*10^exp;
        h.obj.plate.GA=h.obj.plate.k_trans*h.obj.plate.dl;
        
        
        %h.obj.plate.k_trans=obj.G*obj.A/obj.dl;
        set(s_axial_txt,'String',['K.Ax.: ',sprintf('%.2e',h.obj.plate.k_trans)])
        set(sh_txh,'String',exp_notation(val,exp))
        set(sh_txh2,'String',exp_notation(val,exp))
    end
    function val_callback(obj,~)
        val = round(get(obj,'Value'),2);
        set(obj,'Value',val)
    end
    function exp_callback(obj,~)
        val = round(get(obj,'Value'),0);
        set(obj,'Value',val)
    end
    function shear_text_edit_callback(obj,~)
        value = str2double(get(obj,'String'));
        if ~isnan(value)
            exp=floor(log10(value));
            val=round(value/10^exp,2);
            h.obj.plate.k_trans=value;
            h.obj.plate.GA=h.obj.plate.k_trans*h.obj.plate.dl;
            set(shear_exp_slider,'Value',exp)
            set(shear_val_slider,'Value',val)
            set(sh_txh,'String',exp_notation(val,exp))
        end
    end
%% Create Simulation Control Panel
sc_panel=uipanel(h.fgh,'Title','Simulation Control',...
    'Units','centimeters' ,'Position',[10 0 20 6]);
% Simulation Button
h.stop_btn = uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 1.5 4 1],'String','Resume/Stop',...
    'Callback',@sim_btn_callback);%,...%'Callback',@sh_updateSlider);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% ~~~         SIMULATION BEGIN       ~~~ %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function sim_btn_callback(hObject, ~, ~)
        if get(hObject,'Value')
            disp("Start")
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
                    
                else
                    break
                end
            end
            
            
            
        else
            disp("Stop")
        end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% ~~~         SIMULATION   END       ~~~ %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h.refresh_params_btn= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 2.5 4 1],'String','Update Params');


h.save_status= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 3.5 4 1],'String','Save','Callback',@save_status);
    function save_status(hObject, ~, ~)
        obj=h.obj;
%         p=h.obj.plate.p;
%         v=h.obj.plate.v;
%         N=h.obj.N;
%         M=h.obj.M;
%         real_p=h.obj.real_p;
%         h.obj.sht_dms
        %save('config.mat',obj)
        save(['config_N',num2str(N),'_',datestr(now,'yyyy_mm_dd_HH_MM_SS'),'.mat'],'obj')
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Refresh time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

h.M_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[10 2 2 1],'String',sprintf('%.2e',h.obj.plate.M),...
    'Callback',@M_box_callback);
uicontrol(sc_panel,'style','text','Units','centimeters' ,...
    'Position',[8 1.8 2 1],'String','Mass Load:');
    function M_box_callback(hObject, ~, ~)
        raw=get(hObject,'String');
        [num, status] = str2num(raw);
        if status
            t_refresh=num;
        else
            disp([raw,' needs to be a numeric expression.'])
        end
    end
h.N_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[10 3 2 1],'String',num2str(h.obj.plate.N),...
    'Callback',@N_edit_box_callback);
uicontrol(sc_panel,'style','text','Units','centimeters' ,...
    'Position',[10 1.8 2 1],'String','N:');
    function N_edit_box_callback(obj,~,~)
        [N, status]=str2num(get(obj,'String'));
        if status
            define_new_Param_Estimator(N,M)
            %h.obj=Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
        else
            disp([raw,' needs to be a numeric expression.'])
        end
    end


h.load_status= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[12 2.8 2 1],'String','Load','Callback',@load_status);
    function load_status(hObject, ~, ~)
        [file,path] = uigetfile('*.m');
        if isequal(file,0)
            disp('User selected Cancel');
        else
            load_obj=load(fullfile(path,file),'obj');
%             load_M=load(fullfile(path,file),'M');
%             load_N=load(fullfile(path,file),'N');
%             load_p=load(fullfile(path,file),'p');
%             load_v=load(fullfile(path,file),'v');
%             load_sht_dms=load(fullfile(path,file),'sht_dms');
%             load_real_p=load(fullfile(path,file),'real_p');
%             disp(['User selected ', fullfile(path,file)]);
%             if ~isempty(fieldnames(load_M))
%                 M=load_M.M;
%             end
%             if ~isempty(fieldnames(load_N))
%                 M=load_M.M;
%             end
%             if ~isempty(fieldnames(load_p))
%                 M=load_M.M;
%             end
%             if ~isempty(fieldnames(load_v))
%                 M=load_M.M;
%             end
%             if ~isempty(fieldnames(load_sht_dms))
%                 M=load_M.M;
%             end
            if ~isempty(fieldnames(load_obj))
                h.obj=load_obj.obj;
            end

            
        end
        %save([datestr(now,'yyyy_mm_dd_HH_MM_SS'),'.mat'],'h')
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

N_txt           =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 20.5 3 0.5],'String','Error:');
error_txt       =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 20 3 0.5]  ,'String','Error:');
s_axial_txt     =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 19.5 3 0.5],'String','K.Ax.:');
s_trans_txt     =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 19 3 0.5]  ,'String','K.Tr.:');
avg_tstep_txt   =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 18.5 3 0.5],'String','Tstp.:');
voltage_stat_txt=uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 18 3 0.5]  ,'String','Volt.:');
    function update_statistics(MSE,avg_tstep)
        set(N_txt,'String',['N: ',num2str(h.obj.plate.N)])
        set(voltage_stat_txt,'String',['V: ',num2str(Voltage),' KV'])
        set(error_txt,'String',['Error: ',sprintf('%.2e',MSE)])
        set(s_axial_txt,'String',['K.Ax.: ',sprintf('%.2e',h.obj.plate.k_axial)])
        set(s_trans_txt,'String',['K.Tr.: ',sprintf('%.2e',h.obj.plate.k_trans)])
        set(avg_tstep_txt,'String',['Tstp.: ',sprintf('%.2e',avg_tstep)])
    end
%% Main
%old_value=get(h.stop_btn,'Value');


end
