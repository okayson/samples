#!/usr/bin/python3
import numpy as np
from matplotlib import pyplot as plt
import pandas as pd

# np.polyfit(x,y,1)で１次近似
# np.poly1d(np.polyfit(x,y,1))で関数生成
# np.poly1d(np.polyfit(x,y,1))(arg)でargによる計算

data = np.loadtxt('./data.txt')
print(data)
x = data[:,0]
y = data[:,1]
slope,intercept = np.polyfit(x, y, 1)
print("Slope",slope)
print("Intercept",intercept)

si = np.polyfit(x, y, 1)
func = np.poly1d(si)
y1 = func(x)

plt.figure()
plt.scatter(x,y)
plt.plot(x,y1)
plt.savefig('./polyfit1.png')
plt.close('all')

# pandas.DataFrameで描画する

df = pd.DataFrame([
    [2,3],
    [4,5],
    [9,12]
    ])
df.columns = ['Col1','Col2']
print(df)

si = np.polyfit(df['Col1'], df['Col2'], 1)
func = np.poly1d(si)
y1 = func(df['Col1'])

plt.figure()
df.plot.scatter(x='Col1', y='Col2',alpha=0.5)
# plt.plot(df['Col1'], y1, alpha=0.5)
plt.plot(df['Col1'], 
        np.poly1d(np.polyfit(df['Col1'], df['Col2'], 1))(df['Col1']),
        alpha=0.5)
plt.savefig('./polyfit2.png')
plt.close('all')

# DataFrameに新しい列を追加して描画時に指定する
df['Near'] = func(df['Col1'])
print(df)

print("Slope = ", si[0])
print("Intercept = ", si[1])
label = "y = " + str(si[0]) + "x + " + str(si[1])
print(label)
label = "y = " + str(round(si[0],4)) + "x + " + str(round(si[1],4))
print(label)

plt.figure()
ax = df.plot.scatter(x='Col1', y='Col2', alpha=0.5)
df.plot.line(x='Col1', y='Near', alpha=0.5, style='g:',label=label, ax=ax)

plt.savefig('./polyfit3.png')
plt.close('all')

