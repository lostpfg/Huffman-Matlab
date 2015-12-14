function out_ = eff_calc( dict, prob )
    % Calculate average length code.
    out_ = average_cdl( dict, prob );
    % Calculate entropy.
    hu = 0;
    for i = 1:length(prob);
        hu = hu - prob(i)*log2(prob(i));
    end
    out_ = hu/out_;
end
% https://www.cs.unm.edu/~storm/cs530/Coding.html
function out_ = average_cdl( dict, prob )
    out_ = 0;
    for i = 1:length(dict.symbol);
        out_ = out_ + prob(i)*length(dict.code{i});
    end
end