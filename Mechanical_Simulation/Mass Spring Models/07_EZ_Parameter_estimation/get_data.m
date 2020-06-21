function data=get_data(model,tag)
    data= model.result().numerical(tag).getData();
end