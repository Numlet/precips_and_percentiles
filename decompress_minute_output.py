import glob
import sys
import os
sys.path.append('/users/jvergara/python_code')
import Jesuslib_eth as jle
import numpy as np
from netCDF4 import Dataset
#path='output/'+sys.argv[1]+'/6min_precip/'
#path='/scratch/snx3000/jvergara/6min_precip'
#os.chdir(path)
#year='2002'

year=str(sys.argv[1])
#year='2042'
print(year)
files=np.sort(glob.glob('day_files/day_lffd'+year+'*')).tolist()
print(files)
last_file='day_files/day_lffd'+str(int(year)+1)+'0101.nc'
files.append(last_file)
#files=np.concatenate(files,np.array([last_file]))
#print(files)
jle.Create_folder(year)

for file_name in files:
    print(file_name)
#    if not '20420101' in file_name:continue
    decompressed=glob.glob(year+'/'+file_name[14:-3]+'*')
    if len(decompressed)==240:continue    
    if not os.path.exists(file_name):
        original_files=glob.glob('day_files/'+file_name[14:-3]+'*')
        for f in original_files:
             cmd='mv '+f+' '+year+'/'
             out=os.system(cmd)
             continue
    cmd='cdo splitsel,1 '+file_name+' '+year+'/'+'single_file_'+file_name[10:-3]
    
    print(cmd)
    out=os.system(cmd)
    print(out)
    temp_files=glob.glob(year+'/'+'single_file_'+file_name[10:-3]+'*')
    temp_files=np.sort(temp_files)
    #print([name for name in Dataset(temp_files[0]).history.split(' ') if name[:4]=='lffd'])
    original_names=[name for name in Dataset(temp_files[0]).history.split(' ') if name[:4]=='lffd']
    original_names=np.sort(list(set(original_names)))
    print(len(original_names),len(temp_files))
    if not len(temp_files)==len(original_names):
        raise NameError('NOT SAME AMOUNT OF FILES AS ORIGINALLY CONCATENADED!!!')
    for i in range(len(original_names)):
        #print('renaming ', temp_files[i],' to ', original_names[i])
        cmd='mv '+temp_files[i]+' '+year+'/'+original_names[i]
        #print(cmd)
        out=os.system(cmd)
        if not out:os.system('rm -rf '+temp_files[i])
        else:raise NameError('Error when renaming files')
#    os.system('rm -rf '+file_name) 

