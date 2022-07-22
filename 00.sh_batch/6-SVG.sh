#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=6-SVG
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=4g 
#SBATCH --time=120:00:00

module load Perl/5.28.0-GCCcore-7.3.0
export PERL5LIB=/gpfs/ysm/project/fan/sb2723/00.bin/PerlIO-gzip-0.20/mybuild/lib/perl5/site_perl/5.28.0/x86_64-linux-thread-multi:$PERL5LIB

SampleID=$1
INDIR=$2

# position.txt is the output of Ai.
perl /gpfs/ysm/project/fan/sb2723/00.bin/batch/5-svgto.pl $INDIR $SampleID
# flipped is optional, if skip this step, be careful about the file names
perl /gpfs/ysm/project/fan/sb2723/00.bin/batch/5-select_under_tissue.pl $INDIR/$SampleID/$SampleID\_svg-pos.txt $INDIR/$SampleID/$SampleID\_stdata.updated.flipped.tsv > $INDIR/$SampleID/$SampleID\_stdata.updated.flipped.aligned.tsv
perl /gpfs/ysm/project/fan/sb2723/00.bin/batch/6-qa.pl $INDIR/$SampleID/$SampleID\_stdata.updated.flipped.aligned.tsv > $INDIR/$SampleID/$SampleID\_aligned.svg
