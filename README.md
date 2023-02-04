# Kinetics of blood cell differentiation during hematopoiesis revealed by quantitative long-term live imaging
Open source repository for source code for "Kinetics of blood cell differentiation during hematopoiesis revealed by quantitative long-term live imaging" (Ho K.Y.L. &amp; Carr R.L, Dvoskin A.D. &amp; Tanentzapf G.).
---
### System Requirements
- See [System Requirements for MATLAB](https://www.mathworks.com/support/requirements/matlab-system-requirements.html).
- See [Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)
- This script has been tested on MATLAB R2021a and R 4.0.3.

### Installation
- See [Download MATLAB](https://www.mathworks.com/downloads) to download MATLAB. MATLAB files can be downloaded from [this](https://github.com/Tanentzapf-Lab/LiveImaging_HematopiesisKinetics_Infection_Ho_Carr/) repository.
- See [Download R](https://www.r-project.org/) to download R. R files can be downloaded from [this](https://github.com/Tanentzapf-Lab/LiveImaging_HematopiesisKinetics_Infection_Ho_Carr/) repository.

### Instructions for Use - HeatMap Analysis (MATLAB)
- Ensure you have downloaded all MATLAB files from [this](https://github.com/Tanentzapf-Lab/LiveImaging_HematopiesisKinetics_Infection_Ho_Carr/) repository. This includes 'rangeSelect.m', 'rotateImage.m', 'runHeatMap.m' and 'buildHeatMap.m'.
- A figure documenting the process is available in the paper.
- Images for analysis must be in '.tif' format and stored within the same folder, and we recommend marking any landmark structures on the images directly prior to analysis to ensure consistent orientation.
#### runHeatMap
- Open MATLAB, ensure all files are in the workspace, and run 'runHeatMap.m'. 
- Declare the dimension for the heatmaps (this paper used 5 to create 20% sections). This will create a dxd matrix as the heatmap. Note this dimension down, as it will be required later when building the composite heatmaps.
- The file is designed for batch processing, and will request a folder of images to analyze.
- For each image, a rectangle will appear to facilitate rotation. Click and drag the corner of the rectangle to orient the image according to your landmark structures and the image origin.
- Press 'return' to confirm the rotation.
- If the image is mirrored on the axis, you will have the option to flip the image. Selecting 'left' will maintain the current alignment, selecting 'right' will mirror the image.
- Next, select your bounds for the heatmap. A cross hair tool will appear to create points on the image. 
- Once you have closed your selection, double click inside the selection to confirm. More information can be found at the [ROIpoly MATLAB documentation page](https://www.mathworks.com/help/images/ref/roipoly.html).
- Finally, select a single point on the image to denote the event/area you want to mark on the heatmap. This software only allows for one per image, you will need to duplicate the image and run it twice if there is more than one.
- Press 'return' to confirm the event location.
- The script will output a single '.mat' file with the same name as your image, which is the single heatmap component from that image.
- Repeat this process for all images in the folder.
#### runBuildHeatMap
- Open MATLAB, ensure all files are in the workspace, and run 'runBuildHeatMap.m'. 
- Ensure all your '.mat' files are in the same folder. Recall the dimensions you set prior (note: all '.mat' files must have the same dimensions to be combined into a single heatmap).
- Select the folder containing all desired '.mat' files.
- Enter a name for your heatmap. Note this will also name the figure generated later.
- Enter the dimension used to create your heatmap components previously.
- The script will output a figure of your combined heatmap components, as well as a '.xslx' file with the heatmap for alternative formatting.

### Instructions for Use - Slope Calculation via Linear Regression (R)
- Ensure you have downloaded the "slope.r" file from [this](https://github.com/Tanentzapf-Lab/LiveImaging_HematopiesisKinetics_Infection_Ho_Carr/) repository. 
- Data must be manually segmented prior to analysis via linear regression (as seen in Figure 5G). Failure to do so will affect the generated values.
- Manually identify and remove any outliers.
- Load the data and script into the R environment, ensure the y-vector represents your isolated ratio data, and run.
- Slope from linear regression will be printed as variable output 's'.
