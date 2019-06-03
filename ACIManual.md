# CANLab-Multivariate-Scripts
Pipeline to conduct MVPA or RSA on functional MRI data. Requires MATLAB, SPM, and CoSMoMVPA package (http://www.cosmomvpa.org/). Currently written for faceScene project but highly adaptable to other projects.


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

