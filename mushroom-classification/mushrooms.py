import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt
import seaborn as sns 
from sklearn.preprocessing import LabelEncoder

%matplotlib inline

DATAPATH = 'data/mushrooms.csv'

data = pd.read_csv(DATAPATH)
data.head()

x = data['class']

ax = sns.countplot(x=x, data=data) 