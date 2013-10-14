function ptb_screen_drawcircle(ptb, circlestruct, origin)

    % positions
    x = ptb.screen_center(1);
    y = ptb.screen_center(2);
    r = .5 * circlestruct.dim_rr * ptb.screen_drect(2);
    x1 = x - r;
    x2 = x + r;
    y1 = y - r;
    y2 = y + r;
    
    % draw line
    if circlestruct.flag_showline
        xo = x + r * cos(pi * (-origin));
        yo = y + r * sin(pi * (-origin));
        Screen('DrawLine', ptb.screen_w, circlestruct.val_color, x, y, xo, yo, circlestruct.dim_cpt);
    end

    % draw circle
    Screen('FrameOval', ptb.screen_w, circlestruct.val_color, [x1,y1,x2,y2], circlestruct.dim_cpt);
        
    % draw ticks
    for angle = circlestruct.val_ticks_ang
        x1 = x + cos(pi*angle) * (r);
        y1 = y + sin(pi*angle) * (r);
        x2 = x + cos(pi*angle) * (r + circlestruct.dim_tpl);
        y2 = y + sin(pi*angle) * (r + circlestruct.dim_tpl);
        Screen('DrawLine', ptb.screen_w, circlestruct.val_color, x1, y1, x2, y2, circlestruct.dim_cpt);
    end
end