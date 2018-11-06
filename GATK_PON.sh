#!/bin/bash

#PBS -l nodes=1:ppn=8
#PBS -l walltime=48:00:00
#PBS -l vmem=32gb
#PBS -M siwxu@iu.edu
#PBS -m abe

##Create PON
#/gpfs/hps/soft/rhel7/gatk/4.0.4.0/gatk Mutect2 \
#-R /gpfs/home/s/i/siwxu/Carbonate/database/hg38.fa \
#-I /N/dc2/projects/ngs/users/siwxu/projects/myeloma/3/3_normal.sort.bam \
#-tumor 3_normal \
#--disable-read-filter MateOnSameContigOrNoMappedMateReadFilter \
#-O /N/dc2/projects/ngs/users/siwxu/projects/myeloma/3/3_PON.vcf.gz
##Collate all the normal VCFs into a single callset
/gpfs/hps/soft/rhel7/gatk/4.0.4.0/gatk CreateSomaticPanelOfNormals \
-vcfs /N/dc2/projects/ngs/users/siwxu/projects/myeloma/2/2_PON.vcf.gz \
-vcfs /N/dc2/projects/ngs/users/siwxu/projects/myeloma/3/3_PON.vcf.gz \
-vcfs /N/dc2/projects/ngs/users/siwxu/projects/myeloma/4/4_PON.vcf.gz \
-vcfs /N/dc2/projects/ngs/users/siwxu/projects/myeloma/5/5_PON.vcf.gz \
-vcfs /N/dc2/projects/ngs/users/siwxu/projects/myeloma/8/8_PON.vcf.gz \
-O /N/dc2/projects/ngs/users/siwxu/projects/myeloma/Fivesamplepon.vcf.gz
