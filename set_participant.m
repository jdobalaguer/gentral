if parameters.flag_debug; return; end

%% if exists
if exist('participant','var');
    participant.times = participant.times + 1;
    participant.filename_data  = ['data',filesep,'data_',participant.name,'_',num2str(participant.times),'.mat'];
    participant.filename_error = ['data',filesep,'error_',participant.name,'_',num2str(participant.times),'.mat'];
    return;
end

participant = struct();


%% set participant

% participant info
clc;
disp('Participant')
participant.name = input('Name: ','s');
while any(participant.name == ' ')
    fprintf('Please dont use spaces.\n');
    participant.name = input('Name: ','s');
end
participant.age  = input('Age:  ','s');
participant.sex  = input('Sex:  ','s');
participant.hand = input('Hand:  ','s');

% researcher info
disp('Researcher')
participant.id      = randi(10000);
participant.times   = 1;
participant.group   = str2num(input('Group:  ','s'));
participant.color   = (rand()>.5);
participant.origin  = 2*rand() - 1;
if isempty(participant.group)
    participant.group = 1;
end
participant.filename_data  = ['data',filesep,'data_',participant.name,'_',num2str(participant.times),'.mat'];
participant.filename_error = ['data',filesep,'error_',participant.name,'_',num2str(participant.times),'.mat'];

if exist(participant.filename_data,'file')
    error('set_participant: error. data file already exists');
end
if exist(participant.filename_error,'file')
    error('set_participant: error. error file already exists');
end


%% dependent parameters

if participant.color
    % fillcolor
    tmp_color  = parameters.screen_x1.val_fillcolor;
    parameters.screen_x1.val_fillcolor = parameters.screen_x2.val_fillcolor;
    parameters.screen_x2.val_fillcolor = tmp_color;
    % linecolor
    tmp_color  = parameters.screen_x1.val_linecolor;
    parameters.screen_x1.val_linecolor = parameters.screen_x2.val_linecolor;
    parameters.screen_x2.val_linecolor = tmp_color;
end