channel1=eeg_record(:,1);
channel1=transpose(channel1);
channel2=eeg_record(:,2);
channel2=transpose(channel2);
channel3=eeg_record(:,3);
channel3=transpose(channel3);
channel4=eeg_record(:,4);
channel4=transpose(channel4);
channel5=eeg_record(:,5);
channel5=transpose(channel5);
channel6=eeg_record(:,6);
channel6=transpose(channel6);
channel7=eeg_record(:,7);
channel7=transpose(channel7);
channel8=eeg_record(:,8);
channel8=transpose(channel8);

fs = 250;
n=2;
fc1=8;
fc2=30;
Wn=[fc1/(fs/2),fc2/(fs/2)];
[bb,aa]=butter(n,Wn,'bandpass');

n=2;

fc1=49;
fc2=51;
Wn=[fc1/(fs/2),fc2/(fs/2)];
[bb1,aa1]=butter(n,Wn,'stop');

newchannel1=detrend(channel1);
newchannel2=detrend(channel2);
newchannel3=detrend(channel3);
newchannel4=detrend(channel4);
newchannel5=detrend(channel5);
newchannel6=detrend(channel6);
newchannel7=detrend(channel7);
newchannel8=detrend(channel8);

newchannels=vertcat(newchannel1,newchannel2,newchannel3,newchannel4,newchannel5,newchannel6,newchannel7,newchannel8);

filteredchannel1=filtfilt(bb,aa,newchannel1);
filteredchannel2=filtfilt(bb,aa,newchannel2);
filteredchannel3=filtfilt(bb,aa,newchannel3);
filteredchannel4=filtfilt(bb,aa,newchannel4);
filteredchannel5=filtfilt(bb,aa,newchannel5);
filteredchannel6=filtfilt(bb,aa,newchannel6);
filteredchannel7=filtfilt(bb,aa,newchannel7);
filteredchannel8=filtfilt(bb,aa,newchannel8);

filteredchannel1=filtfilt(bb1,aa1,filteredchannel1);
newfilteredchannel1 = (filteredchannel1 - min(filteredchannel1)) / ( max(filteredchannel1) - min(filteredchannel1))
filteredchannel2=filtfilt(bb1,aa1,filteredchannel2);
newfilteredchannel2 = (filteredchannel2 - min(filteredchannel2)) / ( max(filteredchannel2) - min(filteredchannel2))
filteredchannel3=filtfilt(bb1,aa1,filteredchannel3);
newfilteredchannel3 = (filteredchannel3 - min(filteredchannel3)) / ( max(filteredchannel3) - min(filteredchannel3))
filteredchannel4=filtfilt(bb1,aa1,filteredchannel4);
newfilteredchannel4 = (filteredchannel4 - min(filteredchannel4)) / ( max(filteredchannel4) - min(filteredchannel4))
filteredchannel5=filtfilt(bb1,aa1,filteredchannel5);
newfilteredchannel5 = (filteredchannel5 - min(filteredchannel5)) / ( max(filteredchannel5) - min(filteredchannel5))
filteredchannel6=filtfilt(bb1,aa1,filteredchannel6);
newfilteredchannel6 = (filteredchannel6 - min(filteredchannel6)) / ( max(filteredchannel6) - min(filteredchannel6))
filteredchannel7=filtfilt(bb1,aa1,filteredchannel7);
newfilteredchannel7 = (filteredchannel7 - min(filteredchannel7)) / ( max(filteredchannel7) - min(filteredchannel7))
filteredchannel8=filtfilt(bb1,aa1,filteredchannel8);
newfilteredchannel8 = (filteredchannel8 - min(filteredchannel8)) / ( max(filteredchannel8) - min(filteredchannel8))

