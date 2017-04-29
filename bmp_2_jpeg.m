% Demo to create JPG copies of BMP files in a different folder.
% inputFolder = fileparts(which('cameraman.tif')) % Determine where demo folder is (works with all versions).
inputFolder = fullfile(pwd, 'Advitiy\Telescope\Image Conversion\BMP Data');
filePattern = fullfile(inputFolder, '*.bmp')
% Get list of all BMP files in input folder
bmpFiles = dir(filePattern)
% Create the output folder:
outputFolder = fullfile(pwd, 'Advitiy\Telescope\Image Conversion\JPEG Data')
if ~exist(outputFolder, 'dir')
	mkdir(outputFolder);
end
figure;
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Loop over all bmp files, making a jpg version 
% of them in the output folder.
for k = 1 : length(bmpFiles)
	% Read in .bmp file
	baseFileName = bmpFiles(k).name;
	fullFileNameInput = fullfile(inputFolder, baseFileName)
	rgbImage = imread(fullFileNameInput);
	subplot(1, 2, 1);
	imshow(rgbImage);
	title('Original image', 'FontSize', 30);
	drawnow;
	
	% Prepare output file name
	fullFileNameOutput = fullfile(outputFolder, baseFileName);
	% Converts to JPEG and gives it the .jpg extension
	fullFileNameOutput = strrep(lower(fullFileNameOutput), '.bmp', '.jpg')
	imwrite(rgbImage,fullFileNameOutput);
    % Reloads it in a JPEG format to see how bad the compression artifacts are.
	rgbImage = imread(fullFileNameOutput);
	subplot(1, 2, 2);
	imshow(rgbImage);
	title('Recalled JPG image', 'FontSize', 30);
	drawnow;
	pause(1);
end
% Open Windows Explorer to the output folder:
winopen(outputFolder);
