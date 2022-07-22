#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=batch_submit
#SBATCH --ntasks=1 --cpus-per-task=20
#SBATCH --mem-per-cpu=16g 
#SBATCH --time=120:00:00

module load miniconda
conda activate spatialde
module load dSQ

ProjectID=$1
SampleID=$2
DEDIR="/gpfs/ysm/project/fan/sb2723"
INDIR=$DEDIR/$ProjectID

python $DEDIR/00.bin/SpatialDE_part1.py $INDIR/03.stpipeline/$SampleID/ $SampleID

rm -f run1.sh

for i in {2..30};do echo python $DEDIR/00.bin/SpatialDE_part2.py $INDIR $SampleID $i; done>>run1.sh

dSQ --job-file run1.sh --mail-type=ALL --partition=general --cpus-per-task=20 --mem-per-cpu=20g --submit
