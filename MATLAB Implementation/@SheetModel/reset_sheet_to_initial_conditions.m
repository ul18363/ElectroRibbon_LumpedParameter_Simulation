function reset_sheet_to_initial_conditions(obj)
obj.p=obj.po;
obj.dp=obj.dpo;
obj.a=zeros(size(obj.a));
obj.v=zeros(size(obj.v));
end
