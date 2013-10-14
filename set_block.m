%% indexes
i_block = i_block + 1;
i_trial = 0;
end_of_block = 0;

%% trial struct
trialstruct = struct();

trialstruct.vb_x1       = nan;
trialstruct.vb_x2shown  = nan;
trialstruct.vb_x2latent = nan;
trialstruct.vb_y  = nan;

trialstruct.resp_gs   = nan;
trialstruct.resp_rt   = nan;
trialstruct.resp_y    = nan;
trialstruct.resp_err  = nan;
trialstruct.resp_aerr = nan;
trialstruct.resp_cor  = nan;

%% set x2
trialstruct.vb_x2latent = 2*rand - 1; % uniformly distributed
switch participant.group
    case 1
        trialstruct.vb_x2shown = trialstruct.vb_x2latent;
    case 2
        trialstruct.vb_x2shown = 2*rand - 1;
    case 3
        trialstruct.vb_x2shown = nan;
end
