f_g=h.obj.plate.f_gravity;
f_dir=[ [0;0] h.obj.plate.f_axial_ltr]+[-h.obj.plate.f_axial_ltr, [0;0] ];
%h.obj.plate.f_axial_ltr
f_trans_ltr= [[0;0] h.obj.plate.f_trans_ltr]+[-h.obj.plate.f_trans_ltr [0;0]];
f_trans_rtl= [h.obj.plate.f_trans_rtl,[0;0]]+[[0;0], -h.obj.plate.f_trans_rtl];
f_trans=f_trans_ltr+f_trans_rtl;
f_elastic=f_trans+f_dir;

mask=h.obj.plate.f_mask;
net_F_g=sum(f_g.*mask,2)+h.obj.M*h.obj.g;
net_F_el=sum(f_elastic.*mask,2);
x=h.obj.plate.p(1,:);
%[ [0;0] h.obj.plate.f_trans_ltr]+     [h.obj.plate.f_trans_rtl, [0;0] ] ;