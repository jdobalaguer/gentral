if ~parameters.train_do; return; end
if end_of_training; return; end

% training screen
ptb_screen_training;

%% BLOCK
while ~end_of_task && ~end_of_training
    % new block
    set_block;
    % block screen
    ptb_screen_block;

    %% TRIAL
    while (~end_of_task) && (~end_of_block)
        % new trial
        set_train_trial;
        % trial screen
        ptb_screen_trial;
        % feedback screen
        ptb_screen_feedback;
        % isi screen
        ptb_screen_isi;
        % end of block
        set_train_endofblock;
    end
    % end of task
    set_endoftraining;
end
