#!/bin/tcsh
#
#SBATCH --job-name=join_precip
#SBATCH --output=join_precip.out
#SBATCH --nodes=1
#SBATCH --partition=normal
#SBATCH --time=20:00:00
#SBATCH --account=pr04

python decompress_minute_output.py $1
python create_TOT_PREC.py $1
