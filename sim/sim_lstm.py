from keras.models import Model
from keras.layers import Input, Dense, LSTM, Bidirectional
from keras import backend as K
import numpy as np
import matplotlib.pyplot as plt

# many_to_one type lstm학습
# 
class lstm_patient:    

    # 클래스 초기화 함수
    def __init__(self, tmp, train_X, train_Y, result_arr):
        self.tmp = []
        self.train_X = []
        self.train_Y = []
        self.result_arr = []
        self.PH = 5

    def addSim(self,x):
        self.tmp.append(x)
        if len(self.tmp) == self.PH:
            self.train_X.append([self.tmp[:4]])
            self.train_Y.append([self.tmp[5]])
            self.tmp = []
        
        if len(self.train_X) >= 40:
            return np.array(self.train_X), np.array(self.train_Y)
           

    def makeSession(self, train_X, train_Y):
        K.clear_session()
        xInput = input(batch_shape = (None, X_train.shape[1], x_train_shape[2]))
        xLstm_1 = LSTM(10, return_sequences=True)(xInput)
        xLstm_2 = Bidirectional(LSTM(10))(xLstm_1)
        xOutput = Dense(1)(xLstm_2)

        model = Model(xInput, xOutput)
        model.compile(loss = 'mse', optimizer='adam')

        model.fit(train_X, train_Y, epochs = 500, batch_size = 20, verbose=1)

        y_hat = model.predict(x_test, batch_size=1)
