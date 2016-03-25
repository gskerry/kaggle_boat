
# coding: utf-8

# In[9]:

matplotlib inline


# In[1]:

import pandas as pd


# In[2]:

import numpy as np


# In[3]:

import sklearn


# In[4]:

import sklearn.linear_model


# In[6]:

df = pd.read_csv("data/train.csv")


# In[7]:

df.head()


# In[10]:

df.groupby(["Sex", "Survived"]).count()["PassengerId"].plot(kind="bar")


# In[11]:

df["Age"].hist()


# In[13]:

clf = sklearn.linear_model.LogisticRegression()
DV = "Survived"
IVs = ["Age"]
subdata = df[[DV]+IVs].dropna()


# In[14]:

subdata.head()


# In[ ]:



