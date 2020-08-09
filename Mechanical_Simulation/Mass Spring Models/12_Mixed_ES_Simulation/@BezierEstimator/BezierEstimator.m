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
            [p0mat,p1mat,p2mat,p3mat,~]=BezierEstimator.bzapproxu(P,20,[1;length(P)]);
            param_points=[p0mat;p1mat;p2mat;p3mat];
        end
        
        function interpolated_points=interpolate_qubic_bezier_points(param_points,num_points)
            interpolated_points=BezierEstimator.BezierInterpCPMatSegVec(param_points(1,:),param_points(2,:),param_points(3,:),param_points(4,:),[1; num_points]);
        end
        
        function points=interp_by_t(param_points,t)
            points=BezierEstimator.bezierInterp( param_points(1,:),param_points(2,:),param_points(3,:),param_points(4,:),t);  
        end
        function plot_visualize_estimation(P,num_points)
            param_points=BezierEstimator.obtain_qubic_bezier_points(P);
            interpolated_points=BezierEstimator.interpolate_qubic_bezier_points(param_points,num_points);
            
            figure
            plot(P(:,1),P(:,2),'b-x')
            hold on
            plot(interpolated_points(:,1),interpolated_points(:,2),'r.')
            legend({'Real','Approximation'})
            title('Approximation of curve')
        end
        
        function fancy_plot(P,n)
           [p0mat,p1mat,p2mat,p3mat,~]=BezierEstimator.bzapproxu(P,20,[1;length(P)]);
           interpolated_points=BezierEstimator.BezierInterpCPMatSegVec(p0mat,p1mat,p2mat,p3mat,[1; n]);
           BezierEstimator.plot2d_bz_org_intrp_cp(P,interpolated_points,p0mat,p1mat,p2mat,p3mat) 
        end
    end
    methods(Static=true,Access=public)%private
        [Cb,t] = bezier_variable_scope_interp(b_points,precision_range)
        [p0mat,p1mat,p2mat,p3mat,fbi,MxSqD]=bzapproxu(Mat,varargin);
        ans=isvec(x);
        vout=getcolvector(vin);
        [sqDistAry,indexAryGlobal]=MaxSqDistAndInd4EachSegbw2Mat(mat1,mat2,segIndex);
        [squaredmax,rowIndex]=MaxSqDistAndRowIndexbw2Mat(mat1,mat2);
        plot2d_bz_org_intrp_cp(Mat,MatI,p0mat,p1mat,p2mat,p3mat);
        [p0mat,p1mat,p2mat,p3mat,tout]=FindBzCP4AllSeg(Mat,SegIndexIn,varargin);
        [P0, P1, P2, P3, tout]= FindBezierControlPointsND(p,varargin);
        [t]=ChordLengthNormND(p);
        [MatGlobalInterp]=BezierInterpCPMatSegVec(p0mat,p1mat,p2mat,p3mat,NVec,varargin);
        Q=bezierInterp(P0,P1,P2,P3,varargin);
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end
