%% Import Script for PoleFigure Data
%
% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any chages to this scrip.

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = symmetry('m-3m');

% specimen symmetry
SS = symmetry('mmm');

% plotting convention
plotx2north

%% Specify File Names

% path to files
pname = 'E:\Trainees\dgfs\SA-508- XRD- for texure density-27Nov15\solid-BT\';

% which files to be imported
fname = {...
[pname '002.xrdml'], ...
[pname '011.xrdml'], ...
[pname '013.xrdml'], ...
[pname '112.xrdml'], ...
};

% defocusing background
pname = 'E:\Trainees\dgfs\SA-508- XRD- for texure density-27Nov15\powder-sample\';
fname_defbg = {...
[pname '002.xrdml'], ...
[pname '011.xrdml'], ...
[pname '013.xrdml'], ...
[pname '112.xrdml'], ...
};


%% Specify Miller Idice

h = { ...
Miller(0,0,2,CS), ...
Miller(0,1,1,CS), ...
Miller(0,1,3,CS), ...
Miller(1,1,2,CS), ...
};



%% Import the Data

% create a Pole Figure variable containing the data
pf = loadPoleFigure(fname,h,CS,SS,'interface','xrdml');

% defocussing background
pf_defbg = loadPoleFigure(fname_defbg,h,CS,SS,'interface','xrdml');

% correct data
pf = correct(pf,'defbg', pf_defbg);


%% Visualize the Data

% plot of the raw data
plot(pf)

%% ODF estimatio

% estimate some ODF
odf = calcODF(pf)

%% Plot Caclulated Pole Figures

plotpdf(odf,h)
