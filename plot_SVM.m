function out = plot_SVM(name,SLFS,loader)
load(loader);
model = train(:,SLFS(3,2:end-1)+1);
sample = valid(:,SLFS(3,2:end-1)+1);
% SVMstruct = svmtrain(model,train_label,'Kernel_Function','rbf');
% newClasses = svmclassify(SVMstruct,sample);
% acc = sum(valid_label == newClasses)./size(valid,1);
% ACC_SVM = [ACC_SVM acc];
% SVMstruct = svmtrain(model,train_label);
% newClasses = svmclassify(SVMstruct,sample);
% acc = sum(valid_label == newClasses)./size(valid,1);
% ACC_SVM = [ACC_SVM acc];
SVMstruct = svmtrain(train_label, model, '-c 1 -g 0.07 -b 1');
[predict_label, acc, prob_estimates] = svmpredict(valid_label, sample, SVMstruct, '-b 1');
ACC_SVM = [ACC_SVM acc];

out = ACC_SVM;
end