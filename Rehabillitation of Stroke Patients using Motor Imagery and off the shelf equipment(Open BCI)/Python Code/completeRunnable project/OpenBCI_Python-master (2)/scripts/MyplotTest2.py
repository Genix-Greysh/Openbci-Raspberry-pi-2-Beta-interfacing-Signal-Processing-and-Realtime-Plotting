import matplotlib.pyplot as plt
import matplotlib.animation as anim


def plot_cont(fun, xmax):
    y = []
    fig = plt.figure()
    ax = fig.add_subplot(1,1,1)

    def update(i):
        yi = fun()
        y.append(yi)
        x = range(len(y))
        ax.clear()
        ax.plot(x, y)

    a = anim.FuncAnimation(fig, update, frames=xmax, repeat=False)
    plt.show()

def my_function():
	global tmp;
	tmp = tmp+1;
	if(tmp==10):
		tmp = tmp-1;
	return tmp;

tmp=0;
plot_cont(my_function, 123)
