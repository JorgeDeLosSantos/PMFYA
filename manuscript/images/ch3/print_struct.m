function print_struct(S)
% fields = fieldnames(S);
rec_level = 0;
printrec(S);
    function printrec(S)
        fields = fieldnames(S);
        for k = 1:length(fields);
            fprintf('%s\n',fields{k});
            val = getfield(S,fields{k});
            if ~isstruct(val)
                fprintf('%g\n',val);
            else
                rec_level = rec_level + 1;
                printrec(val);
            end
        end
    end
end