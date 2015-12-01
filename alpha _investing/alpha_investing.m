function BCF=alpha_investing(train,train_y)
w=0.5;
alpha_delta=0.5;
BCF=[];
j=1;
error_model=4;
while size(BCF,2)<1
    new_feature=train(:,j);
    alpha=w/(2*j);
    sample=train(:,j);
    y_est=knnclassify(sample,new_feature,train_y,10,'cityblock');
    error_new_model=sqrt(mean((train_y-y_est).^2));
    
    sigma_2=error_model/size(train,1);
    p_value=exp((error_new_model-error_model)/(2*sigma_2));
    
    
    %sigma_2=error_new_model/size(train,1);
    %p_value=exp(-1*error_new_model/(2*sigma_2));
    if(p_value<=alpha)
        BCF=j;
        w=w+alpha_delta-alpha;
    else
        w=w-alpha;
    end
    j=j+1;
end

for i=j:size(train,2)
    i
    size(BCF,2)
    new_feature=train(:,i);
    alpha=w/(2*i);
    model=train(:,BCF);
    new_model=[model,new_feature];
    sample=train(:,BCF);
    y_est=knnclassify(sample,model,train_y,3,'cityblock');
    sample=[sample,train(:,i)];
    new_y_est=knnclassify(sample,new_model,train_y,3,'cityblock');
    error_new_model=sqrt(mean((train_y-new_y_est).^2));
    error_model=sqrt(mean((train_y-y_est).^2));
    sigma_2=error_model/size(train,1);
    p_value=exp((error_new_model-error_model)/(2*sigma_2));
    if(p_value<=alpha)
        BCF=[BCF,i];
        w=w+alpha_delta-alpha;
    else
        w=w-alpha;
    end
end
end