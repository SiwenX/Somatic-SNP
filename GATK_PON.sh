#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=48:00:00
#PBS -l vmem=32gb
#PBS -M siwxu@iu.edu
#PBS -m abe

/gpfs/hps/soft/rhel7/gatk/4.0.4.0/gatk Mutect2 \
-R /gpfs/home/s/i/siwxu/Carbonate/database/hg38.fa \
-I /N/dc2/projects/ngs/users/siwxu/projects/myeloma/3/3_normal.sort.bam \
-tumor 3_normal \
--disable-read-filter MateOnSameContigOrNoMappedMateReadFilter \
-O /N/dc2/projects/ngs/users/siwxu/projects/myeloma/3/3_PON.vcf.gz
