import matplotlib.pyplot as plt
import numpy as np

def draw_linear_graph(m =1, n =1):
    x = np.arange(0,10,2)
    y = [(m*num + n) for num in x]
    plt.plot(x,y)
    title = 'Method of least squares : y = ' + str(m) + 'x + ' + str(n)
    plt.title(title)

data = [[2, 81], [4, 93], [6, 91], [8, 97]]
x = [i[0] for i in data]
y = [i[1] for i in data]

mx = np.mean(x)
my = np.mean(y)
print("x의 평균값: ", mx)
print("y의 평균값: ", my)

divisor = sum([(mx - i)**2 for i in x])

def top(x, mx, y, my):
    d = 0
    for i in range(len(x)):
        d += (x[i] - mx) * (y[i] - my)
    return d
dividend = top(x, mx, y, my)

print("분모", divisor)
print("분자", dividend)

a = dividend/ divisor
b = my - (mx * a)

print("기울기 a = ", a)
print("y 절편 b = ", b)

plt.figure(figsize = (8,5))
plt.grid()
plt.xlabel('time')
plt.ylabel('score')
plt.scatter(x,y)
draw_linear_graph(a, b)
plt.show()