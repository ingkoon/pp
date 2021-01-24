from datetime import *
from collections import namedtuple

week = timedelta(weeks = 1)
print(week)

next_week = date.today() + week
print(next_week)

Action = namedtuple("patient_action", ['CHO', 'insulin'])
print("--------------------")
print(datetime.min.time())
