
partA_ID=$(sbatch --parsable create_full_data_files.sh)


sbatch --parsable --dependency=afterany:${partA_ID} create_6min_percentiles_99.sh
sbatch --parsable --dependency=afterany:${partA_ID} create_6min_percentiles_999.sh
sbatch --parsable --dependency=afterany:${partA_ID} create_6min_percentiles_9999.sh
sbatch --parsable --dependency=afterany:${partA_ID} create_6min_percentiles_99999.sh
partB_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_timselsum_12min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_12min_percentiles_99.sh
sbatch --parsable --dependency=afterany:${partB_ID} create_12min_percentiles_999.sh
sbatch --parsable --dependency=afterany:${partB_ID} create_12min_percentiles_9999.sh
sbatch --parsable --dependency=afterany:${partB_ID} create_12min_percentiles_99999.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_timselsum_18min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_18min_percentiles.sh
sbatch --parsable --dependency=afterany:${partB_ID} create_18min_percentiles_fine.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_timselsum_24min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_24min_percentiles.sh
sbatch --parsable --dependency=afterany:${partB_ID} create_24min_percentiles_fine.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_timselsum_30min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_30min_percentiles.sh
sbatch --parsable --dependency=afterany:${partB_ID} create_30min_percentiles_fine.sh
part_B_ID=$(sbatch --parsable --dependency=afterany:${partA_ID} create_timselsum_60min.sh)
sbatch --parsable --dependency=afterany:${partB_ID} create_60min_percentiles.sh
sbatch --parsable --dependency=afterany:${partB_ID} create_60min_percentiles_fine.sh







