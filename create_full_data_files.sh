#!/bin/bash -l
#
#SBATCH --account=pr04
#SBATCH --time=24:00:00
#SBATCH --job-name=create_full_data_files.sh
#SBATCH --nodes=1
#SBATCH --output=create_full_data_files.out
#SBATCH --constraint=gpu


rm full_array.nc
cdo cat day_files/day* full_array.nc


