if parameters.flag_debug; return; end

Screen(ptb.screen_w, 'FillRect',  ptb.screen_bg_color);
Screen(ptb.screen_w, 'TextFont',  parameters.screen_fontname);
Screen(ptb.screen_w, 'TextSize',  parameters.screen_fontsize);
Screen(ptb.screen_w, 'TextColor', parameters.screen_fontcolor);
Screen(ptb.screen_w, 'TextBackgroundColor', parameters.screen_fontbgcolor);

% Screen
DrawFormattedText(ptb.screen_w,parameters.screen_txttask,'center','center');

% Flip
[tmp_vbltimestamp,tmp_stimulusonset] = Screen(ptb.screen_w,'Flip');
ptb.screen_time_this = tmp_stimulusonset;
ptb.screen_time_next = tmp_stimulusonset;

% Click
ptb_resp_click;
