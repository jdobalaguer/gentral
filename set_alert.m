
if ~parameters.flag_alertmail; return; end

%% End of task
if end_of_task
    tools_alertmail(['gentral: ',participant.name,': finished']);
end

%% Blocks
if ~exist('i_alertblock','var')
    i_alertblock = 1;
end
if parameters.task_by_blocks
    while parameters.alert_blocks(i_alertblock)<= i_block
        tools_alertmail(['gentral: ',participant.name,': ',num2str(parameters.alert_blocks(i_alertblock)),' blocks']);
        i_alertblock = i_alertblock+1;
    end
end

%% Minutes
if ~exist('i_alertmin','var')
    i_alertmin = 1;
end
if parameters.task_by_min
    if isfield(ptb,'time_stop')
        gs = GetSecs - ptb.time_start(end) + sum(ptb.time_stop - ptb.time_start(1:(end-1)));
    else
        gs = GetSecs - ptb.time_start(end);
    end
    gm = gs/60;
    while parameters.alert_min(i_alertmin) <= gm
        tools_alertmail(['gentral: ',participant.name,': ',num2str(parameters.alert_min(i_alertmin)),' mins']);
        i_alertmin = i_alertmin+1;
    end
end

