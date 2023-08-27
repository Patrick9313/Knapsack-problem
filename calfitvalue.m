%计算个体的适应值
function [fitvalue,poptemp]=calfitvalue(pop)
global price;
global weight;
global volume;          
[px,py]=size(pop);  

%计算目标函数值
for i=1:px
    objvalue(i)=pop(i,:)*price;
    convalue(i)=pop(i,:)*weight;
    volvalue(i)=pop(i,:)*volume;   
    
end

%计算种群适应度值
for i=1:px
        if convalue(i)<=85 & volvalue(i)<=96  %重量不超过86，体积不超过95                
                temp=objvalue(i);          
        else
                temp=0;
        end
        fitvalue(i)=temp;
end

%用最优个体替代不符合约束条件的个体
[maxfit,mn]=max(fitvalue);
for i=1:px
    if convalue(i)>85|volvalue(i)>96   %重量超过85，或体积超过96 
            poptemp(i,:)=pop(mn,:);
            fitvalue(i)=maxfit;
    else
            poptemp(i,:)=pop(i,:);            
    end
end

fitvalue=fitvalue';
