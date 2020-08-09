
function start_comsol_model(obj)
%% Connect to COMSOL
try
    mphstart
catch exception_caught
    msgText=getReport(exception_caught);
    if ~contains(msgText,'Already connected to a server')
        error('Unexpected when trying to connect to COMSOL server')
    end
end
obj.model=obj.create_model(obj.og_p,obj.width,obj.M,obj.N);
end