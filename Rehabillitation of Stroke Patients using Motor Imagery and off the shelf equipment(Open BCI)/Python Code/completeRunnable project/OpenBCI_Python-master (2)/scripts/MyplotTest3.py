from pylab import *
from drawnow import drawnow, figure
# if global namespace, import plt.figure before drawnow.figure

figure(figsize=(7, 7/2))
def draw_fig():
    subplot(1, 2, 1)
    imshow(x)

    subplot(1, 2, 2)
    imshow(x_hat)
    #show()

x = imread('mandrill.png').mean(axis=2)
k_values = around(logspace(0, 2, num=10))
for k in k_values:
    #x_hat = approx(x, k)
    drawnow(draw_fig)
