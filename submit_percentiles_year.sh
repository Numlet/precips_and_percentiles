
#partA_ID=$(sbatch --parsable create_full_data_files.sh)
partA_ID=""
partB_ID=""

#sbatch  create_6min_percentiles_99.sh
#sbatch  create_6min_percentiles_999.sh
#sbatch  create_6min_percentiles_9999.sh
#sbatch  create_6min_percentiles_99999.sh

sbatch  create_6min_percentiles_99_year.sh
sbatch  create_6min_percentiles_999_year.sh
sbatch  create_6min_percentiles_9999_year.sh
sbatch  create_6min_percentiles_99999_year.sh

#partB_ID=$(sbatch  create_timselsum_12min.sh)
#sbatch  create_12min_percentiles_99.sh
#sbatch  create_12min_percentiles_999.sh
#sbatch  create_12min_percentiles_9999.sh
#sbatch  create_12min_percentiles_99999.sh

sbatch  create_12min_percentiles_99_year.sh
sbatch  create_12min_percentiles_999_year.sh
sbatch  create_12min_percentiles_9999_year.sh
sbatch  create_12min_percentiles_99999_year.sh

#part_B_ID=$(sbatch  create_timselsum_18min.sh)
#sbatch  create_18min_percentiles.sh
#sbatch  create_18min_percentiles_fine.sh

sbatch  create_18min_percentiles_year.sh
sbatch  create_18min_percentiles_fine_year.sh

#part_B_ID=$(sbatch  create_timselsum_24min.sh)
#sbatch  create_24min_percentiles.sh
#sbatch  create_24min_percentiles_fine.sh

sbatch  create_24min_percentiles_year.sh
sbatch  create_24min_percentiles_fine_year.sh

#part_B_ID=$(sbatch  create_timselsum_30min.sh)
#sbatch  create_30min_percentiles.sh
#sbatch  create_30min_percentiles_fine.sh

sbatch  create_30min_percentiles_year.sh
sbatch  create_30min_percentiles_fine_year.sh

#part_B_ID=$(sbatch  create_timselsum_60min.sh)
#sbatch  create_60min_percentiles.sh
#sbatch  create_60min_percentiles_fine.sh


sbatch  create_60min_percentiles_year.sh
sbatch  create_60min_percentiles_fine_year.sh






