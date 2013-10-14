if parameters.flag_debug; return; end

% experiment
data.exp_sub(end+1)   = participant.id;
data.exp_grp(end+1)   = participant.group;
data.exp_block(end+1) = i_block;
data.exp_trial(end+1) = i_trial;

% avatar
data.vb_x1(end+1)       = trialstruct.vb_x1;
data.vb_x2latent(end+1) = trialstruct.vb_x2latent;
data.vb_x2shown(end+1)  = trialstruct.vb_x2shown;
data.vb_y(end+1)        = trialstruct.vb_y;

% response
data.resp_gs(end+1)   = trialstruct.resp_gs;
data.resp_rt(end+1)   = trialstruct.resp_rt;
data.resp_y(end+1)    = trialstruct.resp_y;
data.resp_err(end+1)  = trialstruct.resp_err;
data.resp_aerr(end+1) = trialstruct.resp_aerr;
data.resp_cor(end+1)  = trialstruct.resp_cor;
