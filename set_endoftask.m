
% minutes counter
if parameters.task_by_min
    if isfield(ptb,'time_stop')
        gs = GetSecs - ptb.time_start(end) + sum(ptb.time_stop - ptb.time_start(1:(end-1)));
    else
        gs = GetSecs - ptb.time_start(end);
    end
    gm = gs/60;
    if parameters.task_min <= gm
        end_of_task = 1;
    end
end
    
% block counter
if parameters.task_by_blocks
    if parameters.task_blocks <= i_block
        end_of_task = 1;
    end
end
