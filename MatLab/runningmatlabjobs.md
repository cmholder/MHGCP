# How submit MatLab jobs to the Taco Cluster

## Prerequisites
- You must have MatLab installed on your local computer
- You must be on the BCM campus network, WiFi, or VPN
- Your lab must have a subscription to the Taco Cluster
- You must have MatLab installed INCLUDING the MatLab Parallel Computing Toolbox
- You must haev downloaded and configured the MHGCP Cluster Plugins. See: [https://github.com/cmholder/MHGCP/tree/main/MatLab]

## Job Submission Template
Download the run_serial_job.m file from [https://github.com/cmholder/MHGCP/blob/main/MatLab/run_serial_job.m] and save it to your local computer.  This will be your template for job submission.

## Running a job
1. Once you are ready to submit your MatLab scipt to the Taco cluster you will need to make sure all your chages are saved.
2. Make a copy of the run_serial_job.m file for your script
> [!TIP]
> It is suggested that you name your script something referential to the MatLab script.  For example, if your script is named "sinewave.m" you would call the job submission script "run_sinewave_job.m"
3. Update the AdditionalProperties section of the script with the appropriate values
4. When you are ready, from within MatLab run the submission script


## AdditionalProperties Explained
```MATLAB
% Use the AdditionalProperties property of the cluster object to set job specific details:
c.AdditionalProperties.ntasks = 1;                             % Number of Tasks
c.AdditionalProperties.NumNodes = 1;                           % Number of nodes requested 
c.AdditionalProperties.NumCPU = 1;                             % Number of CPU per Process
c.AdditionalProperties.MemPerNode = '1G';                      % Memory per Node Units are (K|M|G|T)
c.AdditionalProperties.Partition = 'mhgcp';                    % Cluster partition (mhgcp|interactive|short|gpu)
c.AdditionalProperties.WallTime = '00-0:10:00';                   % Max wall time DD-HH:MM:SS
```

### c.AdditionalProperties.ntasks = 1;
Specify the number of tasks to run. Request that srun allocate resources for ntasks tasks. The default is one task per node. Same as ```-n 1``` or ```--ntasks=1```
> [!TIP]
> In most situations the default of 1 task per node is sufficient.  Increasing this could lead to longer time in queue.

### c.AdditionalProperties.NumNodes = 1;
Specifies the number of nodes required for running the job.  Same as ```-N 1```
> [!TIP]
> See [MHGCP Node Specs](https://teams.microsoft.com/l/entity/1c256a65-83a6-4b5c-9ccf-78f8afb6f1e8/_djb2_msteams_prefix_2081514502?context=%7B%22channelId%22%3A%2219%3A3544f5831fae42bd9dde9e9d4a420bea%40thread.tacv2%22%7D&tenantId=a83dba53-124d-4d32-88f0-b72889a9e926) for a list of nodes and partitions

### c.AdditionalProperties.NumCPU = 1;
Request that ncpus be allocated per process. Same as ```--cpus-per-task=1```

### c.AdditionalProperties.MemPerNode = '1G';
Specify the real memory required per node.  Same as ```--mem=1G```
> [!TIP]
> This value can be specified in Killobytes, Megabytes, Gigabytes, or Terrabytes by usign the proper suffix [K|M|G|T].  For example to request 512 Megabytes one would set the value to ```c.AdditionalProperties.MemPerNode = '512M';```

### c.AdditionalProperties.Partition = 'mhgcp';
Specifies the partition to use for processing.  Acceptable vaues are [mhgcp|short|interactive|gpu].
> [!NOTE]
> GPU usage has NOT been implement yet for MatLab on the MHGCP cluster.

### c.AdditionalProperties.WallTime = '00-0:10:00';
Specifies the expected duration of the job.
> [!TIP]
> It is critical to really closely estimate the REAL duration of the job.  Overestimating the duration will lead to longer queue times.  Underestimating the duration will lead to the job not having time to complete.

## AdditionalSubmitArgs Explained
```
% To set the Slurm job name:
%        c.AdditionalProperties.AdditionalSubmitArgs = '--job-name=xxx';
%    NOTE:  if --job-name is not set here then Matlab assigns the job name itself as "JobN" where
%    N is determined by Matlab.
c.AdditionalProperties.AdditionalSubmitArgs = '--job-name=MatLabJob';
```
This option is used to pass in any additional job arguments.  At a minimum the ```--job-name=MatLabJob``` should be changed to something that is representative of your actual job request.  For users that work in multiple labs you can use this to pass in the ```--account=<lab>``` so that your jobs are allocated to the proper billing account.

## Running your script
```
% Below, submit a batch job that calls the 'mywave.m' script.
% Also set the parameter AutoAddClientPath to false so that Matlab won't complain when paths on 
% your desktop don't exist on the cluster compute nodes (this is expected and can be ignored).

myjob = batch(c,'mywave','AutoAddClientPath',false);
```
Change the 'mywave' parameter to match the name of your MatLab script that you want to execute.  In this example we would execute a script called mywave.m.
> [!WARNING]
> Please note that the run_serial_job.m file MUST be in the same folder as the script you want to submit to the cluster.

## Visualizing Results
```
% load the 'A' array (computed in mywave) from the results of job 'myjob':
load(myjob,'A');

%-- plot the results --%
plot(A);
```
Simply replace these directives with those needed to show the results of your job.


