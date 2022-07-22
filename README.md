# DBiT_Batch_Integrated_Work_Flow
Integrated work flow for DBiT batch processing, also available for individual test given correct parameters.

## Set the environment for ST-Pipeline and future R
Refer to the DBiT notes https://github.com/Shuozhen/DBiT-Notes written before.

## Steps for simple and integrated batch process
1. Make sure the name format goes coordinate with following structure
   - The work directory is DEDIR="/gpfs/ysm/project/fan/sb2723/", change the string to your own working directory for all of the scripts in _00.bin_batch_ and _00.sh_batch_
   - The _00.sh_batch_ and _00.bin_batch_ are under the working directory, the project folder named with ProjectID as _0x.xxxxx_ in the working directory too
   - The raw data folder is under the project folder, named as _01.rawdata_
   - The raw data folder includes the sub-folders named after the sample ID came from sequencing company, the raw data in the format of xxx_1.fq.gz and xxx_2.fq.gz should be in the sub-folders directly.
2. Use _batch_submit_ under _00.sh_batch_ to submit the profile, change the work directory DEDIR and sampleID to your own, choose the reference (mouse/human) using numbers
   - Go into the project folder in case the output files are in chaos and run the following sentence
   ```
   sbatch /yourworkingdirectory/00.sh_batch/batch_submit.sh 0x.xxxxx 1
   ```
3. Check your output for ST Pipeline in _03.stpipeline_ folder under the project directory, to see the log file, run the following sentence
   ```
   cat *log.txt
   ```
   
## To run the steps individually
Just change the sample ID and give the project directory for input parameters regarding each script, take _4-ConvertToNames.sh_ as an example
```
#SampleID=$1 INDIR=$2
sbatch /yourworkingdirectory/00.sh_batch/4-ConvertToNames.sh GBM1 /gpfs/ysm/project/fan/sb2723/06.GBM
```
