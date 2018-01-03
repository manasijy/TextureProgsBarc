
for i=1:numel(MeasuredPoleFigures)
str = MeasuredPoleFigures{i}
Miller_firstpart = sprintf('Miller(');

clear digit;
        for j=1:numel(str)
            digit(j) = str2num(str(j));
        end


Miller_secondpart = sprintf('%d, ',digit)
Miller_command (i)= {strcat(Miller_firstpart, Miller_secondpart,'CS)') };


end
final_command = [];
for i=1:numel(Miller_command)
    if (i==numel(Miller_command))
        temp = Miller_command{i};
    else
        temp = strcat(Miller_command{i},',');
    
    end
    final_command = strcat(final_command,temp);
end

final_command = strcat('h={',final_command,'};')

eval(final_command)