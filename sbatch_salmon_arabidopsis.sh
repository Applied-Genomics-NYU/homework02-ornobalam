#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=Homework02
#SBATCH --output=slurm_%j.outds

salmon index -t athal.fa -i athal_index

for read in *_1.fastq
do
	salmon quant -i athal_index -l A -1 ${read} -2 ${read::-7}2.fastq -p 8 --validateMappings -o quants/${read::-8}	
done
