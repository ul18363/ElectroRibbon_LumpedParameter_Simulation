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
sht_dms=[0.045 0.0127 100e-6];
base_l=1e-2;
define_new_Param_Estimator(sht_dms,N,M,base_l)
MSE=0;
t_refresh=10^-2;
T_Sim=0;
last_refresh=T_Sim;
drunk_scale=1.01;
%drunk_scale2=1.01;
dt=1e-6;
dt_timestep=1e-6;
Voltage=0;
contact_ix=1;

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
        Voltage=val;
        set(voltage_txt,'String',[num2str(val), 'KV'])
        set(voltage_stat_txt,'String',num2str(val))
        set(voltage_edit,'String',num2str(val))
        set(h,'Value',val)
    end

    function modify_Voltage_from_edit(obj,~)
        value = str2double(get(obj,'String'));
        if ~isnan(value)
            disp(val)
            Voltage=value;
            set(sld_d_e,'Value',val)
            set(voltage_txt,'String',[num2str(val), 'KV'])
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
%% 1.0 Create Simulation Control Panel

sc_panel=uipanel(h.fgh,'Title','Simulation Control',...
    'Units','centimeters' ,'Position',[10 0 20 6]);
%% 1.1 Simulation Button
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
                end
                
                if get(h.stop_btn,'Value')
                    %% Simulation steps goes here
                    % First do a backup
                    p_bu=h.obj.plate.p;
                    v_bu=h.obj.plate.v;
                    dt_timestep_reco=0;
                    tries=0;
                    while dt_timestep_reco~=dt_timestep %Check for stability
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
                    
                    if Voltage>0 && h.obj.plate.p(2,contact_ix+1)>=0 %Check for contact
                        y_old=p_bu(2,contact_ix+1);
                        if y_old>0 %Previous timestep shouldn't be in contact
                            error('When checking for contact the previous timestep was already in contact. Stepping Further will cause a negative timestep!')
                        end
                        y_n=h.obj.plate.p(2,contact_ix+1);
                        mini_step=dt_timestep*(-y_old/(y_n-y_old));
                        h.obj.plate.p=p_bu; %Reset position of particles
                        h.obj.plate.v=v_bu; %Reset velocities of particles
                        
                        h.obj.calculate_all_forces();
                        h.obj.perform_timestep(mini_step);
                        
                        contact_ix=contact_ix+1;
                        if contact_ix==N-1
                           break 
                        end
                        h.obj.plate.p(2,contact_ix)=0; % The y position of the particle is set to 0.
                        h.obj.plate.f_mask(2,contact_ix)=0;% No more forces in the y direction can be applied to the particle
                        %check_for_new_contact()
                        T_Sim=T_Sim+mini_step;
                        
                        %dt_timestep=stable_timestep;
                    else
                        T_Sim=T_Sim+dt_timestep;
                    end
                    
                    
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
%% 1.2 Refresh Parameters Buttons (Unused)
h.refresh_params_btn= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 2.5 4 1],'String','Update Params');
%% 1.2 Plot Selection (Not Done)
plot_selector = uicontrol(sc_panel,...
    'Style','popupmenu',...
    'units','centimeters',...
    'Position',[15 4.5 4 1],...
    'String',{'Deformation','Velocity','Error','Force','F.Elastic.','F.Damp.','F.Electr.'},...
    'Value',1)
%% 1.3 Refresh Timestep Box
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Refresh time
%%%%%%%%%%%%%%%%%%%%%
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
%% 1.4 Mass & N Edit Box
h.M_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[10 2 2 1],'String',sprintf('%.2e',h.obj.M),...
    'Callback',@M_box_callback);

uicontrol(sc_panel,'style','text','Units','centimeters' ,...
    'Position',[8 1.8 2 1],'String','Mass Load:');
    function M_box_callback(hObject, ~, ~)
        raw=get(hObject,'String');
        [num, status] = str2num(raw);
        if status
            h.obj.M=num;
            h.obj.update_model();
            h.obj.retrieve_real_final_position();
        else
            disp([raw,' needs to be a numeric expression.'])
        end
    end

