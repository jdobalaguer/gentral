
% task screen
ptb_screen_task;

%% BLOCK
while ~end_of_task
    % new block
    set_block;
    % alert
    set_alert;
    % block screen
    ptb_screen_block;

    %% TRIAL
    while (~end_of_task) && (~end_of_block)
        % new trial
        set_task_trial;
        % trial screen
        ptb_screen_trial;
        % feedback screen
        ptb_screen_feedback;
        % isi screen
        ptb_screen_isi;
        % add data
        data_add;
        % end of block
        set_task_endofblock;
    end
    % save data
    data_save;
    % end of task
    set_endoftask;
end

% alert
set_alert;
