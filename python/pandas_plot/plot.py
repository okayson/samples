#!/usr/bin/python3

# c.f. https://note.nkmk.me/python-pandas-plot/
# c.f. https://github.com/mwaskom/seaborn-data/blob/master/iris.csv

import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt

df = pd.read_csv('./iris.csv')
print(df)

# 描画方法1
plt.figure()
df.plot()
plt.savefig('./pandas_iris_line01.png')
plt.close('all')

# 描画方法2
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
df.plot(ax=ax)
fig.savefig('./pandas_iris_line02.png')

# 描画方法3(subplot)
fig, axes = plt.subplots(nrows=2, ncols=3, figsize=(9,6))
df.plot(ax=axes[0,0], legend=False)
df.plot(ax=axes[1,2], legend=False, kind='hist')
fig.savefig('./pandas_iris_line03.png')

# サイズ変更(figsize)
plt.figure()
df.plot()
df.plot(figsize=(9,6))
plt.savefig('./pandas_iris_line04.png')
plt.close('all')

# サイズ変更(dpi)
# dpiで1インチ当たりのドット数を指定する
plt.figure()
df.plot()
plt.savefig('./pandas_iris_line05.png',dpi=70)
plt.close('all')

# 各列をサブプロットに配置(Default縦配置)
plt.figure()
df.plot(subplots=True)
plt.savefig('./pandas_iris_line06.png')
plt.close('all')

# 各列をサブプロットに配置(Layout設定)
plt.figure()
df.plot(subplots=True,layout=(2,2))
plt.savefig('./pandas_iris_line07.png')
plt.close('all')

# 各列をサブプロットに配置(軸の値をシェア)
plt.figure()
df.plot(subplots=True,layout=(2,2),
        sharex=True, sharey=True)
plt.savefig('./pandas_iris_line08.png')
plt.close('all')

#プロットする列の指定
plt.figure()
df.plot(x='sepal_length', y='sepal_width')
plt.savefig('./pandas_iris_line09.png')
plt.close('all')

#プロットする列の指定(xのみ指定すると残りの列をyにプロット)
plt.figure()
df.plot(x='sepal_length')
plt.savefig('./pandas_iris_line10.png')
plt.close('all')

#プロットする列の指定(複数の列を指定)
plt.figure()
### How1
ax = df.plot(y='petal_length')
df.plot(y='petal_width', ax=ax)
plt.savefig('./pandas_iris_line11_1.png')
### How2
df[['petal_length', 'petal_width']].plot()
plt.savefig('./pandas_iris_line11_2.png')
plt.close('all')

# 表示設定
plt.figure()
df.plot(title='Iris Data Set',  #タイトル
        grid=True,              #グリッド有無
        colormap='Accent',      #色(https://matplotlib.org/examples/color/colormaps_reference.html)
        legend=False,           #凡例の有無
        alpha=0.5)              #透過率(0 - 1)
plt.savefig('./pandas_iris_line12.png')
plt.close('all')

# Plot Kind
# plot(kind='xxx') or plot.xxx()
plt.figure()
df.plot(kind='line')
plt.savefig('./pandas_iris_line13_1.png')
df.plot.line()
plt.savefig('./pandas_iris_line13_2.png')
plt.close('all')

# Bar
plt.figure()
df[:5].plot.bar()
plt.savefig('./pandas_iris_line14_1.png')
df[:5].plot.barh()
plt.savefig('./pandas_iris_line14_2.png')
df[:5].plot.bar(stacked=True)
plt.savefig('./pandas_iris_line14_3.png')
plt.close('all')

# Box
plt.figure()
df.plot.box()
plt.savefig('./pandas_iris_line15.png')
plt.close('all')

# Histgram
plt.figure()
df.plot.hist()
plt.savefig('./pandas_iris_line16_1.png')
df.plot.hist(alpha=0.5)
plt.savefig('./pandas_iris_line16_2.png')
df.plot.hist(stacked=True)
plt.savefig('./pandas_iris_line16_3.png')
df.plot.hist(y='sepal_width')
plt.savefig('./pandas_iris_line16_4.png')
plt.close('all')

# Area
plt.figure()
df.plot.area(alpha=0.7)
plt.savefig('./pandas_iris_line17_1.png')
df.plot.area(stacked=False, alpha=0.7)
plt.savefig('./pandas_iris_line17_2.png')
plt.close('all')

# Scatter
plt.figure()
df.plot.scatter(x='sepal_length', y='petal_length',alpha=0.5)
plt.savefig('./pandas_iris_line18.png')
plt.close('all')

# Hexbin
plt.figure()
df.plot.hexbin(x='sepal_length', y='petal_length',
        gridsize=15, sharex=False)
plt.savefig('./pandas_iris_line19.png')
plt.close('all')

