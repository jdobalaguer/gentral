
end_of_task = 0;

if isempty(data.exp_block)
    i_block = 0;
    end_of_training = 0;
else
    i_block = max(data.exp_block);
    end_of_training = 1;
end
