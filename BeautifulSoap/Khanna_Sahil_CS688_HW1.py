#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Sep 11 21:49:30 2021
BU ID: U86445364
@author: sahilkhanna
"""

import requests
import bs4
import pandas as pd
import re
import seaborn as sns
import matplotlib.pyplot as plt

#### Question 1.a

res = requests.get("https://news.google.com/search?q=Covid19%20Vaccine")
soup = bs4.BeautifulSoup(res.text,"lxml")
articles = [] 
for i in range(0,50): 
    a = soup.select('.xrnccd')[i].getText()
    articles.append(a)
    
for i in range(0,len(articles)):
    print("\n",articles[i])
    
#### Question 2

df = pd.DataFrame(articles)
df.to_csv("Covid19_articles.csv",index=False)

#### Question 3

words = ["side effect", "Pain", "Booster", "vaccine"]
word_count = {}
for j in words:
    sum1 = 0
    for i in range(0,len(articles)):
        if(re.findall(j.lower(), str(articles[i]).lower())):
            sum1 += 1
    word_count[j] = (sum1)
    print("\n{} appeared {} times".format(j, sum1))
    
plt.figure(figsize = (10,7))
sns.barplot(x = list(word_count.keys()), y = list(word_count.values()))
plt.title("Word frequency")
plt.ylabel("Count of words")
plt.show()

