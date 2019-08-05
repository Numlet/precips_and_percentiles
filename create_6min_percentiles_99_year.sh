#!/bin/bash -l
#
#SBATCH --account=pr04
#SBATCH --time=24:00:00
#SBATCH --job-name=percentiles6
#SBATCH --nodes=1
#SBATCH --output=percentiles6.out
#SBATCH --constraint=gpu


cdo -yyearpctl,99.0 full_array.nc -yyearmin full_array.nc -yyearmax full_array.nc full_array_6min_perc_99_year.nc
#cdo -yyearpctl,99.9 full_array.nc -yyearmin full_array.nc -yyearmax full_array.nc 6min_perc_999_year.nc
#cdo -yyearpctl,99.99 full_array.nc -yyearmin full_array.nc -yyearmax full_array.nc 6min_perc_9999_year.nc
#cdo -yyearpctl,99.999 full_array.nc -yyearmin full_array.nc -yyearmax full_array.nc 6min_perc_99999_year.nc
