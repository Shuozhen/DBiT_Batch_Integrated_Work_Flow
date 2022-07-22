#!/bin/bash
#SBATCH --partition=general
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shuozhen.bao@yale.edu
#SBATCH --job-name=3-STpipeline_hg
#SBATCH --ntasks=1 --cpus-per-task=4
#SBATCH --mem-per-cpu=16g 
#SBATCH --time=120:00:00

SampleID=$1
INDIR=$2

FW=$INDIR/02.effective/$SampleID/$SampleID.R1.fq.gz
RV=$INDIR/02.effective/$SampleID/$SampleID.R2.fq.gz
MAP=/gpfs/ysm/project/fan/sb2723/00.database/hg38/STARindex
ANN=/gpfs/ysm/project/fan/sb2723/00.database/hg38/gencode.v39.annotation.gtf
CONT=/gpfs/ysm/project/fan/sb2723/00.database/hg38/STARindex_nc
ID=/gpfs/ysm/project/fan/sb2723/00.database/barcodes-AB.xls
OUTPUT=$INDIR/03.stpipeline/$SampleID
mkdir -p $INDIR/03.stpipeline/$SampleID
TMP=$INDIR/03.stpipeline/$SampleID/tmp
mkdir -p $INDIR/03.stpipeline/$SampleID/tmp
EXP=$SampleID

st_pipeline_run.py \
  --output-folder $OUTPUT \
  --temp-folder $TMP \
  --umi-start-position 16 \
  --umi-end-position 26 \
  --ids $ID \
  --ref-map $MAP \
  --ref-annotation $ANN \
  --expName $EXP \
  --htseq-no-ambiguous \
  --verbose \
  --threads 16 \
  --log-file $OUTPUT/${EXP}_log.txt \
  --star-two-pass-mode \
  --no-clean-up \
  --contaminant-index $CONT \
  --disable-clipping \
  --min-length-qual-trimming 30 \
  $FW $RV
