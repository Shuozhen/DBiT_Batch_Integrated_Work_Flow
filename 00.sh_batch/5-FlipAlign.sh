#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=5-FlipAlign
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=4g 
#SBATCH --time=120:00:00

module load Perl/5.28.0-GCCcore-7.3.0
export PERL5LIB=/gpfs/ysm/project/fan/sb2723/00.bin/PerlIO-gzip-0.20/mybuild/lib/perl5/site_perl/5.28.0/x86_64-linux-thread-multi:$PERL5LIB

SampleID=$1
INDIR=$2

# Flip the data over the y axes, nearly all my data need to change this. Omit if the orientation of the data is coordinate with scan pic. Adjust if there's other flips 
perl /gpfs/ysm/project/fan/sb2723/00.bin/batch/5-change_xy.pl $INDIR/$SampleID/$SampleID\_stdata.updated.tsv > $INDIR/$SampleID/$SampleID\_stdata.updated.flipped.tsv

# generate the initial svg, download the file to local, and manually select the position in Ai.
perl /gpfs/ysm/project/fan/sb2723/00.bin/batch/6-qa.pl $INDIR/$SampleID/$SampleID\_stdata.updated.flipped.tsv > $INDIR/$SampleID/$SampleID.svg

