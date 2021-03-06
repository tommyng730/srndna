#!/bin/bash

# Note that Contrast N for PPI is always PHYS in these models.
# Remove for type-act or add if-statement to ignore/skip

for other in "type-nppi-dmn_sm-4" "type-nppi-ecn_sm-4" "type-ppi_seed-FFA_sm-4" "type-ppi_seed-Amyg_sm-4" "type-ppi_seed-VS_sm-4" "type-act_sm-4"; do
	for subrun in "7 unfair-fair" "8 soc-comp" "9 fairness_IG-OG" "10 fairness_IG-C" "11 fairness_OG-C"; do
	
		set -- $subrun
		copenum=$1
		copename=$2
		bash L3_task-all_model-01.sh ultimatum $copenum $copename $other &
		sleep 5
	
	done
done
	
for other in "type-ppi_seed-FFA_sm-4" "type-ppi_seed-Amyg_sm-4" "type-ppi_seed-VS_sm-4" "type-act_sm-4"; do
	for subrun in "7 rew-pun" "8 F-S" "9 F-C" "10 FS-C" "11 reward_F-S" "12 reward_S-C" "13 reward_F-C"; do
		set -- $subrun
		copenum=$1
		copename=$2
		bash L3_task-all_model-01.sh sharedreward $copenum $copename $other &
		sleep 5
	done
	for subrun in "10 rec-def" "11 face" "12 reciprocation_F-S" "13 F-S" "14 F-C" "15 S-C" "16 rec_SocClose" "17 def_SocClose" "18 rec-def_SocClose"; do
		set -- $subrun
		copenum=$1
		copename=$2
		bash L3_task-all_model-01.sh trust $copenum $copename $other &
		sleep 5
	done
done
