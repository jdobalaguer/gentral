
%% Get key

% no response
trialstruct.resp_gs = nan;
trialstruct.resp_rt = nan;
trialstruct.resp_key = nan;
trialstruct.resp_cor = nan;

% press key
while 1
    tmp_gs = GetSecs();
    
    % time limit
    if  parameters.flag_timeresp && (tmp_gs > ptb.screen_time_next)
        break;
    end
    
    [kdown,ksecs,kcode] = KbCheck();
    % check escape key
    if kdown && sum(kcode)==1
        kcode = find(kcode);
        switch kcode
            % escape
            case KbName('Escape')
                end_of_task  = 1;
                end_of_block = 1;
                fprintf('Exit forced by user.\n');
                break;
            % value over boundary
            case KbName('UpArrow')
                trialstruct.resp_gs  = tmp_gs;
                trialstruct.resp_rt  = tmp_gs - ptb.screen_time_this;
                trialstruct.resp_key = +1;
                trialstruct.resp_cor = (trialstruct.vb_y > trialstruct.vb_b);
                break;
            % value below boundary
            case KbName('DownArrow')
                trialstruct.resp_gs  = tmp_gs;
                trialstruct.resp_rt  = tmp_gs - ptb.screen_time_this;
                trialstruct.resp_key = -1;
                trialstruct.resp_cor = (trialstruct.vb_y < trialstruct.vb_b);
                break;
        end
    end
end

% release
if ~parameters.flag_timeresp
    while kdown; kdown = KbCheck(); end
end

