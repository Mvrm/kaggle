import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt

# import data
clicks_conversions= "/home/manish/Desktop/gojek/out.csv"
data = pd.read_csv(clicks_conversions, sep='\t')

data.head()

# Plot a bid movement chart i.e. each provider's average cpc for the property by day.
from pylab import rcParams
rcParams['figure.figsize'] = 15, 5

t = data.ix[:,['ds','provider','cpc_avg']]

t1 = t.pivot(index='ds', columns='provider', values='cpc_avg')

t1.plot(kind = 'bar', legend = 'true', grid ='on', xlim = (10, 5), ylim = (0,500), title = 'Bid movement chart')

#Plot average cpc and gbv across all provider

p = data.groupby('provider').sum()[["cpc_avg","gbv_avg"]].plot.bar(rot = 0)
_ = p.set(xlabel = "Providers", ylabel = "cpc_avg", ylim = (0, 50000), title = 'CPC vs GBV')

# Analyse each provider's profitability.

p = data.groupby('provider').sum()[["profit"]].plot.bar(rot = 0)
_ = p.set(xlabel = "Providers", ylabel = "profitability", title = 'Provider profitability')

plt.show()