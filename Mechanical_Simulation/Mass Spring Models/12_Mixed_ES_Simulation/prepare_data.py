# -*- coding: utf-8 -*-
"""
Created on Sat Jul 11 13:29:15 2020

@author: Docker
"""
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 unused import

import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np

import pandas as pd
#%% Key definitions
struct_key='Structure';
insulator_key='Insulator';
len_key='Acti. len. /mm';
width_key='Acti. wid. /mm';
thickness_key='Con. thi. /μm';
strk_time_key='Stroke time /s';
strk_len_key='Stroke /mm';
voltage_key='Voltage /kV';
load_key='Actual load /g';
capac_key='Capacitance /pF';
dict_rename={
    struct_key:'struct',
    insulator_key:'inst',
    len_key:'L',
    width_key:'w',
    thickness_key:'t',
    strk_time_key:'T',
    strk_len_key:'dY',
    voltage_key:'V',
    load_key:'mass',
    # capac_key:'C'
    }
#dict_rename = {v: k for k, v in dict_rename.items()}
#%% Load original Excel File
og_df=pd.read_excel('Dielectrophoretic_liquid_zippers.xlsx')
#%% Filter for relevant data
df=og_df[((og_df['Structure']==1)&(og_df['Insulator']=='PVC x 2'))]
#%% Filter for relevant data
print('Number of datapoints with length 100mm: '+str(sum(df[len_key]==100)))
print('Number of datapoints with thickness 100μm: '+str(sum(df[thickness_key]==100)))
#%%
l100_df=df[df[len_key]==100]
l100_df=l100_df[l100_df[thickness_key]<500]
#%%

# fig = plt.figure()
# ax = fig.gca(projection='3d')
fig = plt.figure()
ax = fig.gca(projection='3d',proj_type = 'ortho')
#%%
# ax.scatter(l100_df[thickness_key],l100_df[load_key],l100_df[strk_len_key],
#            c = l100_df[strk_len_key], cmap = 'rainbow')#, size = 30)

# ax.scatter(np.log10(l100_df[thickness_key]),
#            np.log10(l100_df[load_key]),
#            np.log10(l100_df[strk_len_key]),
#            c = l100_df[strk_len_key], cmap = 'rainbow')#, size = 30)
ax.scatter(l100_df[thickness_key],
           l100_df[load_key],
           l100_df[strk_len_key],
           c = l100_df[strk_len_key], cmap = 'rainbow')#, size = 30)

#%%
ax.set_xlabel('Thickness (μm)')
ax.set_ylabel('Load (g)')
ax.set_zlabel('Stroke Lengtj (mm)')
ax.set_title('Stroke length of ER actuator 100 mm long by mass and thickness Log10')
#%%
# df_to_export_geom=df[[len_key,width_key,thickness_key,strk_time_key,strk_len_key,load_key]]
# df_to_export_geom=df_to_export_geom.drop_duplicates()

df_to_export_elect=df[dict_rename.keys()]#[len_key,width_key,thickness_key,strk_time_key,strk_len_key,load_key,voltage_key,capac_key]
df_to_export_elect=df_to_export_elect.rename(columns=dict_rename) #drop_duplicates()
df_to_export_elect.to_csv('filtered_data.csv')
# ax.xaxis.get_data_interval()
# ax.set_yscale('log')
# ax.set_xscale('log')
#ax.set_zscale('log')