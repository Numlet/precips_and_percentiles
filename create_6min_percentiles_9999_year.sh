#!/bin/bash -l
#
#SBATCH --account=pr04
#SBATCH --time=24:00:00
#SBATCH --job-name=percentiles6
#SBATCH --nodes=1
#SBATCH --output=percentiles6.out
#SBATCH --constraint=gpu


#cdo -yearpctl,99.0 full_array.nc -yearmin full_array.nc -yearmax full_array.nc 6min_perc_99_year.nc
#cdo -yearpctl,99.9 full_array.nc -yearmin full_array.nc -yearmax full_array.nc 6min_perc_999_year.nc
cdo -yearpctl,99.99 full_array.nc -yearmin full_array.nc -yearmax full_array.nc full_array_6min_perc_9999_year.nc
#cdo -yearpctl,99.999 full_array.nc -yearmin full_array.nc -yearmax full_array.nc 6min_perc_99999_year.nc
