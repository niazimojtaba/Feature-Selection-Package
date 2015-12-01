function run_package(Dataset,train,valid,train_label,valid_label)

% Dataset = ['Dexter'];
% train = load('./../Datasets/Dexter/dexter_train_.data');
% valid = load('./../Datasets/Dexter/dexter_valid_.data');
% train_label = load('./../Datasets/Dexter/dexter_train.labels');
% valid_label = load('./../Datasets/Dexter/dexter_valid.labels');
% 
Algorithm = ['FAST_OSFS' ,'alpha_investing', 'fsMRMR' ,'fsChiSquare' ];
train_label(find(train_label == -1)) = max(train_label)+1;
valid_label(find(valid_label == -1)) = max(train_label)+1;
train_label(find(train_label == 0)) = max(train_label)+1;
valid_label(find(valid_label == 0)) = max(train_label)+1;

Etime = [];
ACC = [];
COMPACTNESS = [];
ACC_Naive = [];
% t = cputime;
% BCF=OSFS(train,train_label);
% e = cputime-t;
% model=train(:,BCF);
% sample=valid(:,BCF);
% y_est=knnclassify(sample,model,train_label,3,'cityblock');
% accuracy=sum(y_est == valid_label)/(size(valid_label,1));
% compactness=length(BCF);
% COMPACTNESS = [COMPACTNESS compactness];
% ACC = [ACC accuracy];
% Etime = [Etime e];
t = cputime;
disp('fsMRMR ... ');
OUT=fsMRMR(train,train_label);
disp('finished OSFS ... ');
BCF = OUT.fList';
BCF_fsMRMR = BCF;
e = cputime-t;
model=train(:,BCF);
sample=valid(:,BCF);
y_est=knnclassify(sample,model,train_label,3,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,5,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,7,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
compactness=length(BCF);
COMPACTNESS = [COMPACTNESS compactness];
aa = NaiveBayes.fit(model,train_label,'mn');
bb = aa.predict(sample);
accuracy=sum(bb == valid_label)/(size(valid_label,1));
ACC_Naive = [ACC_Naive accuracy];
Etime = [Etime e];



t = cputime;
disp('fast OSFS ... ');
BCF=fastOSFS(train,train_label);
BCF_OSFS = BCF;
disp('finished fast OSFS ... ');
e = cputime-t;
model=train(:,BCF);
sample=valid(:,BCF);
y_est=knnclassify(sample,model,train_label,3,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,5,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,7,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
compactness=length(BCF);
COMPACTNESS = [COMPACTNESS compactness];
aa = NaiveBayes.fit(model,train_label,'mn');
bb = aa.predict(sample);
accuracy=sum(bb == valid_label)/(size(valid_label,1));
ACC_Naive = [ACC_Naive accuracy];
Etime = [Etime e];

t = cputime;
disp('alpha investing ... ');
BCF=alpha_investing(train,train_label);
BCF_alpha = BCF;
disp('finished fast OSFS ... ');
e = cputime-t;
model=train(:,BCF);
sample=valid(:,BCF);
y_est=knnclassify(sample,model,train_label,3,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,5,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,7,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
compactness=length(BCF);
aa = NaiveBayes.fit(model,train_label,'mn');
bb = aa.predict(sample);
accuracy=sum(bb == valid_label)/(size(valid_label,1));
ACC_Naive = [ACC_Naive accuracy];
COMPACTNESS = [COMPACTNESS compactness];
Etime = [Etime e];


t = cputime;
disp('chi Square ... ');
Out=fsChiSquare(train,train_label);
disp('finished ChiSquare ... ');
BCF = Out.fList';
BCFChiSquare = BCF;
e = cputime-t;
model=train(:,BCF);
sample=valid(:,BCF);
y_est=knnclassify(sample,model,train_label,3,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,5,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
y_est=knnclassify(sample,model,train_label,7,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC = [ACC accuracy];
compactness=size(BCF,2);
aa = NaiveBayes.fit(model,train_label,'mn');
bb = aa.predict(sample);
accuracy=sum(bb == valid_label)/(size(valid_label,1));
ACC_Naive = [ACC_Naive accuracy];
COMPACTNESS = [COMPACTNESS compactness];
Etime = [Etime e];

save(sprintf('%s.mat',Dataset));

end