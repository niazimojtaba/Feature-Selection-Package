clear all;
ACC = [];
madelon = textread('./res_SLFS/Madelon.txt');
ACC_SVM = plot_SVM('Madelon',madelon,'Madelon.mat');
ACC = [ACC ; ACC_SVM(1,:)];

% dorothea = textread('./res_SLFS/dorothea.txt');
% ACC_SVM = plot_SVM('Dorothea',dorothea,'Dorothea.mat');
% ACC = [ACC ; ACC_SVM];


isolet = textread('./res_SLFS/Isolet.txt');
ACC_SVM = plot_SVM('Isolet',isolet,'Isolet.mat');
ACC = [ACC ; ACC_SVM(1,:)];
 
arcene = textread('./res_SLFS/ARCENE.txt');
ACC_SVM = plot_SVM('ARCENE',arcene,'ARCENE.mat');
ACC = [ACC ; ACC_SVM(1,:)];

voting = textread('./res_SLFS/voting.txt');
ACC_SVM = plot_SVM('Voting',voting,'Voting.mat');
ACC = [ACC ; ACC_SVM(1,:)];

breast = textread('./res_SLFS/breast.txt');
ACC_SVM = plot_SVM('Breast_cancer',breast,'Breast_cancer.mat');
ACC = [ACC ; ACC_SVM(1,:)];

dexter = textread('./res_SLFS/dexter.txt');
ACC_SVM = plot_SVM('Dexter',dexter,'Dexter.mat');
ACC = [ACC ; ACC_SVM(1,:)];

label = [];
name = 'SVM PLot';
% fsmrmr
fig1 = figure();
label = [label 'ARCENE'];
x = [1:6];
y = ACC(:,1);
plot(x,y,'d--k');
hold on
% fast osfs
x = [1:6];
y = ACC(:,2);
plot(x,y,'*--b');
% alpha investing
x = [1:6];
y = ACC(:,3);
plot(x,y,'.--g');
% chi square
x = [1:6];
y = ACC(:,4);
plot(x,y,'^--m');

x = [1:6];
y = ACC(:,7);
plot(x,y,'--rs');

xlabel('Datasets')
ylabel('Accuracy')
set(gca,'XTick',1:6)
set(gca,'XTickLabel',{'Madelon', 'Isolet' , 'ARCENE' , 'Voting' , 'BreastCancer','Dexter'});
% 'Location','SouthEastOutside'
legend('MRMR' ,'fast OSFS' , 'alpha investing', 'Chi Square' , 'SLFS',4);
saveas(fig1,sprintf('./Figures/%s.eps',name),'epsc');
saveas(fig1,sprintf('./Figures/%s.fig',name),'fig');
close(fig1);