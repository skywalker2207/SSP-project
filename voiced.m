function [dest] = voiced(y)
sig=y.*y;
E=mean(sig);
Threshold=0.05*E;
k=1;
for b=1:100:(length(sig)-100)
    if((sum(sig(b:b+100)))/100 > Threshold)
                  dest(k:k+100)=y(b:b+100);
    else
        dest(k:k+100)= zeros(1,101);
    end
    k = k+100;
end
end