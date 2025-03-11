# Jupyter Notebooks on MHGCP Cluster 

Add the [run_jupyter.sbatch](https://github.com/cmholder/MHGCP/blob/main/Jupyter/run_jupyter.sbatch) file to your home directory

Edit the file to include your proper paths to the various files.
> [!WARNING]
> Do NOT change the random port range.  This will lead to an unstable connection.

Use sbatch to submit the script to the job scheduler
`sbatch ~/run_jupyter.sbatch`
