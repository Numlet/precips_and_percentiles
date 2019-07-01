#!/bin/tcsh
#
#SBATCH --job-name=join_precip
#SBATCH --output=join_precip.out
#SBATCH --nodes=1
#SBATCH --partition=normal
#SBATCH --time=24:00:00
#SBATCH --account=pr04

python decompress_minute_output.py $1
echo 'begin with TOT_PREC'
python create_TOT_PREC.py $1
