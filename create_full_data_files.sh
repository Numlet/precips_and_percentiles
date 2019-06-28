#!/bin/bash -l
#
#SBATCH --account=pr04
#SBATCH --time=24:00:00
#SBATCH --job-name=create_full_arrays
#SBATCH --nodes=1
#SBATCH --output=create_full_arrays.out
#SBATCH --constraint=gpu

cdo cat day_files/day* full_array.nc


