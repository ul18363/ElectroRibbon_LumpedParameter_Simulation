function t = parameter_by_stepsize_and_limits(lims,stepsize)
% t = parameter_by_stepsize_and_limits(lims,stepsize)
%
% Returns the paramater vector given a set of limits and stepsizes
% Inputs
% lims - The right limit of the interval
% stepsize - The stepsize of the parameter in the interval
%
%i.e. 
% t = BezierEstimator.parameter_by_stepsize_and_limits([0.1 1],[0.02 0.2]);
% disp(t)
% [0 0.02 0.04 0.06 0.08 0.1 0.3 0.5 0.7 0.9 1]

lims= [0 lims];
intervals{length(stepsize)}=[];

for i =1:length(lims)-1
    intervals{i}=lims(i):stepsize(i):lims(i+1);
end
t=unique(cat(2,intervals{:}));
if t(end)~=1
   t=[t 1]; 
end
    
end
