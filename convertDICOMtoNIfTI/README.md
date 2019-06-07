# convertDICOMtoNIfTI 
**Note: README mirrors Word Document**

*Author: Daniel Elbich*

*Contact: delbich10@gmail.com*

*Getting Started*

This outlines how to convert a set (or sets) of MR data in DICOM format to NIfTI. DICOMs (Digital Imaging and Communications in Medicine) are the format in which data is exported from the scanner directly. They can either end in the extensions dcm or v2, However, while both are DICOMs, dcm is the more common extension, with some programs failing to correctly recognize and load the v2 file format. In contrast, NIfTI (Neuroimaging Informatics Technology Initiative) is the more commonly used format in nearly every MR analysis program, who’s creation was co-sponsored by NIH and NIMH. This ends in the extension nii, and can either be 3 dimensional (e.g. 1 folder of 200 images) or 4 dimensional (e.g. 1 single file containing 200 images). Some NIfTI files are gunzipped (extension nii.gz), which only means they are compressed (think like a zip file).

*Executing the script*

To execute the script, you will first need to download the dcm2niix program. This is the program that does the heavy lifting of actually converting the images (https://github.com/rordenlab/dcm2niix). Download and unzip the file into the directory of your choice. After this, you’ll need to update the path to this folder in the script for the variable ```dcm2niipath```. Next you’ll need to update the path to ```dataDir```. This will be the path to the project folder which contains (among other things) the folder with all your data in it. The final required change is to change the paths under the ‘Set File Paths’ comment. These reflect the actual paths where the data to be converted resides. 

Paths/variabes containing the placeholders ```NIIDATA```, ```dataset1```, ```dataset2```, and ```TASKNAME1``` should be updated to reflect the file organization and task names for your data. However these are not required to be changed and can be left alone for the purposes of testing. 

To run the script, type the filename into the terminal with the flag ```--subj``` followed by the subject ID or a text file containing all the subjects to be run organized as follows:

```
Subj001
Subj002
Subj003
```

The command would look similar to this:

```dicom2niibatch --subj subjList.txt```

This will create a 4D NIfTI file of the data and a json file containing relevant metadata obtained from the DICOM file. The files will be saved to the directory written in the script on the lines calling the dcm2niix program.
