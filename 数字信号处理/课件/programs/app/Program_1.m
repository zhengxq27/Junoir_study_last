    % Program 1
    % Dual-Tone Multifrequency Tone Detection
    % Using the DFT
    %
    clf;
    d = input('Type in the telephone digit = ', 's');
    symbol = abs(d);
    tm = [49 50 51 65;52 53 54 66;55 56 57 67;42 48 35 68];
    for p = 1:4;
    for q = 1:4;
        if tm(p,q) == abs(d);break,end
    end
        if tm(p,q) == abs(d);break,end
    end
    f1 = [697 770 852 941];
    f2 = [1209 1336 1477 1633];
    n = 0:204;
    x = sin(2*pi*n*f1(p)/8000) + sin(2*pi*n*f2(q)/8000);
    k = [18 20 22 24 31 34 38 42];
    val = zeros(1,8);
    for m = 1:8;
        Fx(m) = goertzel(x,k(m)+1);
    end
    val = abs(Fx);
    stem(k,val);grid; xlabel('k');ylabel('|X[k]|');
    limit = 80;
    for s = 5:8;
        if val(s) > limit,break,end
    end
    for r = 1:4;
        if val(r) > limit,break,end
    end
    disp(['Touch-Tone Symbol = ',setstr(tm(r,s-4))])
