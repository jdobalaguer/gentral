if end_of_task; return; end

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

%% Draw interface
% draw interface
ptb_screen_drawcircle(ptb, parameters.screen_circle, participant.origin);
ptb_screen_drawarrow(ptb, parameters.screen_x1, trialstruct.vb_x1  - participant.origin);
ptb_screen_drawarrow(ptb, parameters.screen_x2, trialstruct.vb_x2shown - participant.origin);
ptb_screen_drawarrow(ptb, parameters.screen_r,  trialstruct.resp_y - participant.origin);

%% Video Feedback
% video
if parameters.flag_videofeedback
    % color
    if isnan(trialstruct.resp_aerr)
        parameters.screen_y.val_fillcolor = 255*[1,0,0];
    elseif trialstruct.resp_aerr < .25
        parameters.screen_y.val_fillcolor = 255*[4*trialstruct.resp_aerr,1,0];
    elseif trialstruct.resp_aerr < .5
        parameters.screen_y.val_fillcolor = 255*[1,1-4*(trialstruct.resp_aerr-.25),0];
    else
        parameters.screen_y.val_fillcolor = 255*[1,0,0];
    end
    % position
    ptb_screen_drawarrow(ptb, parameters.screen_y,  trialstruct.vb_y   - participant.origin);
end

%% Flip (1)
[tmp_vbltimestamp,tmp_stimulusonset] = Screen(ptb.screen_w,'Flip',ptb.screen_time_next);

%% Audio feedback
if parameters.flag_audiofeedback
    if isnan(trialstruct.resp_cor)
        ptb_audio_lowbeep;
    elseif trialstruct.resp_cor
        ptb_audio_highbeep;
    else
        ptb_audio_lowbeep;
    end
end

%% Flip (2)
ptb.screen_time_this = tmp_stimulusonset;
if parameters.flag_timefeedback
    ptb.screen_time_next = tmp_stimulusonset + parameters.time_feedback;
else
    ptb.screen_time_next = tmp_stimulusonset;
    ptb_resp_click;
end

