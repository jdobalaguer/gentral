if exist('parameters','var'); return; end;

parameters = struct();

%% flag
parameters.flag_debug         = 0;
parameters.flag_audiofeedback = 1;
parameters.flag_videofeedback = 1;
parameters.flag_timeresp      = 0;
parameters.flag_timefeedback  = 0;
parameters.flag_timeisi       = 1;
parameters.flag_resetmouse    = 1;
parameters.flag_alertmail     = 1;

%% parameters
parameters.pars_cordist = 0.08;

%% training
parameters.train_do        = 1;
parameters.train_func      = 'rand';
parameters.train_nbtrials  = 5;
parameters.train_by_min    = 0;
parameters.train_min       = nan;
parameters.train_by_blocks = 1;
parameters.train_blocks    = 2;

%% task
parameters.task_func = 'moddiff';
parameters.task_nbtrials = 100;
parameters.task_by_min    = 1;
parameters.task_min       = 50;
parameters.task_by_blocks = 0;
parameters.task_blocks    = nan;

%% alert
parameters.alert_min     = [30,50];
parameters.alert_blocks  = nan;

%% time
parameters.time_response = nan;
parameters.time_feedback = nan;
parameters.time_isi      = 0;

%% screen
% general
%parameters.screen_rect   = [0,0,1080,810];
parameters.screen_bg_color  = [255,255,255];

parameters.screen_fontcolor = [128,128,128];
parameters.screen_fontbgcolor = [0,0,0,0];
parameters.screen_fontsize  = 20;
parameters.screen_fontname  = 'Arial';

% messages
parameters.screen_txttrain = 'what does the task look like?';
parameters.screen_txttask  = 'ready for the real experiment? let''s start!';
parameters.screen_txtslow  = 'too slow!';
parameters.screen_txtend   = 'you are done! thank you for your participation.';

% stimulus
parameters.screen_circle = struct();
parameters.screen_circle.dim_rr = .5;
parameters.screen_circle.dim_cpt = 3;
parameters.screen_circle.dim_tpl = 8;
parameters.screen_circle.val_color = [192,192,192];
parameters.screen_circle.val_ticks_ang = -1:0.25:+1;
parameters.screen_circle.flag_showline = 1;

parameters.screen_x1 = struct();
parameters.screen_x1.dim_arr = .5;
parameters.screen_x1.dim_aps = 15;
parameters.screen_x1.dim_lpt = 2;
parameters.screen_x1.val_fillcolor = [95,192,255];
parameters.screen_x1.val_framecolor = [0,0,0];
parameters.screen_x1.val_linecolor = [95,192,255];
parameters.screen_x1.flag_shape = 'triangle';
parameters.screen_x1.flag_inside = 0;
parameters.screen_x1.flag_showline = 1;

parameters.screen_x2 = struct();
parameters.screen_x2.dim_arr = .5;
parameters.screen_x2.dim_aps = 15;
parameters.screen_x2.dim_lpt = 2;
parameters.screen_x2.val_fillcolor = [192,95,255];
parameters.screen_x2.val_framecolor = [0,0,0];
parameters.screen_x2.val_linecolor = [192,95,255];
parameters.screen_x2.flag_shape = 'triangle';
parameters.screen_x2.flag_inside = 0;
parameters.screen_x2.flag_showline = 1;

parameters.screen_r = struct();
parameters.screen_r.dim_arr = .5;
parameters.screen_r.dim_aps = 10;
parameters.screen_r.dim_lpt = 3;
parameters.screen_r.val_fillcolor = [192,192,192];
parameters.screen_r.val_framecolor = [0,0,0];
parameters.screen_r.val_linecolor = [0,0,0];
parameters.screen_r.flag_shape = 'triangle';
parameters.screen_r.flag_inside = 1;
parameters.screen_r.flag_showline = 1;

parameters.screen_y = struct();
parameters.screen_y.dim_arr = .5;
parameters.screen_y.dim_aps = 30;
parameters.screen_y.dim_lpt = 2;
parameters.screen_y.val_fillcolor = [nan,nan,nan];
parameters.screen_y.val_framecolor = [0,0,0];
parameters.screen_y.val_linecolor = [0,0,0];
parameters.screen_y.flag_shape = 'disk';
parameters.screen_y.flag_inside = 1;
parameters.screen_y.flag_showline = 0;