filteredchannels=vertcat(filteredchannel1,filteredchannel2,filteredchannel3,filteredchannel4,filteredchannel5,filteredchannel6,filteredchannel7,filteredchannel8);;
%%cropping
% filteredchannel2(1:2500)=zeros(1,2500);
% filteredchannel4(1:2500)=zeros(1,2500);
% filteredchannel6(1:2500)=zeros(1,2500);
% filteredchannel8(1:2500)=zeros(1,2500);
% 
% filteredchannel2(7500:7799)=zeros(1,300);
% filteredchannel4(7500:7799)=zeros(1,300);
% filteredchannel6(7500:7799)=zeros(1,300);
% filteredchannel8(7500:7799)=zeros(1,300);
% 
% filteredchannel2(16960:17349)=zeros(1,390);
% filteredchannel4(16960:17349)=zeros(1,390);
% filteredchannel6(16960:17349)=zeros(1,390);
% filteredchannel8(16960:17349)=zeros(1,390);
% 
% filteredchannel2(27580:28299)=zeros(1,720);
% filteredchannel4(27580:28299)=zeros(1,720);
% filteredchannel6(27580:28299)=zeros(1,720);
% filteredchannel8(27580:28299)=zeros(1,720);

%%

% figure;
%4 and 6 are right channels 
% plot(filteredchannel2);
% title('channel 2 after filtering')
% figure;
% plot(filteredchannel4);
% title('channel 4 after filtering')
% figure;
% plot(filteredchannel6);
% title('channel 6 after filtering')
% figure;
% plot(filteredchannel8);
% title('channel 8 after filtering')

%Creating epochs for channel 1

epoch1chann1=filteredchannel1(1:2500);
epoch2chann1=filteredchannel1(2501:5000);
epoch3chann1=filteredchannel1(5001:7500);
epoch4chann1=filteredchannel1(7501:10000);
epoch5chann1=filteredchannel1(10001:12500);
epoch6chann1=filteredchannel1(12501:15000);
epoch7chann1=filteredchannel1(15001:17500);
epoch8chann1=filteredchannel1(17501:20000);
epoch9chann1=filteredchannel1(20001:22500);
epoch10chann1=filteredchannel1(22501:25000);
epoch11chann1=filteredchannel1(25001:27500);
epoch12chann1=filteredchannel1(27501:30000);

%Creating epochs for channel 2

epoch1chann2=filteredchannel2(1:2500);
epoch2chann2=filteredchannel2(2501:5000);
epoch3chann2=filteredchannel2(5001:7500);
epoch4chann2=filteredchannel2(7501:10000);
epoch5chann2=filteredchannel2(10001:12500);
epoch6chann2=filteredchannel2(12501:15000);
epoch7chann2=filteredchannel2(15001:17500);
epoch8chann2=filteredchannel2(17501:20000);
epoch9chann2=filteredchannel2(20001:22500);
epoch10chann2=filteredchannel2(22501:25000);
epoch11chann2=filteredchannel2(25001:27500);
epoch12chann2=filteredchannel2(27501:30000);

%Creating epochs for channel 3

epoch1chann3=filteredchannel3(1:2500);
epoch2chann3=filteredchannel3(2501:5000);
epoch3chann3=filteredchannel3(5001:7500);
epoch4chann3=filteredchannel3(7501:10000);
epoch5chann3=filteredchannel3(10001:12500);
epoch6chann3=filteredchannel3(12501:15000);
epoch7chann3=filteredchannel3(15001:17500);
epoch8chann3=filteredchannel3(17501:20000);
epoch9chann3=filteredchannel3(20001:22500);
epoch10chann3=filteredchannel3(22501:25000);
epoch11chann3=filteredchannel3(25001:27500);
epoch12chann3=filteredchannel3(27501:30000);

%Creating epochs for channel 4

epoch1chann4=filteredchannel4(1:2500);
epoch2chann4=filteredchannel4(2501:5000);
epoch3chann4=filteredchannel4(5001:7500);
epoch4chann4=filteredchannel4(7501:10000);
epoch5chann4=filteredchannel4(10001:12500);
epoch6chann4=filteredchannel4(12501:15000);
epoch7chann4=filteredchannel4(15001:17500);
epoch8chann4=filteredchannel4(17501:20000);
epoch9chann4=filteredchannel4(20001:22500);
epoch10chann4=filteredchannel4(22501:25000);
epoch11chann4=filteredchannel4(25001:27500);
epoch12chann4=filteredchannel4(27501:30000);

