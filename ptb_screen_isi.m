if ~parameters.time_isi; return; end;
if end_of_task; return; end

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);

%% Message
if isnan(trialstruct.resp_cor)
    DrawFormattedText(ptb.screen_w,parameters.screen_txtslow,'center','center');
end

%% Flip
[tmp_vbltimestamp,tmp_stimulusonset] = Screen(ptb.screen_w,'Flip',ptb.screen_time_next);
    ptb.screen_time_this = tmp_stimulusonset;
if parameters.flag_timeisi
    ptb.screen_time_next = tmp_stimulusonset + parameters.time_isi;
else
    ptb.screen_time_next = tmp_stimulusonset;
    ptb_resp_click;
end