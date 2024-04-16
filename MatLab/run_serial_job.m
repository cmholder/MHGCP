% run_serial_job
%   Run a serial (i.e. single CPU, non-parallelized) Matlab job on a cluster. 
%   Calls a script 'mywave' that executes a loop in serial.

 

% First initialize a cluster object based on an existing cluster profile.
c = parcluster('mhgcp R2024a');   %DO NOT CHANGE THIS

 

% Use the AdditionalProperties property of the cluster object to set job specific details:
c.AdditionalProperties.NumNodes = 1;                           % Number of nodes requested 
c.AdditionalProperties.MemUsage = '1G';                         % Memory per Node Units are (K|M|G|T)
c.AdditionalProperties.ProcsPerNode = 1;                       % Number of processors per node.
c.AdditionalProperties.QueueName = 'mhgcp';                    % Cluster partition (mhgcp|interactive|short|gpu)
c.AdditionalProperties.WallTime = '2:00:00';                   % Max wall time DD-HH:MM:SS



 

% To set the Slurm job name:
%        c.AdditionalProperties.AdditionalSubmitArgs = '--job-name=xxx';
%    NOTE:  if --job-name is not set here then Matlab assigns the job name itself as "JobN" where
%    N is determined by Matlab.
c.AdditionalProperties.AdditionalSubmitArgs = '';

% Before starting the job, start a job timer to see how long the job runs:

tic

 

% Below, submit a batch job that calls the 'myscript.m' script.
% Also set the parameter AutoAddClientPath to false so that Matlab won't complain when paths on 
% your desktop don't exist on the cluster compute nodes (this is expected and can be ignored).

myjob = batch(c,'myscript','AutoAddClientPath',false);

 

% see https://www.mathworks.com/help/parallel-computing/batch.html for additional tips and examples for using the batch command.


% Wait for the job to finish (on a busy server, this might not be a good strategy).  
wait(myjob)

 

% display the job diary (i.e. the Matlab standard output text, if any)
diary(myjob)

 

% load the 'A' array (computed in mywave) from the results of job 'myjob':

load(myjob,'A');

 

%-- plot the results --%
plot(A);

 

% print the elapsed time for the job:
toc
