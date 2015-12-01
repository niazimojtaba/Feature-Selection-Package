%mojtaba
% clear all
% close all
% disp('Voting running ...');
% Dataset = ['Voting'];
% train = load('./../Datasets/voting/train_voting.data');
% valid = load('./../Datasets/voting/valid_voting.data');
% train_label = load('./../Datasets/voting/train_voting.label');
% valid_label = load('./../Datasets/voting/valid_voting.label');
% crossover(Dataset,train,valid,train_label,valid_label);
% disp('Voting Done ...');
% 
% clear all
% close all
% disp('breast cancer running ...');
% Dataset = ['Breast_cancer'];
% train = load('./../Datasets/breast-cancer/breast.csv');
% valid = load('./../Datasets/breast-cancer/breas.test.csv');
% train_label = load('./../Datasets/breast-cancer/breast.label');
% valid_label = load('./../Datasets/breast-cancer/breast.test.label');
% crossover(Dataset,train,valid,train_label,valid_label);
% disp('breast cancer Done ...');
% 
% clear all
% close all
% disp('ARCENE runing ...');
% Dataset = ['ARCENE'];
% train = load('./../Datasets/ARCENE/ARCENE/arcene_train.data');
% valid = load('./../Datasets/ARCENE/ARCENE/arcene_valid.data');
% train_label = load('./../Datasets/ARCENE/ARCENE/arcene_train.labels');
% valid_label = load('./../Datasets/ARCENE/arcene_valid_labels.txt');
% crossover(Dataset,train,valid,train_label,valid_label);
% disp('ARCENE Done ...');
% 
% clear all
% close all
% disp('Isolet Running ...');
% Dataset = ['Isolet'];
% train = load('./../Datasets/isolet/train_Isolate.data');
% valid = load('./../Datasets/isolet/valid_Isolate.data');
% train_label = load('./../Datasets/isolet/train_Isolate.label');
% valid_label = load('./../Datasets/isolet/valid_Isolate.label');
% crossover(Dataset,train,valid,train_label,valid_label);
% disp('Isolet Done ...');
% % 
% clear all
% close all
% disp('Madelon running ...');
% Dataset = ['Madelon'];
% train = load('./../Datasets/Madelon/train_Madelon.data');
% valid = load('./../Datasets/Madelon/valid_Madelon.data');
% train_label = load('./../Datasets/Madelon/train_label');
% valid_label = load('./../Datasets/Madelon/valid_label');
% crossover(Dataset,train,valid,train_label,valid_label);
% disp('Madelon Done ...');
% 
% Dataset = ['Dexter'];
% train = load('./../Datasets/Dexter/dexter_train.data');
% valid = load('./../Datasets/Dexter/dexter_valid.data');
% train_label = load('./../Datasets/Dexter/dexter_train.labels');
% valid_label = load('./../Datasets/Dexter/dexter_valid.labels');
% disp('Dexter running ...');
% crossover(Dataset,train,valid,train_label,valid_label);
% disp('Dexter Done ...');

clear all
close all
disp('Dorothea running ...');
Dataset = ['Dorothea'];
train = load('./../Datasets/Dorothea/dorothea_train.data');
valid = load('./../Datasets/Dorothea/dorothea_valid.data');
train_label = load('./../Datasets/Dorothea/dorothea_train.labels');
valid_label = load('./../Datasets/Dorothea/dorothea_valid.labels');
crossover(Dataset,train,valid,train_label,valid_label);
disp('Dorothea Done ...');

