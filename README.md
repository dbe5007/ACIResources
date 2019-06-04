# ACI-ICS Lab Manual
*Author: Daniel Elbich*
*Contact: delbich10@gmail.com*

*Getting Started*

    ACI is a high powered computing system currently in use at PSU. This is a Linux based system and is best used through the command line (e.g. Terminal, bash shell scripting). There is a GUI (graphical user interface) access to the system which will take you to a Linux desktop for more point and clicker interfacing. It is critical to note that the GUI interface is where low resource tasks should be performed, such as viewing MRI data or working on scripts/data pipelines. More high resource tasks, such as preprocessing a large batch of subject data (e.g. things that will take hours, not minutes) should NOT be run here as they take away computing resources from all users and is against ICS protocols. 

    You can get by using the GUI for most things, but at some point it will become more efficient to use the command line to work here. While the system has a specific organization/setup for the university, this type of server is commercially available and employed by many universities. As such, if this manual or the PSU website (https://ics.psu.edu/computing-services/ics-aci-user-guide/) is missing a piece of information, it is very likely you can find it through online searches including ‘aci’ (e.g. “aci loading software”).



```createParams.m```
Creates parameter MAT file with all information
Requires AFNI for mask transformation from standard space

```EstimateModel.m```
Estimates single trial model specified by ```SpecifyModel.m```
Requires SPM
Requires subfunction ```setModelParams.m``` to be on MATLAB path

```RunMVPAClassification.m```
Runs MVPA SVM or Searchlight classification within regions provided by user
Requires CoSMoMVPA
SVM output saved to CSV & MAT files; Searchlight saved as weighted .nii file

```RunRSA.m```
(UNDER DEVELOPMENT!!!) Runs MVPA SVM or Searchlight classification within regions provided by user
Requires CoSMoMVPA

```SpecifyModel.m```
Creates single trial models for given functional task/runs
Requires behavioral file to load and tag trial type information

## Running the pipeline
Below is order of scripts to be run in the pipeline assuming a new data project:


1. ```createParams.m```          - Dialog will come up querying if Specify/Estimate has been run. Select 'No' and a temporary params file will be created to be used for Specify & Estimate scripts (```specify_AnalysisName_model_params.mat```)
2. ```SpecifyModel.m```          - Run using ```specify_model_params.mat``` as input.
3. ```EstimateModel.m```         - Run using ```specify_model_params.mat``` as input.
4. ```createParams.m```          - Rerun choosing 'Yes' at Specify/Estimate question. File ```specify_model_params.mat``` will be deleted. Provide input to addition dialog boxes as needed.
5. ```RunMVPAClassification.m``` - Perform MVPA classification using final params file created from ```createParams.m``` script (e.g. ```params_AnalysisName_Condition1_Condtion2.mat```)



See 'publication' for more information

