#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=2-RearrangeRead
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=4g 
#SBATCH --time=120:00:00

module load Perl/5.28.0-GCCcore-7.3.0
export PERL5LIB=/gpfs/ysm/project/fan/sb2723/00.bin/PerlIO-gzip-0.20/mybuild/lib/perl5/site_perl/5.28.0/x86_64-linux-thread-multi:$PERL5LIB

SampleID=$1
INDIR=$2

mkdir -p $INDIR/02.effective/
perl /gpfs/ysm/project/fan/sb2723/00.bin/batch/2-effective.pl  -indir $INDIR/01.rawdata -outdir $INDIR/02.effective -insertsize $SampleID
