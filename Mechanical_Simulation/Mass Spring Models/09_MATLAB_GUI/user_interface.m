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

scale_axial=scale;
scale_trans=scale;
h.obj.plate.k_axial=og_k_axial*scale_axial;
h.obj.plate.GA=og_GA*scale_trans;

%old_p=obj.plate.p;

t_refresh=10^-2;
T_Sim=0;
last_refresh=T_Sim;
% SIMULATION
    function do_sim_timestep(dt)
        T_Sim=T_Sim+dt;
        h.obj.calculate_all_forces();
        h.obj.perform_timestep(dt);
    end

    function plot_results()
        
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
h.axes=axes(h.fgh,... %One can't plot in panels for some reason
    'Units','centimeters' ,'Position',[11.5 7 17 17]);
%% Create Statistics Panel
st_panel=uipanel(h.fgh,'Title','Statistics',...
    'Units','centimeters' ,'Position',[30 0 5 26]);

uicontrol(st_panel,'style','text','Units','centimeters' ,...
    'Position',[0.5 20 2 1],'String','Error:');

    function update_statistics()
        
    end
%% Main
%old_value=get(h.stop_btn,'Value');
drawnow;
tic
%refreshT=0.1;
while 1
    if toc>0.1 % Using drawnow constantly makes loop super slow.
        tic
        drawnow;
        update_statistics()
    end
    
    if get(h.stop_btn,'Value')
        do_sim_timestep(dt)
        %entered=entered+1;
        %disp(T_Sim)
        %plot([1,2],[3,4])
        if T_Sim> last_refresh+t_refresh % If is time to refresh the picture
            last_refresh=T_Sim;
            plot_results()
        end

    end
end

end
