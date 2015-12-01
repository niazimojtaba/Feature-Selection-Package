function [yeap,res] = Dep(C,X,S,b,train_label,train,state)
    khi_abc = 0;
    khi_ac = 0;
    khi_bc = 0;
    khii = 0;
    S = [S b];
    inx_val = ones(1,size(S,2)+1);
    col = size(S,2)+1;
    inx_val(col) = 0;
    while(inx_val(1) <= size(C.value,1))
        inx_val(col) = inx_val(col) + 1;
        inx = col;
        while(inx > 1 && size(X(S(inx-1)).value,1) < inx_val(inx))
            
            inx_val(inx) = 1;
            inx = inx -1;
            inx_val(inx) = inx_val(inx) + 1;
        end
        if(inx == 1 && inx_val(1) > size(C.value,1))
            break;
        end
        train_ = train(train_label(:,1) == C.value(inx_val(1)),:);
        Nij = rec_dep(X,S,train_,inx_val,2);
        khi_abc = Nij;
        if(size(S,2) == 1)
            mu_hat = ((X(b).count(inx_val(size(inx_val,2)))*C.count(inx_val(1)))/size(train,1));
            khii = khii + (((Nij) - mu_hat)^2) / mu_hat;
        else
            if Nij > 5 && state
                yeap = true;
                return ;
            end
%             S(size(S,2)) = [];
%             khi_ac = rec_dep(X,S,train_,inx_val(:,1:size(inx_val,2)-1),2);
%             S = [S,b];
%             khi_bc = size(find(train_label(:,1) == C.value(inx_val(1)) & train(:,b) == X(b).value(inx_val(size(inx_val,2)))),1);
%             khi_loc = khi_abc*log((khi_abc*C.count(inx_val(1)))+1 / ((khi_ac * khi_bc)+(inx_val*inx_val')));
%             khii = khii + khi_loc;
        end
    end
%     end
    res = 2 * khii;
    yeap = false;
end