h.N_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[10 3 2 1],'String',num2str(h.obj.plate.N),...
    'Callback',@N_edit_box_callback);
uicontrol(sc_panel,'style','text','Units','centimeters' ,...
    'Position',[8 2.8 2 1],'String','N:');

    function N_edit_box_callback(obj,~,~)
        [N, status]=str2num(get(obj,'String'));
        if status
            define_new_Param_Estimator(N,M)
            %h.obj=Param_Estimator([0.1 0.0127 100e-6],N,'Steel AISI 4340',0.01);
        else
            disp([raw,' needs to be a numeric expression.'])
        end
    end
%% 1.5 Sheet/Base/Clip Dimensions
h.length_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[1 3 2 1],'String',sprintf('%.2e',h.obj.sht_dms(1)),...
    'Callback',@dimension_update_callback,'Tag','length_box');uicontrol(sc_panel,'style','text','Units','centimeters' ,'Position',[1 4 2 0.5],'String','L[m]');

h.widht_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[3 3 2 1],'String',sprintf('%.2e',h.obj.sht_dms(2)),...
    'Callback',@dimension_update_callback,'Tag','widht_box');uicontrol(sc_panel,'style','text','Units','centimeters' ,'Position',[3 4 2 0.5],'String','w[m]');
h.thickness_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[5 3 2 1],'String',sprintf('%.2e',h.obj.sht_dms(3)),...
    'Callback',@dimension_update_callback,'Tag','thickness_box');uicontrol(sc_panel,'style','text','Units','centimeters' ,'Position',[5 4 2 0.5],'String','t[m]');
h.clip_l_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[1 1 2 1],'String',sprintf('%.2e',1e-2),...
    'Callback',@dimension_update_callback,'Tag','clip_l_box');uicontrol(sc_panel,'style','text','Units','centimeters' ,'Position',[1 2 2 0.5],'String','clip_l[m]')
h.base_l_box= uicontrol(sc_panel,'style','edit','Units','centimeters' ,...
    'Position',[3 1 2 1],'String',sprintf('%.2e',1e-2),...
    'Callback',@dimension_update_callback,'Tag','base_l_box');uicontrol(sc_panel,'style','text','Units','centimeters' ,'Position',[3 2 2 0.5],'String','base_l[m]')
    function dimension_update_callback(obj,~)
        tag=get(obj,'Tag');
        [value,flag]=str2num(get(obj,'String'));
        if flag
        disp(['Updating: ',tag])
            switch tag 
                case'length_box'
                    h.obj.sht_dms(1)=value;
                case'widht_box'
                    h.obj.sht_dms(2)=value;
                case'thickness_box'
                    h.obj.sht_dms(3)=value;
                case'clip_l_box'
                    clip_l=value;
                case'base_l_box'
                    base_l=value;    
            end
        else
        disp(['Fail Updating: ',tag])
        disp('Please pass a numeric value')    
        end
        
    end
%% 1.6 Load & Save Button
h.load_status= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[13 3.5 2 1],'String','Load','Callback',@load_status);
    function load_status(hObject, ~, ~)
        [file,path] = uigetfile('*.mat');
        if isequal(file,0)
            disp('User selected Cancel');
        else
            load_obj=load(fullfile(path,file),'obj');
            if ~isempty(fieldnames(load_obj))
                h.obj=load_obj.obj;
            end

            
        end
        %save([datestr(now,'yyyy_mm_dd_HH_MM_SS'),'.mat'],'h')
    end
h.quit_btn= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[13 2.5 2 1],'String','Quit','Callback',@quit_callback);
    function quit_callback(~,~)
        close(h.fgh);
    end
