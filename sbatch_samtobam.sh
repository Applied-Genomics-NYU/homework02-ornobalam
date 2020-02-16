#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=Homework02
#SBATCH --output=slurm_%j.outds

module load samtools/intel/1.9

for file in *.sam
do
	samtools view -bS ${file} > ${file::-4}.bam
done
