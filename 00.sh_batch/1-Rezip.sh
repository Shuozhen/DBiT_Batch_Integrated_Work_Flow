#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=1-Rezip
#SBATCH --ntasks=1 --cpus-per-task=2
#SBATCH --mem-per-cpu=16g 
#SBATCH --time=120:00:00

SampleID=$1
INDIR=$2

for i in "$INDIR/01.rawdata/$SampleID/*.gz";do gzip -d $i;done
for i in "$INDIR/01.rawdata/$SampleID/*.fq";do gzip $i;done
