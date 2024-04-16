### How to set Matlab on your local machine and run jobs on Taco server

## Prerequisites


- Your Matlab version must be R2024a or later.
- You must have the Matlab Parallel Computing Toolbox installed.  To see what toolboxes are installed, type the ver command in the Matlab command window.  You should see Parallel Computing Toolbox listed.
- You must ssh to the cluster at least once before trying to submit any jobs from Matlab.


## Download Matlab from BCM 


      1. Go to our MATLAB Portal provided by Baylor College of Medicine (https://www.mathworks.com/academia/tah-portal/baylor-college-of-medicine-30720220.html) and Select ‘Sign in to get started’ under the Get MATLAB and Simulink section.
      2. Log into your MathWorks account that is associated to your BCM email address.
              a. If you have not already created a Mathworks account you will need to do so using your BCM email address only.
      3. Click the download button for the current release. (Users can also download previous releases here).
      4. Choose a supported platform and download the installer.


## Installation


To install and Activate:

      1. Run the installer.
      2. In the installer, select Log in with a MathWorks Account and follow the online instructions.
      3. When prompted to do so, select the Academic – Total Headcount license labeled Individual.
      4. Select the products you want to download and install.
      5. After downloading and installing your products, keep the Activate MATLAB checkbox selected and click Next.
      6. Follow the prompts to activate MATLAB.


## Connect to Taco server

Download the Cluster Plugin Scripts
In order to submit jobs from your desktop, you will need to install some custom Matlab plugin scripts that know how to interact with the Slurm job scheduler on a cluster.  

Use the links below to download the appropriate script bundle.

💻 For Windows/Mac users:



Unzip this file [https://bcmedu.sharepoint.com/:u:/r/sites/MHGCPUsersGroup2/Shared%20Documents/Documentation/mhgcp-config-cluster.zip?csf=1&web=1&e=YqtGiu] on your local computer and put it your local MatLab path (for example, "~/Documents/MATLAB/mhgcp-config-cluster" for Mac or "%USERPROFILE%/Documents/MATLAB" for Windows)

Open MatLab and browse to that folder, right-click on the clusterConfig.m file and choose "Run"

- When prompted for Username you shoud enter your Baylor ECA (i.e. cmholder or u222222)
- When prompted for your lab storage location enter the path to the root of your lab's storage volume (For example Chen Lab users would enter /storage/chen while Lichtarge Lab users would enter /storage/lichtarge.
  - These entries are CASE SENSITIVE to be careful how they are entered.
  - Please note that the script will automatically append /home/username/matlab to your entryt to create a default value of /storage/lab/home/ECA/matlab so be careful.

Follow the instructions under the command window screen



💃 💃 💃voilà💃💃💃



