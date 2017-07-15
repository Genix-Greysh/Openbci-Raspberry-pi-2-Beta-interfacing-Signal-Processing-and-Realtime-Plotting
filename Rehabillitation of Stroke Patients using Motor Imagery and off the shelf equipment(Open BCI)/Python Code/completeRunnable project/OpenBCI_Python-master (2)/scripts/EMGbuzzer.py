import sys; sys.path.append('..') # help python find open_bci_v3.py relative to scripts folder
import open_bci_v3 as bci
import os
import logging
import matplotlib
import matplotlib.pyplot as plt
import multiprocessing
import time
import numpy as np
from pylab import *
from scipy import signal
from scipy.signal import butter, lfilter
from drawnow import *
import RPi.GPIO as GPIO
import time

def butter_bandpass(lowcut, highcut, fs, order=5):
	nyq = 0.5 * fs
        low = lowcut / nyq
        high = highcut / nyq
        b, a = butter(order, [low, high], btype='band')
        return b, a
   
   
def butter_bandpass_filter(data, lowcut, highcut, fs, order=5):
	b, a = butter_bandpass(lowcut, highcut, fs, order=order)
        y = lfilter(b, a, data)
        return y

def draw_fi(board,lock,procs,q):
        print " PLOTTING PROCESS Initiated"
        global plotData;
        while(1):
                if(not (q.qsize() == 0) ):
                        tfq = q.get();
                        if(len(tfq)%250 == 0):
                                print " PLOTTING PROCESS Running :" + str(q.qsize()) + " after GET()";
                                plotData = tfq;
                                drawnow(draw_fg);
                        if(len(unnorm) >= recordingTime*250):
                                break;
       
def draw_fg():
        global xax;
        global yax;
        global plotData;
        global tmp;
        global unnorm;
        global recordingTime;
        dvd=[];
        #dvd = np.divide(plotData,max(plotData));

        for i in range(len(plotData)):
                unnorm.append(plotData[i]);
                
        for i in range(len(unnorm)):
                dvd.append(unnorm[i]/ 100000 );

        tmp = dvd;
        yax = tmp;
        #print " max : " + str(max(unnorm)) + " min : " + str((-1)*min(unnorm)); 
        rigorMortis = recordingTime*250;
	plt.axis([0,rigorMortis,-2,2]);
	plt.grid(True)
        xax = range(0,len(yax));
        plt.plot(np.array(xax),np.array(yax))
        plt.savefig("EMG.png")
        plt.draw();
        plt.show(0)
        plt.pause(0.01);
        #time.sleep(0.01);

def shuru_karo_bhai(board,lock,procs):
	board.ser.write('v')
	time.sleep(5)
	board.start_streaming(dataHandlingFromOpenbci);

