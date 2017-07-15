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

def draw_fi(board,lock,procs):
        print " PLOTTING PROCESS Initiated"
        while(1):
                print " PLOTTING PROCESS Running :" + str(len(onesec));
                if(len(onesec) >= 250):                                
                                drawnow(draw_fg);
                if(len(storeChannel1data) >= recordingTime*250):
                                break;
def draw_fig(board,lock,procs):
        print " PLOTTING PROCESS Initiated"
        print " PLOTTING PROCESS Running :" + str(len(onesec));
        if(len(onesec) >= 250):                                
                drawnow(draw_fg);
        
def draw_fg():
        global xax;
        global yax;
        yax =np.divide(onesec,1000);
	plt.axis([0,250, -30, 30]);
	plt.grid(True)
        xax = np.array(range(0,len(yax)));
        plt.plot(xax,yax)
        plt.draw();
        #plt.show(0)
        plt.pause(0.001)
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


        
	fs = 250.0 ;
	#os.system('clear')
	print "----------------"
	print("%f" %(sample.id))
	print sample.channel_data
	#print sample.aux_data
	print "----------------"
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
		tmpstoreChannel1data = signal.detrend(storeChannel1data);
		lowcut = 5 ;
        	highcut = 35 ;
		tmpstoreChannel1data = butter_bandpass_filter(tmpstoreChannel1data, lowcut, highcut, fs, order=6)  
		onesec = np.array(tmpstoreChannel1data[-250:]);

                procs[1].run();
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
                



lock = multiprocessing.Lock();
procs = [];
if __name__ == '__main__':
        port = '/dev/ttyUSB0'
	baud = 115200
	logging.basicConfig(filename="test.log",format='%(asctime)s - %(levelname)s : %(message)s',level=logging.DEBUG)
	logging.info('---------LOG START-------------')
	board = bci.OpenBCIBoard(port=port, scaled_output=False, log=True)
	print("Board Instantiated")
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
		recordingTime = 10;
		wannastart = input("stream data?  1/0 =>");
		if(wannastart):
                        plt.ion();
                        plt.show();
                        procs = [];
                        procs.append(multiprocessing.Process(target=shuru_karo_bhai,args=(board,lock,procs)));
                        procs.append(multiprocessing.Process(target=draw_fig,args=(board,lock,procs)));
                        procs[1].start()
                        procs[0].start()
                        procs[0].join();
                        procs[1].join();
			
		else:
			break;
	board.disconnect();




