import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(18,GPIO.OUT)

print '1' ;
GPIO.output(18,GPIO.HIGH)
time.sleep(0.5)
print '0' ;
GPIO.output(18,GPIO.LOW)


while(True):
    x=input('1'+' '+'o'+'r'+' '+'0'+' ');
    if(x == 1):
        GPIO.output(18,GPIO.HIGH);
    elif(x == 0):
        GPIO.output(18,GPIO.LOW);
    else:
        GPIO.output(18,GPIO.LOW);
        break;
    
