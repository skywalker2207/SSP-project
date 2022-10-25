function [pit,amp_tilt,dur_tilt,differ,voiced_dur,log_energy] = freq(y,fs,vop)
 pit = zeros(length(vop)-1,1);
 idxs = zeros(length(vop)-1,1);
 differ = zeros(length(vop)-1,1);
 amp_tilt = zeros(length(vop)-1,1);
 dur_tilt= zeros(length(vop)-1,1);
 voiced_dur = zeros(length(vop)-1,1);
 log_energy = zeros(length(vop)-1,1);
 winLength = round(0.052*fs);
 overlapLength = round(0.045*fs);

for i=1:length(vop)-1
    subarr = y(vop(i):vop(i+1));
    count=0;
    [temp_pitch,idx] = pitch(subarr,fs,Method="SRH",WindowLength=winLength,OverlapLength=overlapLength);
    %max = 0;
     peak_val=0;
     peak_dur=0;
    n=length(idx);
    pk = mean(temp_pitch);

     for j=1:n
         if peak_val<temp_pitch(j)
             peak_val = (temp_pitch(j));
             peak_dur =  (idx(j))/fs;
         end 
     end
    Ar = pk-temp_pitch(1);
    Af = pk-temp_pitch(n);
    Dr = (peak_dur-idx(1))/fs;
    Df = (idx(n) - peak_dur)/fs;

    differ(i) = peak_val-temp_pitch(1);

    pit(i) = pk;
    idxs(i)=peak_dur;
    amp_tilt(i) = (Ar-Af)/(Ar+Af);
    if amp_tilt(i)>1000 
        amp_tilt(i)=1;
    end
     if amp_tilt(i)<-1000 
        amp_tilt(i)=-1;
    end
    
    dur_tilt(i) = (Dr-Df)/(Dr+Df);
     if dur_tilt(i)>1000 
        dur_tilt(i)=1;
    end
     if dur_tilt(i)<-1000 
        dur_tilt(i)=-1;
     end
     
    for j =1:length(subarr)
        if subarr(i) ~= 0
            count = count+1;
        end
    end

    voiced_dur(i) = count/fs;
    sig=subarr.*subarr;
    E=mean(sig);
    log_energy(i) = log10(E);

end


end

