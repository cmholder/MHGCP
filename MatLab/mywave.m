    %--  mywave.m --%

    %  a simple 'for' loop (non-parallelized):
    for i = 1:1000000
        A(i) = sin(i*2*pi/102400);
    end
