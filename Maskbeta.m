function [BW, maskedRGBImagedefault] = Maskbeta(RGB)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder App. The colorspace and
%  minimum/maximum values for each channel of the colorspace were set in the
%  App and result in a binary mask BW and a composite image maskedRGBImage,
%  which shows the original RGB image values under the mask BW.
%------------------------------------------------------


% Convert RGB image to chosen color space
I = RGB;

% Define thresholds for channel 1 based on histogram settings
channel1Min = 206.000;
channel1Max = 255.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 206.000;
channel2Max = 255.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 206.000;
channel3Max = 255.000;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Invert mask
BW = ~BW;

% Initialize output masked image based on input image.

maskedRGBImagedefault = RGB;

% Set background pixels where BW is false to 0.

maskedRGBImagedefault(repmat(~BW,[1 1 3])) = 255;

end
