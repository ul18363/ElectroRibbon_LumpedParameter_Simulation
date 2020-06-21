function retrieve_real_final_position(obj)
raw_data_tp_unT= obj.model.result().numerical('displacements').getData();
res=reshape(raw_data_tp_unT,[4,obj.N*2]);
obj.real_u=res(1,:);
obj.real_v=res(2,:);
obj.real_x=res(3,:);
obj.real_y=res(4,:);

edges=[(1:obj.N)*2;(1:obj.N)*2-1];
obj.tp_ixs=edges(2,:);
obj.btm_ixs=edges(1,:);
obj.real_p=[obj.real_x;obj.real_y];

obj.real_u_tp=obj.real_u(obj.tp_ixs);
obj.real_v_tp=obj.real_v(obj.tp_ixs);
obj.real_x_tp=obj.real_x(obj.tp_ixs);
obj.real_y_tp=obj.real_y(obj.tp_ixs);
obj.real_p_tp=obj.real_p(:,obj.tp_ixs);

obj.real_u_btm=obj.real_u(obj.btm_ixs);
obj.real_v_btm=obj.real_v(obj.btm_ixs);
obj.real_x_btm=obj.real_x(obj.btm_ixs);
obj.real_y_btm=obj.real_y(obj.btm_ixs);
obj.real_p_btm=obj.real_p(:,obj.btm_ixs);


%og_x=obj.x-obj.u;
%og_y=obj.y-obj.v;
end