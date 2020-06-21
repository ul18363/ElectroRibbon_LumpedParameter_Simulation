function res=extract_results(model,N)
% Run Solver
model.sol('sol1').runAll;

% RetrieveChare Charge data {'esbe.Q0_1' 'esbe.Q0_2' '(esbe.Q0_1+esbe.Q0_2)/esbe.Q0_1'}
% 'esbe.Q0_1' -> Top Plate Charge
% 'esbe.Q0_2' -> Btm Plate Charge

res.data_charge= model.result().numerical('charges').getData();
% Retrieve Top Plate Pressure Data {'esbe.unTx' 'esbe.unTy' 'x' 'y'}
raw_data_tp_unT= model.result().numerical('tpuntx').getData();
res.data_tp_unTx=reshape(raw_data_tp_unT,[4,N*2]);
% Retrieve Top Plate Pressure Data {'esbe.unTx' 'esbe.unTy' 'x' 'y'}
raw_data_btm_unT= model.result().numerical('btmuntx').getData();
res.data_btm_unT=reshape(raw_data_btm_unT,[4,N*2]);

end