function s = get_timestamp()       
    % Get filname timestamp 
    % Based on http://programming-tips-and-tricks.blogspot.gr/2012/10/matlab-timestamp.html
    clc = strrep(datestr(clock), ':' , '-' );
    s = strrep(clc, ' ' , '-' );
    ii=find(s=='-');
    s(ii(4))='h';
    s(ii(5))='m';
end