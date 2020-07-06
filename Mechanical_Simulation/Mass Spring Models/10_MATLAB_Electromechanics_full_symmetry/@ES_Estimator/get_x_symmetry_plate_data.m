function data=get_x_symmetry_plate_data(obj,attr,type)
model=obj.model;
sel=7;


switch type
    case 'points'
        data = mpheval(obj.model,attr,'selection',7,'edim',1).d1;
    case 'integral'
        data = mphint2(obj.model,{attr},'line','selection',sel);
end

end