%Creating epochs for channel 5

epoch1chann5=filteredchannel5(1:2500);
epoch2chann5=filteredchannel5(2501:5000);
epoch3chann5=filteredchannel5(5001:7500);
epoch4chann5=filteredchannel5(7501:10000);
epoch5chann5=filteredchannel5(10001:12500);
epoch6chann5=filteredchannel5(12501:15000);
epoch7chann5=filteredchannel5(15001:17500);
epoch8chann5=filteredchannel5(17501:20000);
epoch9chann5=filteredchannel5(20001:22500);
epoch10chann5=filteredchannel5(22501:25000);
epoch11chann5=filteredchannel5(25001:27500);
epoch12chann5=filteredchannel5(27501:30000);

%Creating epochs for channel 6

epoch1chann6=filteredchannel6(1:2500);
epoch2chann6=filteredchannel6(2501:5000);
epoch3chann6=filteredchannel6(5001:7500);
epoch4chann6=filteredchannel6(7501:10000);
epoch5chann6=filteredchannel6(10001:12500);
epoch6chann6=filteredchannel6(12501:15000);
epoch7chann6=filteredchannel6(15001:17500);
epoch8chann6=filteredchannel6(17501:20000);
epoch9chann6=filteredchannel6(20001:22500);
epoch10chann6=filteredchannel6(22501:25000);
epoch11chann6=filteredchannel6(25001:27500);
epoch12chann6=filteredchannel6(27501:30000);

%Creating epochs for channel 7

epoch1chann7=filteredchannel7(1:2500);
epoch2chann7=filteredchannel7(2501:5000);
epoch3chann7=filteredchannel7(5001:7500);
epoch4chann7=filteredchannel7(7501:10000);
epoch5chann7=filteredchannel7(10001:12500);
epoch6chann7=filteredchannel7(12501:15000);
epoch7chann7=filteredchannel7(15001:17500);
epoch8chann7=filteredchannel7(17501:20000);
epoch9chann7=filteredchannel7(20001:22500);
epoch10chann7=filteredchannel7(22501:25000);
epoch11chann7=filteredchannel7(25001:27500);
epoch12chann7=filteredchannel7(27501:30000);

%Creating epochs for channel 8

epoch1chann8=filteredchannel8(1:2500);
epoch2chann8=filteredchannel8(2501:5000);
epoch3chann8=filteredchannel8(5001:7500);
epoch4chann8=filteredchannel8(7501:10000);
epoch5chann8=filteredchannel8(10001:12500);
epoch6chann8=filteredchannel8(12501:15000);
epoch7chann8=filteredchannel8(15001:17500);
epoch8chann8=filteredchannel8(17501:20000);
epoch9chann8=filteredchannel8(20001:22500);
epoch10chann8=filteredchannel8(22501:25000);
epoch11chann8=filteredchannel8(25001:27500);
epoch12chann8=filteredchannel8(27501:30000);

%Creating stop,push and pull epochs for every channel

stopepochchann1=[epoch1chann1;epoch4chann1;epoch7chann1;epoch10chann1]
stopepochchann2=[epoch1chann2;epoch4chann2;epoch7chann2;epoch10chann2]
stopepochchann3=[epoch1chann3;epoch4chann3;epoch7chann3;epoch10chann3]
stopepochchann4=[epoch1chann4;epoch4chann4;epoch7chann4;epoch10chann4]
stopepochchann5=[epoch1chann5;epoch4chann5;epoch7chann5;epoch10chann5]
stopepochchann6=[epoch1chann6;epoch4chann6;epoch7chann6;epoch10chann6]
stopepochchann7=[epoch1chann7;epoch4chann7;epoch7chann7;epoch10chann7]
stopepochchann8=[epoch1chann8;epoch4chann8;epoch7chann8;epoch10chann8]

