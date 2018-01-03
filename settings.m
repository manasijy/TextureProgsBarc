function s = settings();

%%%% This file sets the settings for all ofthe smaples for processing
%%% crystal symmetry
s.CS = crystalSymmetry('hexagonal',[1 1 1.59]*3.2, [90 90 120]*degree);% % 
% % % specimen symmetry
s.SS = specimenSymmetry('orthorhombic');
%%%% 

s.TITLE_FONT = 18;
s.POLE_FIGURE_PLOTTING_OPTIONS = {'complete',
                                 'antipodal'
                                 };
s.POLE_FIGURE_COLOR_RANGE = [1 8];
s.POLE_FIGURE_ROTATION_ANGLE = 0*degree;

s.ODF_COLOR_RANGE = [1 9];
s.ODF_SECTION_FOR_PLOTTING ='PHI2';
s.ODF_NUMBER_OF_SECTIONS_FOR_PLOTTING = 12;
s.ODF_PLOT_FONT_SIZE = 14;

s.ORIENTATIONS_FOR_VOLUME_FRACTIONS = [[0 0 0];
                                       [45 45 45]]*degree; 