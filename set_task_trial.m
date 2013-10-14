
i_trial = i_trial + 1;

%% set x1
trialstruct.vb_x1 = 2*rand - 1;

%% set y
switch parameters.task_func
    case 'rand'
        % mean of values
        trialstruct.vb_y  = 2*rand - 1;
    case 'mean'
        % mean of values
        trialstruct.vb_y  = .5*(trialstruct.vb_x1+trialstruct.vb_x2latent);
    case 'modsum'
        % modular sum
        trialstruct.vb_y  = mod(trialstruct.vb_x1+trialstruct.vb_x2latent+1,2)-1; 
    case 'moddiff'
        % modular difference
        trialstruct.vb_y  = mod(trialstruct.vb_x1-trialstruct.vb_x2latent+1,2)-1;
    case 'absdiff'
        % absolute difference
        trialstruct.vb_y  = abs(trialstruct.vb_x1-trialstruct.vb_x2latent)-1;
end