pushepochchann1=[epoch2chann1;epoch5chann1;epoch8chann1;epoch11chann1]
pushepochchann2=[epoch2chann2;epoch5chann2;epoch8chann2;epoch11chann2]
pushepochchann3=[epoch2chann3;epoch5chann3;epoch8chann3;epoch11chann3]
pushepochchann4=[epoch2chann4;epoch5chann4;epoch8chann4;epoch11chann4]
pushepochchann5=[epoch2chann5;epoch5chann5;epoch8chann5;epoch11chann5]
pushepochchann6=[epoch2chann6;epoch5chann6;epoch8chann6;epoch11chann6]
pushepochchann7=[epoch2chann7;epoch5chann7;epoch8chann7;epoch11chann7]
pushepochchann8=[epoch2chann8;epoch5chann8;epoch8chann8;epoch11chann8]

pullepochchann1=[epoch3chann1;epoch6chann1;epoch9chann1;epoch12chann1]
pullepochchann2=[epoch3chann2;epoch6chann2;epoch9chann2;epoch12chann2]
pullepochchann3=[epoch3chann3;epoch6chann3;epoch9chann3;epoch12chann3]
pullepochchann4=[epoch3chann4;epoch6chann4;epoch9chann4;epoch12chann4]
pullepochchann5=[epoch3chann5;epoch6chann5;epoch9chann5;epoch12chann5]
pullepochchann6=[epoch3chann6;epoch6chann6;epoch9chann6;epoch12chann6]
pullepochchann7=[epoch3chann7;epoch6chann7;epoch9chann7;epoch12chann7]
pullepochchann8=[epoch3chann8;epoch6chann8;epoch9chann8;epoch12chann8]

%Chanel 1

meanstopchann1=mean(stopepochchann1,1);
newmeanstopchann1 = (meanstopchann1 - min(meanstopchann1)) / ( max(meanstopchann1) - min(meanstopchann1));
meanpushchann1=mean(pushepochchann1,1);
newmeanpushchann1 = (meanpushchann1 - min(meanpushchann1)) / ( max(meanpushchann1) - min(meanpushchann1))
meanpullchann1=mean(pullepochchann1,1);
newmeanpullchann1 = (meanpullchann1 - min(meanpullchann1)) / ( max(meanpullchann1) - min(meanpullchann1))

%Chanel 2

meanstopchann2=mean(stopepochchann2,1);
newmeanstopchann2 = (meanstopchann2 - min(meanstopchann2)) / ( max(meanstopchann2) - min(meanstopchann2))
meanpushchann2=mean(pushepochchann2,1);
newmeanpushchann2 = (meanpushchann2 - min(meanpushchann2)) / ( max(meanpushchann2) - min(meanpushchann2))
meanpullchann2=mean(pullepochchann2,1);
newmeanpullchann2= (meanpullchann2 - min(meanpullchann2)) / ( max(meanpullchann2) - min(meanpullchann2))

%Chanel 3

meanstopchann3=mean(stopepochchann3,1);
newmeanstopchann3 = (meanstopchann3 - min(meanstopchann3)) / ( max(meanstopchann3) - min(meanstopchann3))
meanpushchann3=mean(pushepochchann3,1);
newmeanpushchann3 = (meanpushchann3 - min(meanpushchann3)) / ( max(meanpushchann3) - min(meanpushchann3))
meanpullchann3=mean(pullepochchann3,1);
newmeanpullchann3 = (meanpullchann3 - min(meanpullchann3)) / ( max(meanpullchann3) - min(meanpullchann3))

%Chanel 4

meanstopchann4=mean(stopepochchann4,1);
newmeanstopchann4 = (meanstopchann4 - min(meanstopchann4)) / ( max(meanstopchann4) - min(meanstopchann4))
meanpushchann4=mean(pushepochchann4,1);
newmeanpushchann4 = (meanpushchann4 - min(meanpushchann4)) / ( max(meanpushchann4) - min(meanpushchann4))
meanpullchann4=mean(pullepochchann4,1);
newmeanpullchann4 = (meanpullchann4 - min(meanpullchann4)) / ( max(meanpullchann4) - min(meanpullchann4))

%Chanel 5

