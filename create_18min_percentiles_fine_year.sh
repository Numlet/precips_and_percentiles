#!/bin/bash -l
#
#SBATCH --account=pr94
#SBATCH --time=24:00:00
#SBATCH --job-name=percentiles18min
#SBATCH --nodes=1
#SBATCH --output=percentiles18.out
#SBATCH --constraint=gpu


#cdo -yearpctl,99.0 full_array_18min.nc -yearmin full_array_18min.nc -yearmax full_array_18min.nc full_array_18min_perc_99_year.nc
#cdo -yearpctl,99.9 full_array_18min.nc -yearmin full_array_18min.nc -yearmax full_array_18min.nc full_array_18min_perc_999_year.nc
cdo -yearpctl,99.99 full_array_18min.nc -yearmin full_array_18min.nc -yearmax full_array_18min.nc full_array_18min_perc_9999_year.nc
cdo -yearpctl,99.999 full_array_18min.nc -yearmin full_array_18min.nc -yearmax full_array_18min.nc full_array_18min_perc_99999_year.nc
