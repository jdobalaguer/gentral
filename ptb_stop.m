
%% Time
if ~isfield(ptb,'time_stop')
    ptb.time_stop = GetSecs;
else
    ptb.time_stop(end+1) = GetSecs;
end

%% Screen

% mouse
ShowCursor;

% remove anything pressed during the experiment (?)
FlushEvents;

% window
Screen('CloseAll');

%% Audio

% stop sound
try
    PsychPortAudio('Close', ptb.audio_port);
    ptb.audio_port = [];
end
