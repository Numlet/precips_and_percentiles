
partA_ID=$(sbatch --parsable create_full_data_files.sh)
sbatch --parsable --dependency=afterany:${partA_ID} create_6min_percentiles.sh
partB_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_run_sum_12min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_12min_percentiles.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_run_sum_18min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_18min_percentiles.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_run_sum_24min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_24min_percentiles.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_run_sum_30min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_30min_percentiles.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_run_sum_60min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_60min_percentiles.sh







