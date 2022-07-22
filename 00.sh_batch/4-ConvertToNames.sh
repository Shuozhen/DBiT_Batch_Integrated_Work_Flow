#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=4-ConvertToNames
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=4g 
#SBATCH --time=120:00:00

SampleID=$1
INDIR=$2

convertEnsemblToNames.py \
--annotation /gpfs/ysm/project/fan/sb2723/00.database/hg38/gencode.v39.annotation.gtf \
--output $INDIR/03.stpipeline/$SampleID/$SampleID\_stdata.updated.tsv $INDIR/03.stpipeline/$SampleID/$SampleID\_stdata.tsv
