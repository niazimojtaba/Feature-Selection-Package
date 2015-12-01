function plot_(name,SLFS,loader)
X = [3,5,7];
load(loader);
BCF = SLFS(3,2:end-1)+1;
ACC_SLFS = [];
COMPACTNESS_SLFS = [];
model=train(:,BCF);
sample=valid(:,BCF);
y_est=knnclassify(sample,model,train_label,3,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC_SLFS = [ACC_SLFS accuracy];
y_est=knnclassify(sample,model,train_label,5,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC_SLFS = [ACC_SLFS accuracy];
y_est=knnclassify(sample,model,train_label,7,'cityblock');
accuracy=sum(y_est == valid_label)/(size(valid_label,1));
ACC_SLFS = [ACC_SLFS accuracy];
compactness=length(BCF);
COMPACTNESS_SLFS = [COMPACTNESS_SLFS compactness];
fig1 = figure(1);
p1 = plot(X,ACC_SLFS,'--rs');
set(p1,'LineWidth',2);
text(X(2),ACC_SLFS(2),sprintf('compactness=%d',compactness),'HorizontalAlignment','left');
hold on;
p1 = plot(X,[SLFS(1,1),SLFS(1,1),SLFS(1,1)],'--bo');
set(p1,'LineWidth',2);
text(X(2),SLFS(1,1),sprintf('compactness=%d',compactness),'HorizontalAlignment','left');
% mrmr
plot(X,ACC_KNN(1:3),'*--c');
text(X(2),ACC_KNN(2),sprintf('compactness=%d',COMPACTNESS(1)),'HorizontalAlignment','left');
% osfs
plot(X,ACC_KNN(4:6),'.--g');
text(X(1),ACC_KNN(4),sprintf('compactness=%d',COMPACTNESS(2)),'HorizontalAlignment','left');
% alpha
plot(X,ACC_KNN(7:9),'d--k');
text(X(2),ACC_KNN(8),sprintf('compactness=%d',COMPACTNESS(3)),'HorizontalAlignment','left');
% chi square
plot(X,ACC_KNN(10:12),'^--m');
text(X(2),ACC_KNN(11),sprintf('compactness=%d',COMPACTNESS(4)),'HorizontalAlignment','left');
hold off;
set(gca,'XTick',3:2:7)
set(gca,'XTickLabel',{'k = 3', 'k = 5' , 'k = 7'});
xlabel('k')
ylabel('Accuracy')
text(X(2),ACC_SLFS(2),sprintf('compactness=%d',compactness),'HorizontalAlignment','left');
legend('SLFS KNN' ,'SLFS Bayesian network' ,   'MRMR' ,'fast OSFS' , 'alpha investing' , 'Chi Square','Location','SouthEastOutside');
saveas(fig1,sprintf('./Figures/%s.eps',name),'epsc');
saveas(fig1,sprintf('./Figures/%s.fig',name),'fig');
close(fig1);


end