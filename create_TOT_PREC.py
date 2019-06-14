#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 30 12:44:41 2019

@author: jvergara
"""


import sys
print (sys.argv)
import glob
import os
sys.path.append('/users/jvergara/python_code')
import Jesuslib_eth as jle
import time


path='/scratch/snx3000/jvergara/6min_precip/'
os.chdir(path)
jle.Create_folder("1h_TOT_PREC")

#original_data_path='/store/c2sm/pr04/jvergara/RUNS_IN_SCRATCH/GA_fine_ERA/lm_f/1h/'



year=str(sys.argv[1])
#year='2002'

hours=jle.Hourly_time_list(start_date='2000010100',end_date='2000010500')
hours=jle.Hourly_time_list(start_date='2000010100',end_date='2005010100')
hours=jle.Hourly_time_list(start_date=year+'010100',end_date=str(int(year)+1)+'000000')


files_path=path+year+'/'

files=glob.glob(files_path+'*')

missing_hour_files=[]
print(year)

for ih in range(len(hours)):
    
    files_to_concat=[]
    if ih!=0:
        hour=hours[ih]
        hour_minus=hours[ih-1]
        files_to_concat.append(files_path+'lffd'+hour_minus+'0600.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'1200.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'1800.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'2400.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'3000.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'3600.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'4200.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'4800.nc')
        files_to_concat.append(files_path+'lffd'+hour_minus+'5400.nc')
        files_to_concat.append(files_path+'lffd'+hour+'0000.nc')
    if ih==0:
        prev_year=str(int(year)-1)
        hour=hours[ih]
        hour_minus=prev_year+'123123'
        if not os.path.exists(path+prev_year+'/lffd'+hour_minus+'0600.nc'):
            print("Previous year folder does not exist.")
            print("Can not create first hour of year data")
            time.sleep(3)
            continue
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'0600.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'1200.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'1800.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'2400.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'3000.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'3600.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'4200.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'4800.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour_minus+'5400.nc')
        files_to_concat.append(path+prev_year+'/lffd'+hour+'0000.nc')
        
    file_name=files_path+'lffd'+hour+'????.nc'
    file_name=' '.join(files_to_concat)
    for file in files_to_concat:
        if not os.path.exists(file):
            time.sleep(10*60)
            if not os.path.exists(file):continue
#    if not files_path+'lffd'+hour+'0000.nc' in files:continue
#    if not files_path+'lffd'+hour+'0600.nc' in files:continue
#    if not files_path+'lffd'+hour+'1200.nc' in files:continue
#    if not files_path+'lffd'+hour+'1800.nc' in files:continue
#    if not files_path+'lffd'+hour+'2400.nc' in files:continue
#    if not files_path+'lffd'+hour+'3000.nc' in files:continue
#    if not files_path+'lffd'+hour+'3600.nc' in files:continue
#    if not files_path+'lffd'+hour+'4200.nc' in files:continue
#    if not files_path+'lffd'+hour+'4800.nc' in files:continue
#    if not files_path+'lffd'+hour+'5400.nc' in files:continue
    #hour_files=glob.glob(file_name)
    #if len(hour_files)!=10:
#   # else:
    #    print('Not all files from:',hour, len(hour_files))
    #    missing_hour_files.append(hour)
    #    continue
    
    concat_cmd='cdo cat '+file_name+' '+files_path+'lffd'+hour+'0000_hour_concat.nc'
    a=os.system(concat_cmd)
    if a:continue
    sum_cmd='cdo hoursum '+files_path+'lffd'+hour+'0000_hour_concat.nc '+path+'1h_TOT_PREC/lffd'+hour+'0000.nc'
    a=os.system(sum_cmd)
    if a:continue
    rm_cmd='rm '+files_path+'lffd'+hour+'0000_hour_concat.nc '+file_name
    a=os.system(rm_cmd)
    if a:continue
    
#    mv_cmd='mv '+path+'lffd'+hour+'0000_hsum.nc '+path+'1h_TOT_PREC/lffd'+hour+'0000.nc
print(missing_hour_files)
#%%
'''
import matplotlib.pyplot as plt
import numpy as np
import scipy as sp
import scipy.ndimage
jle.Create_folder("temp_files")
sample_nc=jle.Dataset('/scratch/snx3000/jvergara/6min_precip/1h_TOT_PREC/lffd20000111140000.nc')
for hour in missing_files:
    print(hour)
    file_name=original_data_path+'lffd'+hour+'0000.nc'
    print(file_name)
    cp_cmd='cp '+file_name+' temp_files/'
    os.system(cp_cmd)
    cmd='cdo delname,RUNOFF_G,RUNOFF_S,HPBL,CIN_ML,CAPE_ML,TQV,TQI,TQC,PS,RELHUM_2M,T_G,T_2M,V_10M,U_10M,TOT_SNOW,QCVG_CON,QV_2M,VMAX_10M temp_files/'+'lffd'+hour+'0000.nc'+' temp_files/'+'lffd'+hour+'0000_only_prec.nc'
    print(cmd)
    a=os.system(cmd)
    ds=jle.Dataset('temp_files/lffd'+hour+'0000_only_prec.nc','r+')
    ds.renameVariable("TOT_PR","TOT_PREC")
    ds.variables["TOT_PREC"].long_name='total precipitation amount'
    ds.variables["TOT_PREC"].standard_name='precipitation_amount'
    ds.variables["TOT_PREC"].units='kg m-2'
    ds.variables["TOT_PREC"].cell_methods='time: sum'
    values= ds.variables["TOT_PREC"][:]*3600
    ds.variables["TOT_PREC"][:]=values
    
    ds.close()
    cp_final_cmd='cp temp_files/lffd'+hour+'0000_only_prec.nc '+path+'1h_TOT_PREC/lffd'+hour+'0000.nc'
    os.system(cp_final_cmd)



'''
#    values_1D
#    sigma = [2, 2]
#    y = sp.ndimage.filters.gaussian_filter(values.squeeze(), sigma, mode='constant')
#%%
#jle.Quick_plot(values.squeeze(),'vals',metadata_dataset=ds,levels=levels)
#jle.Quick_plot(ds.variables["TOT_PREC"][:].squeeze(),'ds',metadata_dataset=ds,levels=levels)
#years=['2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009']
#%%
#plt.figure(figsize=(15,12))
#levels=np.logspace(-1,2.3,15)
#plt.subplot(2,2,1)
#jle.Quick_plot(values.squeeze()*3600,'or',metadata_dataset=ds,levels=levels,new_fig=0)
#plt.subplot(2,2,2)
#jle.Quick_plot(y*3600,'filter',metadata_dataset=ds,levels=levels,new_fig=0)
#
#ds_true=jle.Dataset('/scratch/snx3000/jvergara/6min_precip/1h_TOT_PREC/lffd20000104120000.nc')
#plt.subplot(2,2,3)
#jle.Quick_plot(ds_true,'TOT_PREC',metadata_dataset=ds,levels=levels,new_fig=0)
#plt.subplot(2,2,4)
##%%
#plt.hist((values.squeeze()*3600).flatten(),bins=levels,alpha=0.3,label='original data')
#plt.hist((y*3600).flatten(),bins=levels,alpha=0.3,label='filtered')
#plt.hist((ds_true.variables["TOT_PREC"][:].squeeze()).flatten(),bins=levels,alpha=0.3,label='true data')
#print((values.squeeze()*3600).flatten()[int(len((values.squeeze()*3600).flatten())*0.99)])
#print((y*3600).flatten()[int(len((y*3600).flatten())*0.99)])
#print((ds_true.variables["TOT_PREC"][:].squeeze()).flatten()[int(len((ds_true.variables["TOT_PREC"][:].squeeze()).flatten())*0.99)])
#plt.xlim(9)
#plt.ylim(5)
#plt.legend()
#plt.xscale('log')
