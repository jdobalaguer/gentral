
Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

%% Release keys
% release keys
if ~parameters.flag_timeresp
    key_down = 1;
    while key_down;     key_down = KbCheck();                 end
    mouse_b = 1;
    while any(mouse_b); [mouse_x,mouse_y,mouse_b] = GetMouse; end
end

%% Mouse random
if parameters.flag_resetmouse
    mouse_v = 2*rand() - 1;
    mouse_x = ptb.screen_center(1) + cos(pi*(mouse_v-participant.origin)) * .5 * parameters.screen_circle.dim_rr * ptb.screen_drect(2);
    mouse_y = ptb.screen_center(2) + sin(pi*(mouse_v-participant.origin)) * .5 * parameters.screen_circle.dim_rr * ptb.screen_drect(2);
    SetMouse(round(mouse_x),round(mouse_y));
end

%% Time
% wait until it's time
while (ptb.screen_time_next>GetSecs); end
% calculate next times
ptb.screen_time_this = GetSecs;
if parameters.flag_timeresp
    ptb.screen_time_next = ptb.screen_time_this + parameters.time_response;
else
    ptb.screen_time_next = ptb.screen_time_this;
end

%% Get key

% no response
trialstruct.resp_gs   = nan;
trialstruct.resp_rt   = nan;
trialstruct.resp_y    = nan;
trialstruct.resp_err  = nan;
trialstruct.resp_aerr = nan;
trialstruct.resp_cor  = nan;

while 1
    tmp_gs = GetSecs();
    
    % time limit
    if  parameters.flag_timeresp && (tmp_gs > ptb.screen_time_next)
        break;
    end
    
    % resp y
    mouse_v = atan2(mouse_y - ptb.screen_center(2), mouse_x - ptb.screen_center(1))/pi + participant.origin;
    mouse_v = mod(mouse_v + 1,2) - 1; % modulus in range [-1,+1]

    % draw interface
    ptb_screen_drawcircle(ptb, parameters.screen_circle,participant.origin);
    ptb_screen_drawarrow(ptb, parameters.screen_x1, trialstruct.vb_x1 - participant.origin);
    ptb_screen_drawarrow(ptb, parameters.screen_x2, trialstruct.vb_x2shown - participant.origin);
    ptb_screen_drawarrow(ptb, parameters.screen_r,  mouse_v - participant.origin);
    % flip
    Screen(ptb.screen_w,'Flip');
    
    [key_down,key_secs,key_code] = KbCheck();
    [mouse_x,mouse_y,mouse_b]   = GetMouse;
    % keyboard
    if key_down && sum(key_code)==1 && find(key_code) 
        key_code = find(key_code);
        switch key_code
            % escape
            case KbName('Escape')
                end_of_task  = 1;
                end_of_block = 1;
                fprintf('Exit forced by user.\n');
                break;
        end
    end
    % mouse
    if any(mouse_b)
        trialstruct.resp_gs   = tmp_gs;
        trialstruct.resp_rt   = tmp_gs - ptb.screen_time_this;
        trialstruct.resp_y    = mouse_v;
        trialstruct.resp_err  = trialstruct.vb_y - mouse_v;
        trialstruct.resp_aerr = abs(trialstruct.vb_y - trialstruct.resp_y);
        trialstruct.resp_cor  = (trialstruct.resp_aerr < parameters.pars_cordist);
        break;
    end
end

% release keys
if ~parameters.flag_timeresp
    while key_down;     key_down = KbCheck();                 end
    while any(mouse_b); [mouse_x,mouse_y,mouse_b] = GetMouse; end
end

