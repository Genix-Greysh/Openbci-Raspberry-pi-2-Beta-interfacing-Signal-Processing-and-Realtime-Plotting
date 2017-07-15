import sys; sys.path.append('..') # help python find open_bci_v3.py relative to scripts folder
import open_bci_v3 as bci
import os
import logging
import time
from scipy import signal
import matplotlib.pyplot as plt
import numpy as np




def dataHandlingFromOpenbci(sample,bcint):
	global timeInSeconds;
	global storeChannel2data;
	global recordingTime;
	#os.system('clear')
	print "----------------"
	print("%f" %(sample.id))
	print sample.channel_data
	#print sample.aux_data
	print "----------------"



	storeChannel2data.append(sample.channel_data[2]);

	if( (sample.id % 251) == 0 and sample.id != 0):
		timeInSeconds = timeInSeconds+1;
		#t = np.array(range(0,249));
		#s = np.array(storeChannel2data[-249:]);
		#print len(t) ;
		#print len(s) ;
		#plt.plot(t, s)
		#plt.grid(True)
		#plt.savefig("test.png")
		#plt.show()
	if(timeInSeconds == recordingTime):
		bcint.stop();
		t = np.array(range(0,recordingTime*250));
		#s = np.array(storeChannel2data[-249*recordingTime:]);
		storeChannel2data = signal.detrend(storeChannel2data);
		s = np.array(storeChannel2data[-250*recordingTime:]);
		print len(t) ;
		print len(s) ;
		plt.plot(t, s)
		plt.grid(True)
		plt.savefig("channel2Plot.png")
		plt.show()
		timeInSeconds = 0;






if __name__ == '__main__':
        port = '/dev/ttyUSB0'
	baud = 115200
	logging.basicConfig(filename="test.log",format='%(asctime)s - %(levelname)s : %(message)s',level=logging.DEBUG)
	logging.info('---------LOG START-------------')
	board = bci.OpenBCIBoard(port=port, scaled_output=False, log=True)
	print("Board Instantiated")
	
	while True:
		timeInSeconds = 0;
		storeChannel2data = [];
		recordingTime = 10;
		wannastart = input("start:1 , no : 0  ");
		if(wannastart):
			board.ser.write('v')
			time.sleep(10)
			board.start_streaming(dataHandlingFromOpenbci)
		else:
			break;
	board.disconnect();




