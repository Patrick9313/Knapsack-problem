%变异
function [newpop]=mutation(pop,pm)
        [px,py]=size(pop);
        newpop=ones(size(pop));
        for i=1:px
                if(rand<pm)
                        mpoint=round(rand*py);     
%产生的变异点在1-16之间
                        if mpoint<=0
                                mpoint=1;                         
%变异位置
                        end
                        newpop(i,:)=pop(i,:);
                        if any(newpop(i,mpoint))==0
                                newpop(i,mpoint)=1;
                        else
                                newpop(i,mpoint)=0;
                        end
                else
                newpop(i,:)=pop(i,:);
        end
end
