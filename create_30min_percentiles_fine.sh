#!/bin/bash -l
#
#SBATCH --account=pr04
#SBATCH --time=24:00:00
#SBATCH --job-name=percentiles30min
#SBATCH --nodes=1
#SBATCH --output=percentiles30.out
#SBATCH --constraint=gpu


#cdo -yseaspctl,99.0 full_array_30min.nc -yseasmin full_array_30min.nc -yseasmax full_array_30min.nc full_array_30min_perc_99.nc
#cdo -yseaspctl,99.9 full_array_30min.nc -yseasmin full_array_30min.nc -yseasmax full_array_30min.nc full_array_30min_perc_999.nc
cdo -yseaspctl,99.99 full_array_30min.nc -yseasmin full_array_30min.nc -yseasmax full_array_30min.nc full_array_30min_perc_9999.nc
cdo -yseaspctl,99.999 full_array_30min.nc -yseasmin full_array_30min.nc -yseasmax full_array_30min.nc full_array_30min_perc_99999.nc
