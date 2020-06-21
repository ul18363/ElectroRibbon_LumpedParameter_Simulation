
function define_force_bc(obj,cond,i)
    switch cond
        case 'all_free'
            obj.f_mask=ones(size(obj.p));
        case 'r_fix' % Fix right edge
            obj.f_mask(:,end)=obj.o;
        case 'l_fix' % Fix left edge
            obj.f_mask(:,1)=obj.o;
        case 'i_fix'% Fix the "i"th element
            obj.f_mask(:,i)=obj.o;
        case 'r_fix_y' % Fix right edge y component (slides on x axis)
            obj.f_mask(2,end)=0;
        case 'r_fix_x'% Fix right edge x component (slides on y axis)
            obj.f_mask(1,end)=0;
        case 'l_fix_y' % Fix right edge y component (slides on x axis)
            obj.f_mask(2,1)=0;
        case 'l_fix_x'% Fix right edge x component (slides on y axis)
            obj.f_mask(1,1)=0;
        case 'i_fix_y' % Fix right edge y component (slides on x axis)
            obj.f_mask(2,i)=0;
        case 'i_fix_x'% Fix right edge x component (slides on y axis)
            obj.f_mask(2,i)=0;
    end
end