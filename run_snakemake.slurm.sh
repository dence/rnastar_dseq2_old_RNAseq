#!/bin/sh
#SBATCH --job-name=old_MeJA_snakemake # Job name
#SBATCH --mail-type=ALL              # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=d.ence@mail.ufl.edu  # Where to send mail
#SBATCH --nodes=1                    # Use one node
#SBATCH --ntasks=1                   # Run a single task
#SBATCH --cpus-per-task=1            # Number of CPU cores per task
#SBATCH --mem=2gb                  # Total memory limit
#SBATCH --time=24:00:00              # Time limit hrs:min:sec
#SBATCH --output=old_MeJA_snakemake_%j.out     # Standard output and error log
#SBATCH --qos=kirst-b
#SBATCH --account=kirst
#SBATCH --partition=hpg1-compute



#Daniel Ence
#August 26, 2020


unset TMPDIR
module load python3

snakemake -np --dag --configfile config.yaml --snakefile Snakefile -c 100 --jobs 100 --directory . --cluster-config hipergator.cluster.json --cluster "sbatch --qos={cluster.qos} -p {cluster.partition} -c {cluster.c} -n {cluster.N} --mail-type=FAIL --mail-user=d.ence@ufl.edu -t {cluster.time} --mem={cluster.mem} -J "old_MeJA" -o old_MeJA_%j.out -D /home/d.ence/d.ence_peter_share/pinus_taeda_L/reanalysis_old_RNAseq/rnastar_dseq2_old_RNAseq" | dot -Tsvg > dag.svg
