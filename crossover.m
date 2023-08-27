%交叉
function [newpop]=crossover(pop,pc)          %交叉率pc=0.6
[px,py]=size(pop);
newpop=ones(size(pop));
for i=1:2:px-1                                             
%步长为2，是将相邻的两个个体进行交叉
        if(rand<pc)
                cpoint=round(rand*py);
                newpop(i,:)=[pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
                newpop(i+1,:)=[pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
        else
                newpop(i,:)=pop(i,:);
                newpop(i+1,:)=pop(i+1,:);
        end
end