meanstopchann5=mean(stopepochchann5,1);
newmeanstopchann5 = (meanstopchann5 - min(meanstopchann5)) / ( max(meanstopchann5) - min(meanstopchann5))
meanpushchann5=mean(pushepochchann5,1);
newmeanpushchann5 = (meanpushchann5 - min(meanpushchann5)) / ( max(meanpushchann5) - min(meanpushchann5))
meanpullchann5=mean(pullepochchann5,1);
newmeanpullchann5 = (meanpullchann5 - min(meanpullchann5)) / ( max(meanpullchann5) - min(meanpullchann5))

%Chanel 6

meanstopchann6=mean(stopepochchann6,1);
newmeanstopchann6 = (meanstopchann6 - min(meanstopchann6)) / ( max(meanstopchann6) - min(meanstopchann6))
meanpushchann6=mean(pushepochchann6,1);
newmeanpushchann6 = (meanpushchann6 - min(meanpushchann6)) / ( max(meanpushchann6) - min(meanpushchann6))
meanpullchann6=mean(pullepochchann6,1);
newmeanpullchann6 = (meanpullchann6 - min(meanpullchann6)) / ( max(meanpullchann6) - min(meanpullchann6))

%Chanel 7

meanstopchann7=mean(stopepochchann7,1);
newmeanstopchann7 = (meanstopchann7 - min(meanstopchann7)) / ( max(meanstopchann7) - min(meanstopchann7))
meanpushchann7=mean(pushepochchann7,1);
newmeanpushchann7 = (meanpushchann7 - min(meanpushchann7)) / ( max(meanpushchann7) - min(meanpushchann7))
meanpullchann7=mean(pullepochchann7,1);
newmeanpullchann7 = (meanpullchann7 - min(meanpullchann7)) / ( max(meanpullchann7) - min(meanpullchann7))

%Chanel 8

meanstopchann8=mean(stopepochchann8,1);
newmeanstopchann8 = (meanstopchann8 - min(meanstopchann8)) / ( max(meanstopchann8) - min(meanstopchann8))
meanpushchann8=mean(pushepochchann8,1);
newmeanpushchann8 = (meanpushchann8 - min(meanpushchann8)) / ( max(meanpushchann8) - min(meanpushchann8))
meanpullchann8=mean(pullepochchann8,1);
newmeanpullchann8 = (meanpullchann8 - min(meanpullchann8)) / ( max(meanpullchann8) - min(meanpullchann8))

%leftside(right hand)
stopepoch1=2.*(meanstopchann3)-meanstopchann1-meanstopchann5;
newstopepoch1 = (stopepoch1 - min(stopepoch1)) / ( max(stopepoch1) - min(stopepoch1))
pushepoch1=2.*(meanpushchann3)-meanpushchann1-meanstopchann5;%push
newpushepoch1 = (pushepoch1 - min(pushepoch1)) / ( max(pushepoch1) - min(pushepoch1))
pullepoch1=2.*(meanpullchann3)-meanpullchann1-meanstopchann5;
newpullepoch1 = (pullepoch1 - min(pullepoch1)) / ( max(pullepoch1) - min(pullepoch1))

powerstopleft=bandpower(stopepoch1,250,[8 12]);
powerpushleft=bandpower(pushepoch1,250,[8 12]);
% powerpullleft=bandpower(pullepoch1,250,[20 35]);

%rightside(left hand)
stopepoch2=2.*(meanstopchann4)-meanstopchann2-meanstopchann6;
newstopepoch2 = (stopepoch2 - min(stopepoch2)) / ( max(stopepoch2) - min(stopepoch2))
pushepoch2=2.*(meanpushchann4)-meanpushchann2-meanstopchann6;
newpushepoch2 = (pushepoch2 - min(pushepoch2)) / ( max(pushepoch2) - min(pushepoch2))
pullepoch2=2.*(meanpullchann4)-meanpullchann2-meanstopchann6;%pull
newpullepoch2 = (pullepoch2 - min(pullepoch2)) / ( max(pullepoch2) - min(pullepoch2))
powerstopright=bandpower(stopepoch2,250,[16 24]);
% powerpushright=bandpower(pushepoch2,250,[20 35]);
powerpullright=bandpower(pullepoch2,250,[16 24]);


