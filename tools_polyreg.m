function p = tools_polyreg(n,phi)
    
    % positions
    p = nan(n+1,2);
    for i = 0:(n-1)
        p(i+1,:) = [cos(2*pi*i/n + phi), sin(2*pi*i/n + phi)];
    end
    p(n+1,:) = [cos(phi), sin(phi)];
    
    % recenter
    p(:,1) = p(:,1) - cos(phi);
    p(:,2) = p(:,2) - sin(phi);
end