#!/bin/bash

#SBATCH -J sim3_test              # job name
#SBATCH -p parallel               # partition: parallel, smp
#SBATCH -C broadwell              # CPU type: broadwell (40 Kerne), skylake (64 Kerne)
#SBATCH -c 8
#SBATCH -A m2_jgu-sim3           # project name
#SBATCH -n 1                     # Total number of tasks
#SBATCH -t 00:30:00              # Run time (hh:mm:ss)

#SBATCH --mail-user=jgoettma@uni-mainz.de
#SBATCH --mail-type=ALL


module purge # ensures vanilla environment
module load lang/R # will load most current version of R

# do not forget to export OMP_NUM_THREADS, if the library you use, supports this
# not scale up to 64 threadsq
#export OMP_NUM_THREADS=64
                          
srun R --no-save --slave -f sim3.R

