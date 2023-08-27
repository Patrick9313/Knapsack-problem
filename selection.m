% 选择
% 选择或复制操作是决定哪些个体可以进入下一代。
% 程序中采用赌轮盘选择法选择，这种方法较易实现。

function [newpop]=selection(pop,fitvalue) 
totalfit=sum(fitvalue);                                           
%求适应值之和
fitvalue=fitvalue/totalfit;                                       
%单个个体被选择的概率
fitvalue=cumsum(fitvalue);            
%如 fitvalue=[1 2 3 4]，则 cumsum(fitvalue)=[1 3 6 10]，
%累加，轮盘赌法，依次看是否在转得的区域内 
[px,py]=size(pop);                                                 
%100*16//////////////////////////////////////////px=100
ms=sort(rand(px,1));                                             
%从小到大排列
fitin=1;
newin=1;
while newin<=px                                                  
%选出50个新个体////////////////////////
        if(ms(newin))<fitvalue(fitin)
                newpop(newin,:)=pop(fitin,:);
                newin=newin+1;
        else
                fitin=fitin+1;
        end
end