h.save_status= uicontrol(sc_panel,'style','toggle','Units','centimeters' ,...
    'Position',[15 3.5 4 1],'String','Save','Callback',@save_status);
    function save_status(hObject, ~, ~)
        obj=h.obj;
        save(['config_N',num2str(N),'_',datestr(now,'yyyy_mm_dd_HH_MM_SS'),'.mat'],'obj')
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

    function set_controls_to_obj_values()
        % Shear Sliders & Edit Box
        value = h.obj.plate.k_trans;
        if ~isnan(value)
            exp=floor(log10(value));
            val=round(value/10^exp,2);
            set(shear_exp_slider,'Value',exp)
            set(shear_val_slider,'Value',val)
            set(sh_txh,'String',exp_notation(val,exp))
            set(sh_txh2,'String',exp_notation(val,exp))
        end
        %N, M
        set(N_txt,'String',['N: ',num2str(h.obj.N)])
        set(M_txt,'String',['M: ',num2str(h.obj.M)])
        
        %M=h.obj.M;
        
        %update_statistics(0,0)
        
        
        
        
    end
%% Create Statistics Panel
st_panel=uipanel(h.fgh,'Title','Statistics',...
    'Units','centimeters' ,'Position',[30 0 5 26]);

M_txt           =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 21.0 3 0.5],'String','M:');
N_txt           =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 20.5 3 0.5],'String','N:');
error_txt       =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 20 3 0.5]  ,'String','Error:');
s_axial_txt     =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 19.5 3 0.5],'String','K.Ax.:');
s_trans_txt     =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 19 3 0.5]  ,'String','K.Tr.:');
avg_tstep_txt   =uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 18.5 3 0.5],'String','Tstp.:');
voltage_stat_txt=uicontrol(st_panel,'style','text','Units','centimeters','Position',[0.5 18 3 0.5]  ,'String','Volt.:');
    function update_statistics(MSE,avg_tstep)
        set(M_txt,'String',['M: ',num2str(h.obj.M)])
        set(N_txt,'String',['N: ',num2str(h.obj.plate.N)])
        set(voltage_stat_txt,'String',['V: ',num2str(Voltage),' KV'])
        set(error_txt,'String',['Error: ',sprintf('%.2e',MSE)])
        set(s_axial_txt,'String',['K.Ax.: ',sprintf('%.2e',h.obj.plate.k_axial)])
        set(s_trans_txt,'String',['K.Tr.: ',sprintf('%.2e',h.obj.plate.k_trans)])
        set(avg_tstep_txt,'String',['Tstp.: ',sprintf('%.2e',avg_tstep)])
    end
%% Main
%old_value=get(h.stop_btn,'Value');
%% Misc Functions
%     function recreate_comsol_model_and_get_real_data()
%         h.obj.start_comsol_model();
%         h.obj.retrieve_real_final_position();
%     end
    function define_new_Param_Estimator(sht_dms,N,M,base_l)
        h.obj=Param_Estimator(sht_dms,N,'Steel AISI 4340',base_l);
        h.obj.M=M;%
        h.obj.update_model();
        h.obj.retrieve_real_final_position();
    end
    function plot_results()
        disp(h.obj.plate.k_trans_vec(1))
        
        %subplot(3,1,1)
        axes(h.pax11); %set the current axes to axes2
        %h.pax11 = pax11;
        %h.pax21 = pax21;
        %h.pax31 = pax31;
        hold off
        real_p_plot=plot(h.obj.real_x_tp,h.obj.real_y_tp,'r-x')
        hold on
        sim_p_plot=plot(h.obj.plate.p(1,:),(h.obj.plate.p(2,:)),'b-o')
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
    function dt=check_for_new_contact()
        
        h.obj.plate.p(2,contact_ix+1)>=0
        dt=0;
        if Voltage>0 %Only matters if electrostatics are active
            new_contact=min(find(h.obj.plate.p(2,:)>0));
            if new_contact>contact_ix
                % New contact point
                
                
                
            end
        end
    end

    function update_ES_Estimator()
        
    end

    function estimate_electrical_forces()
        %% We assume that the model already exists
        
    end

end
