#cp /store/c2sm/pr04/jvergara/RUNS_IN_SCRATCH/GA_fine_ERA/lm_f/6min_precip/day* . 

#rsync -aq /store/c2sm/pr04/jvergara/RUNS_IN_SCRATCH/MPI_near_future/lm_f/6min_precip/day* . 

for year in 2040 2041 2042 2043 2044 2045 2046 2047 2048 2049 2050 
do
   echo $year
   sbatch -C gpu join_scrip.sh $year
done
#python decompress_minute_output.py
#python create_TOT_PREC.py

#mv 1h_TOT_PREC/* /scratch/snx3000/jvergara/test_EUCP_jesus/data_in
#cd /scratch/snx3000/jvergara/test_EUCP_jesus
#python concatenate_yearly.py
#bash remap_conservatively.sh
#bash compute_simple.sh