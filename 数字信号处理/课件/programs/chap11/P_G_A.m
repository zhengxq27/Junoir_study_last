function [F,G,NN,F_new,G_new] = P_G_A(delay,mult);
% Copyright and design: Dr Hugo Tassignon
% email: hugo.tassignon@khbo.be
% F: Multiplier matrix, G: Delay matrix
% NN: New order for equations
%
clc
% Number of rows in mult & delay
Sm = size(mult,1); Sd = size(delay,1);
max_node = max(max(mult(:,1:2)));
% Fill in the system matrix with the constants for the multipliers
% and the delay elements.The number of delays determines the order
% of the system : (Sd+1)
F = zeros(max_node,max_node);G = F;
for k = 1:Sd+1,
    for n1 = 1:Sm,
        i = mult(n1,2); j = mult(n1,1); F(i,j) = mult(n1,3);
    end
    for n2 = 1:Sd,
        i = delay(n2,2); j = delay(n2,1); G(i,j) = 1;
    end
end

% N_first: Number of only 'outgoing' nodes
N_first = [];
z = zeros(1,max_node);
for m = 1:max_node,
    if F(m,:) == z,
        N_first = [N_first,m];
    end
end
N_first = sort(N_first);
l_N_f = length(N_first);
% N_last: Number of only 'incoming' nodes
N_last = [];
for m = 1:max_node,
    if F(:,m)' == z,
        N_last=[N_last,m];
    end
end
N_last;
N_last = sort(N_last);
l_N_l = length(N_last);

% N: # of nodes 'in-between' N_first and N_last nodes.
NN = N_first;
N = []; y = []; l_y = 1; p_1 = 0;

while l_y ~= 0,  % y: # of nodes not coming from former N
        N_nm = [N_first,N_last];
        l_N_nm = length(N_nm);
        N_middle = 1:max_node;
        for n=1:l_N_nm,
            N_index = find(N_middle ~= N_nm(n));
            N_middle = N_middle(N_index(:));
        end
        l_N_middle = length(N_middle);

        nn = [];
        for n = 1:l_N_middle,
            for p = 1:max_node,
            if F(N_middle(n),p)~=0 & p~=[N_middle,N_last]& p~=p_1,
                nn = N_middle(n);
            end
            if F(N_middle(n),p)~=0 & p~=N_first & p~=p_1,
                nn = [];
            end
            end
            N = [N,nn];
            p_1 = p;
        end

        N = sort(N); % sort in ascending order of N
        l_N = length(N);

% FF: sub-matrix of F with lines selected by N
        FF = [];
        for q = 1:l_N,
            FF = [FF;F(N(q),:)];
        end

% YX: coordinates in F matrix of nodes 'in-between' first
% and last nodes
        [Y,X] = find(FF);
            if l_N == 1,
                YX = [Y',X'];
            else YX = [Y,X];
            end
        l_YX = size(YX,1);

% y: numbers of nodes not coming from former N
        y = []; r = 1; p = 1;
        while r <= l_YX,
            while p <= l_N_f,
                if YX(r,2) ~= N_first(p),
                    yy = YX(r,1);
                    if ~isempty(yy);
                    y = yy;
                    elseif yy ~= y',
                    y = [y,yy];
                    end
                end
            p = p+1;
            end
            r = r+1;
        end
        l_y = length(y);

        NNN = [];
        for p = 1:l_N,  % NN=numbers(#) of first
            if N(p) ~= y | length(N) == 1,  % + next nodes...
                if N(p) ~= NN(:)
                NN = [NN,N(p)];
                NNN = [NNN,N(p)];  % NNN : new 'first' nodes
                end
            end
        end
        N_first = [N_first,NNN];
        l_N_f = length(NNN);
        N = [];
    end
    NN = [NN,N_last];

    II = [];
  for i = 1:max_node,
      I = find(NN==i);
      if isempty(I),
          II=[II,i];
      end
  end

  if ~isempty(II)
      error('STRUCTURE NOT COMPUTABLE');
  end

  F_inter = [];G_inter = [];
      for n = 1:max_node,
          F_inter = [F_inter;F(NN(n),:)];
          G_inter=[G_inter;G(NN(n),:)];
      end
  F_new = [];G_new = [];
  for n = 1:max_node,
      F_new = [F_new,F_inter(:,NN(n))];
      G_new = [G_new,G_inter(:,NN(n))];
  end
end