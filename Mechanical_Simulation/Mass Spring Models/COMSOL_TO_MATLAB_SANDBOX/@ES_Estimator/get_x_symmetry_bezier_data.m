function data=get_x_symmetry_bezier_data(obj,attr)
model=obj.model;
numpoints=obj.numpoints;
sel=17;
%data=[];
% if numpoints>1
interpolation_points=BezierEstimator.interp_by_t(obj.bezier_points',linspace(0,1,numpoints)); 
% end

switch attr
    case 'C11'
        data = mpheval(model,{'esbe.C11'},'edim',0).d1(1);
    otherwise
        data = mphinterp(model,attr,'coord',interpolation_points','selection',sel,'edim',1);
end

end