%����������Ӧֵ
function [fitvalue,poptemp]=calfitvalue(pop)
global price;
global weight;
global volume;          
[px,py]=size(pop);  

%����Ŀ�꺯��ֵ
for i=1:px
    objvalue(i)=pop(i,:)*price;
    convalue(i)=pop(i,:)*weight;
    volvalue(i)=pop(i,:)*volume;   
    
end

%������Ⱥ��Ӧ��ֵ
for i=1:px
        if convalue(i)<=85 & volvalue(i)<=96  %����������86�����������95                
                temp=objvalue(i);          
        else
                temp=0;
        end
        fitvalue(i)=temp;
end

%�����Ÿ������������Լ�������ĸ���
[maxfit,mn]=max(fitvalue);
for i=1:px
    if convalue(i)>85|volvalue(i)>96   %��������85�����������96 
            poptemp(i,:)=pop(mn,:);
            fitvalue(i)=maxfit;
    else
            poptemp(i,:)=pop(i,:);            
    end
end

fitvalue=fitvalue';
