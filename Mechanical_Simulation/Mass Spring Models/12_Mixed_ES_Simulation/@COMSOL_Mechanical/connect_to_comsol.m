
function connect_to_comsol(obj)
%% Connect to COMSOL
try
    mphstart
catch exception_caught
    msgText=getReport(exception_caught);
    if ~contains(msgText,'Already connected to a server')
        error('Unexpected when trying to connect to COMSOL server')
    end
end
end