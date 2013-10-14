
clearvars -except data parameters participant ptb

%% SET
set_parameters;
set_participant;
data_create;

%% EXPERIMENT
try
    %% START
    % initialise psychtoolbox
    ptb_start;
    % show introduction screen
    ptb_screen_intro;
    
    %% TRAINING
    % set training
    set_train;
    % do training
    do_training;
    % stop if exited
    if end_of_task; ptb_stop; break; end
    
    %% TASK
    % set task
    set_task;
    % do task
    do_task;
    
    %% END
    % end screen
    ptb_screen_end;
    % close psychtoolbox
    ptb_stop;
    
catch err
    % close psychtoolbox
    ptb_stop;
    % save data
    data_error;
    % rethrow error
    rethrow(err);
end

clearvars -except data parameters participant ptb
