ht = uicontrol('style','edit','Position',[10,60,40,40]);
hs = uicontrol('style','slider','Position',[10,10,400,20]);

fun_write_to_box = @(~,e)set(ht,'String',num2str(get(e.AffectedObject,'Value')));
fun_set_value= @(~,e)set(hs,'Value',str2double(get(e.AffectedObject,'Value')));

addlistener(hs, 'Value', 'PostSet',fun_write_to_box);

addlistener(ht, 'Value', 'PostSet',fun_set_value);