def dataHandlingFromOpenbci(sample,bcint):
        global lock;
	global timeInSeconds;
	global onesec;
	global storeChannel1data;
	global storeChannel2data;
	global storeChannel3data;
	global storeChannel4data;
	global storeChannel5data;
	global storeChannel6data;
	global storeChannel7data;
	global storeChannel8data;
	global recordingTime;
        global q;

        
	fs = 250.0 ;
	#os.system('clear')
	#print "----------------"
	#print("%f" %(sample.id))
	#print sample.channel_data
	#print sample.aux_data
	#print "----------------"
	storeChannel1data.append(sample.channel_data[0]);
	storeChannel2data.append(sample.channel_data[1]);
	storeChannel3data.append(sample.channel_data[2]);
	storeChannel4data.append(sample.channel_data[3]);
	storeChannel5data.append(sample.channel_data[4]);
	storeChannel6data.append(sample.channel_data[5]);
	storeChannel7data.append(sample.channel_data[6]);
	storeChannel8data.append(sample.channel_data[7]);



	#one sec stuff
	if( (sample.id % 251) == 0 and sample.id != 0):
		timeInSeconds = timeInSeconds+1;

		onesec = [];
		tmpstoreChanneldata = signal.detrend(storeChannel4data);
		lowcut = 2;
        	highcut = 15;
		tmpstoreChanneldata = butter_bandpass_filter(tmpstoreChanneldata, lowcut, highcut, fs, order=6)  
		onesec = np.array(tmpstoreChanneldata[-250:]);

                q.put(onesec);

                normalized = [];
                onesecnormalized = [];
                for i in range(len(tmpstoreChanneldata)):
                        normalized.append(tmpstoreChanneldata[i]/ 100000 );
                onesecnormalized = np.array(normalized[-250:])
                print (1.0/250.0)*sum(abs(onesecnormalized));
                if((1.0/250.0)*sum(abs(onesecnormalized)) > 0.04):
                        GPIO.output(18,GPIO.HIGH)
                        
                else:
                        GPIO.output(18,GPIO.LOW)
                        
                
                #procs[1].run();
		#drawnow(draw_fig)

	


	if(timeInSeconds == recordingTime):
		bcint.stop();
		t = np.array(range(0,recordingTime*250));


		storeChannel1data = signal.detrend(storeChannel1data);
		storeChannel2data = signal.detrend(storeChannel2data);
		storeChannel3data = signal.detrend(storeChannel3data);
		storeChannel4data = signal.detrend(storeChannel4data);
		storeChannel5data = signal.detrend(storeChannel5data);
		storeChannel6data = signal.detrend(storeChannel6data);
		storeChannel7data = signal.detrend(storeChannel7data);
		storeChannel8data = signal.detrend(storeChannel8data);
        	
		lowcut = 0.5 ;
        	highcut = 20.5 ;
		storeChannel1data = butter_bandpass_filter(storeChannel1data, lowcut, highcut, fs, order=6)  
		lowcut = 5 ;
        	highcut = 35 ;
		storeChannel2data = butter_bandpass_filter(storeChannel2data, lowcut, highcut, fs, order=6)  
		lowcut = 5 ;
        	highcut = 35 ;
		storeChannel3data = butter_bandpass_filter(storeChannel3data, lowcut, highcut, fs, order=6) 
		lowcut = 5 ;
        	highcut = 35 ;
		storeChannel4data = butter_bandpass_filter(storeChannel4data, lowcut, highcut, fs, order=6)  
		lowcut = 5 ;
        	highcut = 35 ;
		storeChannel5data = butter_bandpass_filter(storeChannel5data, lowcut, highcut, fs, order=6)  
		lowcut = 5 ;
        	highcut = 35 ;
		storeChannel6data = butter_bandpass_filter(storeChannel6data, lowcut, highcut, fs, order=6) 
		lowcut = 5 ;
        	highcut = 35 ; 
		storeChannel7data = butter_bandpass_filter(storeChannel7data, lowcut, highcut, fs, order=6) 
		lowcut = 5 ;
        	highcut = 35 ;
		storeChannel8data = butter_bandpass_filter(storeChannel8data, lowcut, highcut, fs, order=6)  
   
		s1 = np.array(storeChannel1data[-250*recordingTime:]);
		s2 = np.array(storeChannel2data[-250*recordingTime:]);
		s3 = np.array(storeChannel3data[-250*recordingTime:]);
		s4 = np.array(storeChannel4data[-250*recordingTime:]);
		s5 = np.array(storeChannel5data[-250*recordingTime:]);
		s6 = np.array(storeChannel6data[-250*recordingTime:]);
		s7 = np.array(storeChannel7data[-250*recordingTime:]);
		s8 = np.array(storeChannel8data[-250*recordingTime:]);

				
		#channel 1 for emg
		#plt.plot(t, s1)
		#plt.grid(True)
		#plt.savefig("EMG.png")
		#plt.show()
		
		#rest eeg after large laplacian 
		#plt.plot(t, s2)
		#plt.grid(True)
		#plt.savefig("EEG.png")
		#plt.show()
		


		timeInSeconds = 0;
                GPIO.output(18,GPIO.LOW);



lock = multiprocessing.Lock();
q = multiprocessing.Queue();
procs = [];
plotData=[];
tmp=[];
unnorm=[];
if __name__ == '__main__':
        port = '/dev/ttyUSB0'
	baud = 115200
	logging.basicConfig(filename="test.log",format='%(asctime)s - %(levelname)s : %(message)s',level=logging.DEBUG)
	logging.info('---------LOG START-------------')
	board = bci.OpenBCIBoard(port=port, scaled_output=False, log=True)
	print("Board Instantiated")
	GPIO.setmode(GPIO.BCM)
        GPIO.setwarnings(False)
        GPIO.setup(18,GPIO.OUT)
        
	while True:
		timeInSeconds = 0;
		onesec = [];
		storeChannel1data = [];
		storeChannel2data = [];
		storeChannel3data = [];
		storeChannel4data = [];
		storeChannel5data = [];
		storeChannel6data = [];
		storeChannel7data = [];
		storeChannel8data = [];
		recordingTime = 30;
		wannastart = input("stream data?  1/0 =>");
		if(wannastart):
                        while(not (q.qsize() == 0) ):
                                q.get();
                        plt.ion();
                        plt.show();
                        procs = [];
                        procs.append(multiprocessing.Process(target=shuru_karo_bhai,args=(board,lock,procs)));
                        procs.append(multiprocessing.Process(target=draw_fi,args=(board,lock,procs,q)));
                        procs[1].start()
                        procs[0].start()
                        procs[0].join();
                        procs[1].join();
			
		else:
			break;
	board.disconnect();




