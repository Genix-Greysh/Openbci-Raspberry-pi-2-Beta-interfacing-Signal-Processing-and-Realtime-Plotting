# Openbci-Raspberry-pi-2-Beta-interfacing-Signal-Processing-and-Realtime-Plotting
This python code implements motor imagery of right and left hand movement BY identifying band energies 
right haand ERS-ERD 8-12 Hz
left haand ERS-ERD 16-24 Hz

# Python 2.7 libraries
download all the necessary openBCI libraries from here https://github.com/OpenBCI/OpenBCI_Python
you might also want to install these libraries for python 2.7 as well :-
. matplottlib
. scipy
. drawnow

# Interfacing
Navigate to the scripts folder and run EMG / EEG.py after placing the electrodes to the correct locations either for EMG or EEG acquisition.

#Electrode placement for right/left hand movement detection from c3/c4 channels (respectively)
Please refer to the 10-20 system for EEG electrode placement i.e around channels c3 and c4 and 2 electrodes above and below each channel.The important point here 
is that the necessary channel for right or left hand (c3 or c4) should be multiplied by 2 in the code for the laplacian filters.It can be found UNDER  
ONE SECOND STUFF COMMENT in the "lap" variable]

# Report
For furthur details, please refer to the report attached to the files above.
