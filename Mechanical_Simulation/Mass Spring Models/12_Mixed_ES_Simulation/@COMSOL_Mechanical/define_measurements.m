function create_measurements(~,model)
%     model.result().numerical().create("charges", "Global");
%     model.result().numerical("charges").set("expr", {'esbe.Q0_1' 'esbe.Q0_2' '(esbe.Q0_1+esbe.Q0_2)/esbe.Q0_1'}); 
    
    model.result().numerical().create('displacements',"Eval");
    model.result().numerical('displacements').selection.named('sel1');% Top plate selection
    model.result().numerical('displacements').set('expr', {'u' 'v' 'x' 'y'});

%     model.result().numerical().create('btmuntx',"Eval");
%     model.result().numerical('btmuntx').selection.named('sel1');% Top plate selection
%     model.result().numerical('btmuntx').set('expr', {'esbe.unTx' 'esbe.unTy' 'x' 'y'});

end