function p = filtTheProj(p_in)
    p = p_in;

    % Design the filter
    len = size(p,1);
    H = designFilter(filter, len, d);

    p(length(H),1)=0;  % Zero pad projections

    p = fft(p);               % p holds fft of projections

    p = bsxfun(@times, p, H); % faster than for-loop

    p = ifft(p,'symmetric');  % p is the filtered projections

    p(len+1:end,:) = [];
    
end