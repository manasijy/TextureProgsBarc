%%% progtamme to plot the ODF from the ebsd data

FileName = 'E:\Trainees\dgfs\pushpa\zr-o 680-rex.ctf';

[PATHSTR,NAME,EXT,VERSN] = fileparts(FileName);
OutFile = strcat(PATHSTR,filesep,NAME,'.odf');

Ori_data = importdata(FileName,'\t',15);
Ori_data = Ori_data.data;
Weights = Ori_data(:,1)/sum(Ori_data(:,1));

FinalData = [Ori_data(:,7:9) Weights];

%FinalData(find(FinalData(:,1)==0))=[];

%%
fid = fopen (OutFile,'w');

fprintf(fid, 'Euler1 1 Euler2 Eulewr3  Weight\n');

fprintf(fid, '%6.2f %6.2f %6.2f %e\n',FinalData');

fclose(fid);

%%

% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any chages to this scrip.

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = symmetry('6/mmm',[1,1,1.59],'a||y');

% specimen symmetry
SS = symmetry('mmm');

% plotting convention
plotx2north

% Specify File Names

% path to files
pname = 'E:\Trainees\dgfs\pushpa\';

% which files to be imported
fname = {...
[pname 'zr-o 680-rex.odf'], ...
};


% specify kernel 
psi = kernel('de la Vallee Poussin','halfwidth',5*degree);

% create an EBSD variable containing the data
odf = loadODF(fname,CS,SS,'kernel',psi,'resolution',5*degree,'interface','generic' ...
  , 'ColumnNames', { 'Euler 1' 'Euler 2' 'Euler 3' 'Weight'}, 'Bunge');

%% Plot some Pole Figures
s = settings();
plotpdf(odf,[Miller(0,0,1),Miller(1,1,0)],'complete','antipodal')
 setcolorrange(s.POLE_FIGURE_COLOR_RANGE)