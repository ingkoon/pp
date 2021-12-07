class MyController(Controller):
    def __init__(self, init_state):
        self.init_state = init_state
        self.state = init_state

    def policy(self, observation, reward, done, **info):    
        self.state = observation
        action = Action(basal=0, bolus=0)
        return action

    def reset(self):
        self.state = self.init_state


ctrller = MyController(0)
simulate(controller=ctrller)