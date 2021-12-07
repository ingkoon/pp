#필요한 라이브러리는 이 세개이다
from keras.models import Sequential
from keras.layers import Dense
import numpy as np

# 코드 반복 실행 시, 난수에 균등한 값을 주기 위한 시드값 설정
np.random.seed(3)

# 12 x 1000 크기의 속성 array 생성
x_train = np.random.rand(1000, 10)
# 1 x 1000 사이즈의 0과 1사이의 값을 갖는 클래스 array 생성
y_train = np.random.randint(2, size=(1000, 1))

# 테스트를 위한 12 x 100 크기의 array 생성
x_test = np.random.rand(100, 10)
# 테스트를 위한 1 x 100 크기의 array 생성
y_test = np.random.randint(2, size=(100, 1))

'''
데이터 확인을 위한 코드
import matplotlib.pyplot as plt

plot_x = x_train[:,0]
plot_y = x_train[:,1]
plot_color = y_train.reshape(1000,)

plt.scatter(plot_x, plot_y, c=plot_color)
plt.show()
'''

'''
다층 퍼셉트론 생성
입력-은닉층은 35개의 노드를 갖고 있으며 활성화 함수로 relu함수를 사용한다
은닉층(1)과 은닉층(2)는 10개의 노드를 갖고 있으며 활성화함수로 relu함수를 사용한다.
출력층은 1개의 노드와 sigmoid 활성화 함수를 갖는다.
''' 
model = Sequential()
model.add(Dense(40, input_dim = 10, activation='relu'))
model.add(Dense(10, activation = 'relu'))
model.add(Dense(10, activation = 'relu'))
model.add(Dense(1, activation = 'sigmoid'))

'''
컴파일 단계에선 크로스엔트로피 함수를 손실함수로 사용하며, 
최적화 함수는 adam함수, 모델의 평가는 정확도(accuracy)를 통해 측정한다.
'''
model.compile(loss = 'binary_crossentropy', optimizer='adam', metrics=['accuracy'])

'''
반복횟수(epochs)는 200회, 한번 학습에 사용되는 샘플의 크기(batch_size)는 40개이다
'''
model.fit(x_train,y_train,epochs=200, batch_size=40)

print("\n Accuracy: %s" %(model.evaluate(x_test, y_test, batch_size=16)))
