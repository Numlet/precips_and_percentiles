#!/bin/bash -l
#
#SBATCH --account=pr94
#SBATCH --time=24:00:00
#SBATCH --job-name=create_full_arrays
#SBATCH --nodes=1
#SBATCH --output=create_full_arrays.out
#SBATCH --constraint=gpu

cdo cat day* full_array.nc

cdo timselsum,2 full_array.nc full_array_12min.nc

