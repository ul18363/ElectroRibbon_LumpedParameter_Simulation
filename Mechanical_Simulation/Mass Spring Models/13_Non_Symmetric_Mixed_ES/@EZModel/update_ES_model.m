function ME=update_ES_model(obj,source)
% Obtain contact index
% contact_ix=obj.mechanical_model.contact_ix;
ME=0;
if isequal(source,'SKIP')
    return
end
%%
% Obtain contact point

 contact_ix=obj.mechanical_model.contact_ix;
 top_p=obj.mechanical_model.top_plate.p(:,contact_ix:end)';
 btm_p=obj.mechanical_model.bottom_plate.p(:,contact_ix:end)';
% Obtain Bezier points
top_b_points= BezierEstimator.obtain_qubic_bezier_points(top_p);
btm_b_points= BezierEstimator.obtain_qubic_bezier_points(btm_p);

voltage=obj.voltage;
obj.electrostatic_model.voltage=voltage;
% Apply tangent angle correction
apply_angle_corrections=true;
if apply_angle_corrections
    top_b_points(2,2)=top_b_points(1,2);% Horizontal orientation of left end
    top_b_points(3,2)=top_b_points(4,2);% Horizontal orientation of Right end
    
    btm_b_points(2,2)=btm_b_points(1,2);% Horizontal orientation of left end
    btm_b_points(3,2)=btm_b_points(4,2);% Horizontal orientation of Right end
end
%%
% SELECT model to update
switch source
    case 'COMSOL'
        %%
        %         lims=[ 1e-6 1e-5 1e-4 1e-3 1e-2 1];
        %         stepsize=[1e-8 1e-7 1e-6 1e-4 1e-3 1e-2];
        %         t=BezierEstimator.parameter_by_stepsize_and_limits(lims,stepsize);
        HD=-10;
        update_succesfull=false;
        
        while ~update_succesfull
            HD=HD+1;
            if HD ==0
                error('Geometry updating was unsuccesfull')
            end
            t=10.^(HD:0.02:0);
            
            t=[0 t];
            top_points= BezierEstimator.bezierInterp2(top_b_points',t);
            bottom_points= BezierEstimator.bezierInterp2(btm_b_points',t);
            
            try
                if isempty(obj.electrostatic_model.comsol_EZ_model)
                    obj.electrostatic_model.add_comsol_model(bottom_points',top_points')
                else
                    obj.electrostatic_model.update_comsol_model(bottom_points',top_points')
                end
                update_succesfull=true;
            catch ME
                %             return
                if isequal(ME.stack(1).name,'generate_geometry') || isequal(ME.stack(1).name,'update_geometry_private')
                    %Geometry error probably definition is too high
                    disp(['Fail to generate model: HD=',num2str(HD), ', now trying:',num2str(HD+1)]);
                else
                   rethrow(ME) 
                end
            end
        end
    case 'Analytical'
        
    
end

%%
% plot(top_points(1,:),top_points(2,:),'r-x')
% hold on
% grid on
% plot(bottom_points(1,:),bottom_points(2,:),'b-x')
% plot(obj.mechanical_model.top_plate.p(1,:),obj.mechanical_model.top_plate.p(2,:),'k-o')
% plot(obj.mechanical_model.bottom_plate.p(1,:),obj.mechanical_model.bottom_plate.p(2,:),'k-o')

end