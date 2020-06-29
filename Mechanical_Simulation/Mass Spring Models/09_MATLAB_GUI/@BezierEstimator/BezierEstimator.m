classdef BezierEstimator < handle
    properties
    end
    
    methods
    end
    methods(Static)
        function p = duplicate(tol)
            p=2*tol;
        end
        function param_points=obtain_qubic_bezier_points(P)
            %ibi=[1;length(P)]; %Third argument. Manually set indexes of
            %edge points of bezier curves. based on real geometry "P".
            %MxAllowSqD=20;% Second argument. (Maximum Square error allowed, if exceeded additional edge points are ) 
            [p0mat,p1mat,p2mat,p3mat,~]=bzapproxu(P,20,ibi);
            param_points=[p0mat,p1mat,p2mat,p3mat];
        end
        
        function interpolated_points=interpolate_qubic_bezier_points(param_points,num_points)
            
            interpolated_points=BezierInterpCPMatSegVec(param_points(1,:),param_points(2,:),param_points(3,:),param_points(4,:),[1; num_points]);
        end
    end
    
end