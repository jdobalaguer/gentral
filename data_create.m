if parameters.flag_debug; return; end
if exist('data','var');   return; end

% folder
if ~exist('data','dir')
    mkdir 'data';
end

% struct
data = struct();

% experiment
data.exp_sub   = [];
data.exp_grp   = [];
data.exp_block = [];
data.exp_trial = [];

% avatar
data.vb_x1       = [];
data.vb_x2latent = [];
data.vb_x2shown  = [];
data.vb_y        = [];

% response
data.resp_gs   = [];
data.resp_rt   = [];
data.resp_y    = [];
data.resp_err  = [];
data.resp_aerr = [];
data.resp_cor  = [];
