#!/bin/bash -l
#
#SBATCH --account=pr04
#SBATCH --time=24:00:00
#SBATCH --job-name=percentiles18min
#SBATCH --nodes=1
#SBATCH --output=percentiles18.out
#SBATCH --constraint=gpu


cdo -yyearpctl,99.0 full_array_18min.nc -yyearmin full_array_18min.nc -yyearmax full_array_18min.nc full_array_18min_perc_99_year.nc
cdo -yyearpctl,99.9 full_array_18min.nc -yyearmin full_array_18min.nc -yyearmax full_array_18min.nc full_array_18min_perc_999_year.nc
#cdo -yyearpctl,99.99 full_array_18min.nc -yyearmin full_array_18min.nc -yyearmax full_array_18min.nc full_array_18min_perc_9999_year.nc
#cdo -yyearpctl,99.999 full_array_18min.nc -yyearmin full_array_18min.nc -yyearmax full_array_18min.nc full_array_18min_perc_99999_year.nc
