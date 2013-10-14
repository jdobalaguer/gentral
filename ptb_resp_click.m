
% initialise
ptb.mouse_buttons = [];
kdown = 0;

% press
while ~any(ptb.mouse_buttons) && ~kdown
    [ptb.mouse_x,ptb.mouse_y,ptb.mouse_buttons] = GetMouse;
    kdown = KbCheck();
end

% release
while any(ptb.mouse_buttons) || kdown
    [ptb.mouse_x,ptb.mouse_y,ptb.mouse_buttons] = GetMouse;
    kdown = KbCheck();
end

clear kdown;