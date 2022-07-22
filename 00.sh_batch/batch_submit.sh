#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=batch_submit
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=2g 
#SBATCH --time=120:00:00

module load miniconda
conda activate st-pipeline
module load dSQ

ProjectID=$1
DEDIR="/gpfs/ysm/project/fan/sb2723/"
INDIR=$DEDIR$ProjectID

# human is 1, mouse is 2
SPECIES=$2

rm -f run.sh

# for test
#for i in GBM220415 GBM220418A;do echo sh 5-FlipAlign.sh $i $INDIR/03.stpipeline;done>>run.sh

for i in `ls $INDIR/01.rawdata/`;do echo sh complete.sh $i $INDIR $SPECIES;done>>run.sh
dSQ --job-file run.sh --mail-type=ALL --partition=general --cpus-per-task=16 --mem-per-cpu=4g --submit
