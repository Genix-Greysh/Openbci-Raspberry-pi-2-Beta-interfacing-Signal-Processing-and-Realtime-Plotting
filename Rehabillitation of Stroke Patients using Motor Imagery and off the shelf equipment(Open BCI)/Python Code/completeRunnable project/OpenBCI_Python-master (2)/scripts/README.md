Various use-case of `open_bci_v3.py` for those who don't want to go through `user.py` and plugins -- but beware of code fragmentation!

Run the EMGbuzzer.py/EEGbuzzer.py to interface + process + plot the EMG/EEG signals after connecting the rfduino dongle to pi and switching on the openbci, and ofcoarse place the electrodes either for left or right hand and set filter values accordingly for EEG i.e

right hand EEG --> 8-12 Hz bandpass butterworth
left hand EEG --> 16-24 Hz bandpass butterworth

