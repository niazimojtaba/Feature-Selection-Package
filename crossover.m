function out = crossover(Dataset,train,valid,train_label,valid_label)

    data = [train;valid];
    label = [train_label ; valid_label];
    step = size(data,1) / 10;
    inx = randperm(size(data,1));
    data = data(inx,:);
    label = label(inx,:);
    for i = 1 : 9
        
        cTest = data(i*step:(i+1)*step,:);
        cTrain = [data(1:i*step-1,:);data((i+1)*step+1:end,:)];
        cTest_label = label(i*step:(i+1)*step,:);
        cTrain_label = [label(1:i*step-1,:);label((i+1)*step+1:end,:)];
        run_package(strcat(Dataset,num2str(i)),cTrain,cTest,cTrain_label,cTest_label);
    end
        
        
        
end