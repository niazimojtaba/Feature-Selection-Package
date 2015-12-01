clear all;
ACC = [];
name = 'Naive Bayes Result';
Algorithm = ['fsMRMR' ,'FAST_OSFS' ,'alpha_investing', 'fsChiSquare_10' , 'fsChiSquare_20' , 'fsChiSquare_30' , 'SLFS' ];
madelon = textread('./res_SLFS/Madelon.txt');
load Madelon.mat
ACC = [ACC ;[ACC_Naive madelon(1,1)]];

% dorothea = textread('./res_SLFS/dorothea.txt');
% load Dorothea.mat
% ACC = [ACC ;[ACC_Naive dorothea(1,1)]];
 
isolet = textread('./res_SLFS/Isolet.txt');
load Isolet.mat
ACC = [ACC ;[ACC_Naive isolet(1,1)]];
 
arcene = textread('./res_SLFS/ARCENE.txt');
load ARCENE.mat
ACC = [ACC ;[ACC_Naive arcene(1,1)]];

voting = textread('./res_SLFS/voting.txt');
load Voting.mat
ACC = [ACC ;[ACC_Naive voting(1,1)]];

breast = textread('./res_SLFS/breast.txt');
load Breast_cancer.mat
ACC = [ACC ;[ACC_Naive breast(1,1)]];

dexter = textread('./res_SLFS/dexter.txt');
load Dexter.mat
ACC = [ACC ;[ACC_Naive dexter(1,1)]];

label = [];
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