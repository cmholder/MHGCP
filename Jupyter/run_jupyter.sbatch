#!/usr/bin/bash 
#SBATCH --mem-per-cpu 4000 
#SBATCH --partition=interactive 
#SBATCH --job-name jupyter_tunnel 
#SBATCH --output ~/slurm_out/jupyter-log-%J.out 
#SBATCH --error ~/slurm_out/jupyter-log-%J.err 
#SBATCH --time 0-12:00

## Replace the path below to the root of your Jupyter installation
JUPYTER_ROOT="PATH/TO/JUPYTER"

## get tunneling info 
XDG_RUNTIME_DIR="" 
ipnport=$(shuf -i8000-9999 -n1) 
ipnip=$(hostname -i) 

## print tunneling instructions to jupyter-log-{jobid}.txt 
echo -e "\n\n   Copy/Paste this in your local terminal to ssh tunnel with remote " 
echo        "   ------------------------------------------------------------------" 
echo        "   ssh -N -L $ipnport:$ipnip:$ipnport <your ECA>@taco.grid.bcm.edu    " 
echo        "   ------------------------------------------------------------------" 
echo -e "\n\n   Then open a browser on your local machine to the following address" 
echo        "   ------------------------------------------------------------------" 
echo        "   localhost:$ipnport                                                " 
echo -e     "   ------------------------------------------------------------------\n\n" 
sleep 1 

## start an ipcluster instance and launch jupyter server 
$JUPYTER_ROOT/.local/bin/jupyter notebook --no-browser --port=$ipnport --ip=$ipnip 

 
