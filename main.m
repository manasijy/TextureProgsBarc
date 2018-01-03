%% main programme that calls all other routines
clear all;
close all;
s = settings();
tic

%%%% Add any folder u wish to be processes below in the same format
sample_folder_names = { 'C:\Documents and Settings\nilesh\My Documents\MATLAB\MKY1\mtex_practice\CR-1700-10';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\680\680B_texture';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\680\680C_texture';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\820\820A_texture';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\820\820B_texture';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\820\820C_texture';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\1700\1700A_texture';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\1700\1700B_texture';
%                         'E:\Trainees\dgfs\pushpa\texture_results\pushpa\1700\1700C_texture';
%                          'E:\Trainees\dgfs\pushpa\texture_results\pushpa\10000\10000A_texture';
%                          'E:\Trainees\dgfs\pushpa\texture_results\pushpa\10000\10000B_texture';                   
%                          'E:\Trainees\dgfs\pushpa\680\680_texture';
%                          'E:\Trainees\dgfs\pushpa\820\820_texture';
%                          'E:\Trainees\dgfs\pushpa\1700\1700_texture';
%                           'E:\Trainees\dgfs\pushpa\10000\10000_texture';
                        
    
    
    
                     % 'E:\Current Projects\collobarrations - Auxilary\rath_pied\Heat Treated\B1';
                      % 'E:\Current Projects\collobarrations - Auxilary\rath_pied\Heat Treated\B2';
                       };
           
                    
MeasuredPoleFigures = {'0002';
                        '01-11';
                        '01-12';
                        '01-13'; 
                        };   


                    
for i=1:numel(sample_folder_names)
   
    
    pname = sample_folder_names{i};
    
    all_results(i) = evaluate_odf(pname,MeasuredPoleFigures,s);
    fprintf(1,'Completed evaluating ODF of %d samples out of total %d \n',i,numel(sample_folder_names));
end

save all_results;
toc

%%

for i=1:numel(all_results)
    
   temp_odf = all_results(i).ODF;
   temp_h = all_results(i).MeasuredPoleFigures;
   
   name = all_results(i).Sample_Name;
   ind = find(name == filesep);
    
   sample_name = name(ind(end)+1:end);
    
   
   figure,
   hold all
   %%plotpdf(temp_odf,temp_h,s.POLE_FIGURE_PLOTTING_OPTIONS);
     
   plotpdf(temp_odf,temp_h{1},'complete','antipodal');
   setcolorrange(s.POLE_FIGURE_COLOR_RANGE)
   colorbar;   
   title (sample_name,'FontSize',s.TITLE_FONT);
 
   hold off
   %%% saving png format file
   figure_name = strcat(name,filesep,'pole_figure');   
   print ('-dpng', figure_name);   
   %%%% saving the fig format file for future procssing   
   saveas(gcf,figure_name,'fig');
   
   %%% Now plotting the ODFs
   
   plot(temp_odf,s.ODF_SECTION_FOR_PLOTTING,'sections',s.ODF_NUMBER_OF_SECTIONS_FOR_PLOTTING,...
 'projection','plain','contourf','FontSize',s.ODF_PLOT_FONT_SIZE,'silent');
 setcolorrange(s.ODF_COLOR_RANGE);
  colorbar;
  %title (name,'FontSize',s.TITLE_FONT);
 
   %%% saving png format file
   figure_name = strcat(name,filesep,'odf_figure');   
   print ('-dpng', figure_name);   
   %%%% saving the fig format file for future procssing   
   saveas(gcf,figure_name,'fig');
   
    exported_odf_name=strcat(sample_name,'_odf','.txt');
    exportODF(temp_odf,exported_odf_name,'resolution',5*degree,'ZXZ','weights');
    kearns_file_name = 'kearns_results.txt';
   get_kearns(exported_odf_name,sample_name,kearns_file_name);
   
end
toc
%% Now comparing the individual pole figures for all of the samples

% % hold all
% % for i=1:numel(all_results(1).MeasuredPoleFigures)
% %    
% %     
% %     plotpdf(all_results(i).ODF,all_results(1).MeasuredPoleFigures{1},...
% %         'complete','antipodal');
% %     
% % end
% % 
% % hold off