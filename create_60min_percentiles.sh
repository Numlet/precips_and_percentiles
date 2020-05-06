#!/bin/bash -l
#
#SBATCH --account=pr94
#SBATCH --time=24:00:00
#SBATCH --job-name=percentiles60min
#SBATCH --nodes=1
#SBATCH --output=percentiles60.out
#SBATCH --constraint=gpu


cdo -yseaspctl,99.0 full_array_60min.nc -yseasmin full_array_60min.nc -yseasmax full_array_60min.nc full_array_60min_perc_99.nc
cdo -yseaspctl,99.9 full_array_60min.nc -yseasmin full_array_60min.nc -yseasmax full_array_60min.nc full_array_60min_perc_999.nc
#cdo -yseaspctl,99.99 full_array_60min.nc -yseasmin full_array_60min.nc -yseasmax full_array_60min.nc full_array_60min_perc_9999.nc
#cdo -yseaspctl,99.999 full_array_60min.nc -yseasmin full_array_60min.nc -yseasmax full_array_60min.nc full_array_60min_perc_99999.nc
