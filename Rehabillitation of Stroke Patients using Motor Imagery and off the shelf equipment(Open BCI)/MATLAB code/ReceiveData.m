addpath(genpath('/home/ibagon/OpenBCI/OpenBCI_MATLAB/Matlab-Python/labstreaminglayer'))
%% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});
[vec,ts] = inlet.pull_sample();
start = ts;
eeg_record = [];
while ts - start < 120
    [vec,ts] = inlet.pull_sample();
    eeg_record = [eeg_record;vec];
%     if(mod(length(eeg_record(:,4)),250)==0 && mod(length(eeg_record(:,7)),250)==0);
%        d=eeg_record(:,4);
%        d=transpose(d);
%        e=eeg_record(:,7);
%        e=transpose(e);
%        y1=filter(B,A,d);
%        Buffer1=[Buffer1 y1];
%        y2=filter(B,A,e);
%        Buffer2=[Buffer2 y2];
%        subplot(2,1,1);
%        plot(d);
%        title('Filtered EMG signal')
%        drawnow
%        subplot(2,1,2);
%        plot(e);  
%        title('Filtered EEG signal')
%        drawnow
%     end
    fprintf('%.2f\t',vec);
    fprintf('%.5f\n',ts);
end

