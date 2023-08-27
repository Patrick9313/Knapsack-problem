clear
clc
popsize=100;                            	
%��Ⱥ��С
chromlength=16;                     		
%�ַ�������(���峤��)
pc=0.6;                                    	
%������ʣ�ֻ���������С��pcʱ���Ż��������
pm=0.01;                               	
%�������
global volume;
volume=[7 4 8 11 19 5 3 9 16 7 8 5 4 4 3 12]';
%��Ʒ���
global weight;
weight=[12 7 9 6 7 8 5 6 18 2 3 6 2 9 5 4]';
%��Ʒ����
global price;
price=[9 8 7 8 18 7 3 10 18 4 4 12 3 5 4 6]';
%��Ʒ��ֵ
pop=initpop(popsize,chromlength);	
%���������ʼȺ��
for i=1:50                                                        	
%50Ϊ�Ŵ�����
		
        [fitvalue,poptemp1]=calfitvalue(pop);
        %������Ⱥ�и���Ŀ�꺯��ֵ����Ӧ��ֵ
		
        [newpop]=selection(poptemp1,fitvalue);
		%ѡ��    
        [newpop1]=crossover(newpop,pc); 
		%����
        [newpop2]=mutation(newpop1,pc);
		%����   

        [fitvalue,poptemp2]=calfitvalue(newpop2);              
		%������Ⱥ�и���Ŀ�꺯��ֵ����Ӧ��ֵ 

        [bestindividual,bestfit]=best(poptemp2,fitvalue);
		%���Ⱥ������Ӧ��ֵ���ĸ��弰����Ӧ��ֵ
        
        fitvaluemean=mean(fitvalue);
        y1=fitvaluemean;
        y2=bestfit;
 
        plot(i,y1,'r*',i,y2,'g*');
        hold on
        title('���������Ŵ��㷨���');
        xlabel('��������');
        ylabel('Ŀ��ֵ');
        legend('ƽ����Ӧ��','�����Ӧ��','location','best');
        pop=poptemp2;
        %������Ⱥ
end

[z,index]=max(fitvalue);
bestprice=z
bestscheme=bestindividual


