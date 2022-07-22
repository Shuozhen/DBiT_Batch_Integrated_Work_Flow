# sample ID
SAMPLEID=$1
# project folder
INDIR=$2
SPECIES=$3

# unzip and rezip the raw data
sh /gpfs/ysm/project/fan/sb2723/00.sh_batch/1-Rezip.sh $SAMPLEID $INDIR

# filter based on barcodes, rearrange read format to be compatible with st-pipeline
# using 2-effective.pl
sh /gpfs/ysm/project/fan/sb2723/00.sh_batch/2-RearrangeRead.sh $SAMPLEID $INDIR

# run st-pipeline, choose human(1) or mouse(2)
if [$SPECIES == 1]
then
        sh /gpfs/ycga/project/fan/sb2723/00.sh_batch/3-stpipeline_hg.sh $SAMPLEID $INDIR
elif [$SPECIES == 2]
then
        sh /gpfs/ycga/project/fan/sb2723/00.sh_batch/3-stpipeline_mm.sh $SAMPLEID $INDIR
else
        echo "Wrong Species info"
        break
fi

# convert gene IDs to names
sh /gpfs/ysm/project/fan/sb2723/00.sh_batch/4-ConvertToNames.sh $SAMPLEID $INDIR

# Flip and Align using position info (optional)
sh /gpfs/ysm/project/fan/sb2723/00.sh_batch/5-FlipAlign.sh $SAMPLEID $INDIR/03.stpipeline/
# initial SVG for alignment
sh /gpfs/ysm/project/fan/sb2723/00.sh_batch/6-SVG.sh $SAMPLEID $INDIR/03.stpipeline/
