function ptb_screen_drawarrow(ptb, arrowstruct, v)
    if isnan(v); return; end

    % positions
    x = ptb.screen_center(1);
    y = ptb.screen_center(2);
    r = .5 * arrowstruct.dim_arr * ptb.screen_drect(2);
    xa = x + cos(pi*v) * (r);
    ya = y + sin(pi*v) * (r);
    
    % draw line
    if arrowstruct.flag_showline
        Screen('DrawLine', ptb.screen_w, arrowstruct.val_linecolor, x, y, xa, ya, arrowstruct.dim_lpt);
    end
    
    % draw arrow
    switch arrowstruct.flag_shape
        case 'disk'
            x1 = xa - .5 * arrowstruct.dim_aps;
            y1 = ya - .5 * arrowstruct.dim_aps;
            x2 = xa + .5 * arrowstruct.dim_aps;
            y2 = ya + .5 * arrowstruct.dim_aps;
            Screen('FillOval', ptb.screen_w, arrowstruct.val_fillcolor, [x1,y1,x2,y2]);
            Screen('FrameOval', ptb.screen_w, arrowstruct.val_framecolor, [x1,y1,x2,y2], arrowstruct.dim_lpt);
        case 'triangle'
            if arrowstruct.flag_inside
                p = tools_polyreg(3,pi*v);
            else
                p = tools_polyreg(3,pi*(v+1));
            end
            p = p*arrowstruct.dim_aps;
            p(:,1) = p(:,1) + xa;
            p(:,2) = p(:,2) + ya;
            Screen('FillPoly', ptb.screen_w, arrowstruct.val_fillcolor, p, 1);
            Screen('FramePoly', ptb.screen_w, arrowstruct.val_framecolor, p, arrowstruct.dim_lpt);
    end
end