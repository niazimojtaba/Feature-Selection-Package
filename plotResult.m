clear all;
madelon = textread('./res_SLFS/Madelon.txt');
plot_('Madelon',madelon,'Madelon.mat');

% clear all;
% dorothea = textread('./res_SLFS/dorothea.txt');
% plot_('Dorothea',dorothea,'Dorothea.mat');
%  
clear all;
isolet = textread('./res_SLFS/Isolet.txt');
plot_('Isolet',isolet,'Isolet.mat');
 
clear all
arcene = textread('./res_SLFS/ARCENE.txt');
plot_('ARCENE',arcene,'ARCENE.mat');

clear all;
voting = textread('./res_SLFS/voting.txt');
plot_('Voting',voting,'Voting.mat');

clear all;
breast = textread('./res_SLFS/breast.txt');
plot_('Breast_cancer',breast,'Breast_cancer.mat');

clear all;
dexter = textread('./res_SLFS/dexter.txt');
plot_('Dexter',dexter,'Dexter.mat');


% BCF = madelon(3,2:end-1);
% ACC_SLFS = [];
% COMPACTNESS_SLFS = [];
% model=train(:,BCF);
% sample=valid(:,BCF);
% y_est=knnclassify(sample,model,train_label,3,'cityblock');
% accuracy=sum(y_est == valid_label)/(size(valid_label,1));
% ACC_SLFS = [ACC_SLFS accuracy];
% y_est=knnclassify(sample,model,train_label,5,'cityblock');
% accuracy=sum(y_est == valid_label)/(size(valid_label,1));
% ACC_SLFS = [ACC_SLFS accuracy];
% y_est=knnclassify(sample,model,train_label,7,'cityblock');
% accuracy=sum(y_est == valid_label)/(size(valid_label,1));
% ACC_SLFS = [ACC_SLFS accuracy];
% compactness=length(BCF);
% COMPACTNESS_SLFS = [COMPACTNESS_SLFS compactness];
% fig1 = figure(1);
% p1 = plot(X,ACC_SLFS,'--rs');
% set(p1,'LineWidth',2);
% text(X(2),ACC_SLFS(2),sprintf('compactness=%d',compactness),'HorizontalAlignment','left');
% hold on;
% p1 = plot(X,[madelon(1,1),madelon(1,1),madelon(1,1)],'--bo');
% set(p1,'LineWidth',2);
% text(X(2),madelon(1,1),sprintf('compactness=%d',compactness),'HorizontalAlignment','left');
% % osfs
% plot(X,ACC(1:3),'*--c');
% text(X(2),ACC(2),sprintf('compactness=%d',COMPACTNESS(1)),'HorizontalAlignment','left');
% % alpha investing
% plot(X,ACC(4:6),'.--g');
% text(X(1),ACC(4),sprintf('compactness=%d',COMPACTNESS(2)),'HorizontalAlignment','left');
% % mrmr
% plot(X,ACC(7:9),'d--k');
% text(X(2),ACC(8),sprintf('compactness=%d',COMPACTNESS(3)),'HorizontalAlignment','left');
% % chi square
% plot(X,ACC(10:12),'^--m');
% text(X(2),ACC(11),sprintf('compactness=%d',COMPACTNESS(4)),'HorizontalAlignment','left');
% hold off;
% set(gca,'XTick',3:2:7)
% set(gca,'XTickLabel',{'k = 3', 'k = 5' , 'k = 7'});
% xlabel('k')
% ylabel('Accuracy')
% text(X(2),ACC_SLFS(2),sprintf('compactness=%d',compactness),'HorizontalAlignment','left');
% legend('SLFS KNN' ,'SLFS Bayesian network' ,  'fast OSFS' , 'alpha investing' , 'MRMR' , 'Chi Square','Location','SouthEastOutside');
% saveas(fig1,'./Figures/Madelon.eps','epsc');
% saveas(fig1,'./Figures/Madelon.fig','fig');
% close(fig1);
% 
