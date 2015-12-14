function dict = huffmandict_( alphabet, prob, debug )
%   HUFFMANDICT_ Code dictionary generator for Huffman coder.
%   ----------------------------------------------------------------------- 
%   DICT = HUFFMANDICT_( ALPH, PROB, DEBUG ) generates a binary Huffman code.
%   The symbols can be represented as a numeric vector or single-dimensional 
%   alphanumeric cell array. The second input, PROB, represents the probability 
%   of occurrence for each of these symbols. SYM and PROB must be of same length.
%   Debug mode (DEBUG) feature when enabled creates a log file of the execution.
% 
%   Example of usage:
%          alphabet = {'x' 'y' 'z' 'w' 'k'} % Alphabet vector                               
%          prob     = [0.1 0.6 0.05 0.15 0.10]  % Probability vector              
%          dict     = huffmandict(alphabet,prob)  
%
%          Command Window (Output)
%
%          symbol: {'x'  'y'  'z'  'w'  'k'}
%            code: {'110'  '0'  '111'  '100'  '101'}
%    
%   ----------------------------------------------------------------------- 
% 
%   --- Error checking ------------------------

    % Check if the probability vector is of type double
    if ( ~strcmp( class(prob), 'double') )
        error('The probability vector must be of type double')
    end
    format short;
    % Check if any of the elements of probability vector is negative.
    if ( min( prob ) < 0 )
        error('Probability of an input symbol cannot be negative')
    end

    % Check if any of the elements of probability vector is greater than 1.
    if ( max( prob ) > 1 )
        error('Probability of an input symbol cannot be greater than 1')
    end

    % Check if both alphabet and probability vectors have the same length
    if( length(alphabet) ~= length(prob) )
        error('Alphabet and probability vectors must have the same length');
    end
    
%   --- /Error checking ------------------------
% 
%   --- Main Function   ------------------------
    % Check for debug argument
    debug_ = 0; % Global Variable
    if ( nargin > 2 && debug == 1 )
        debug_ = 1;
        loop_ = 1;
        timestamp = get_timestamp;
        timestamp = strcat(timestamp, 's_huffmandict_.txt'); 
        fileID = fopen(timestamp,'w'); % Open the bebug file.
        fprintf(fileID,'Debug Log - huffmandict_\n----------------------------\n');
    end
    % Initialize working vectors
    for i = 1:length( prob )    % For each probability.
        codewords{i} = '';      % Create an empty codeword string.
        symbol{i} = i;          % Index the codeword.
        if ( debug_ == 1 )
            word(i) = alphabet(i);  % Append it's symbol.
        end
    end
    
    while ( prob ~= 1 ) % Loop, until we reach the root.
        % Sort the probabilities at every loop.
        [~, arr] = sort(prob);  % Arrangement(arr) of the sorted probabilities.
        % Find the index of the two sets to be merged.
        last = arr(1);  % Index of the lowest probability.
        next = arr(2);  % Index of the second lowest probability.
        % Get their main index or indexes.
        right_set = symbol{last};  % Get the lowest set.
        left_set  = symbol{next};  % Get the second lowest set.
        % Get their probabilities.
        right_probability = prob(last); 
        left_probability  = prob(next); 
        % Create the new set.
        merged_set = [right_set, left_set]; 
        new_prob   = right_probability + left_probability; % Merge the probabilities.
        % Debug logging.
        if ( debug_ == 1 )
            merged_word = strcat(word{last},word{next});
            fprintf(fileID,'Loop Count : %d\n',loop_);
            fprintf(fileID,'\tMerged Symbols {"%s","%s"}-->{"%s"}\n',word{last},word{next},merged_word);
            fprintf(fileID,'\tMerged Probabilities {%.4f,%.4f}-->{%.4f}\n',right_probability,left_probability,new_prob);
            word(arr(1:2)) = '';
            word = [word merged_word];
            loop_ = loop_ + 1;  
        end
        % Update probability and symbol sets
        symbol(arr(1:2)) = '';  % Remove merged entries from the initial loop set.
        prob(arr(1:2))   = '';  % Remove also  the merged probabilities.
        symbol = [symbol merged_set]; % Update symbols set.
        prob   = [prob new_prob];     % Update probabilities set.       
        % Get the updated codeword.
        codewords = append_(codewords,right_set,'1');
        codewords = append_(codewords,left_set,'0');
    end
    % Output structure {symbol,codewords}.
    dict.symbol=alphabet; dict.code=codewords;
    % Debug logging.
    if ( debug_ == 1 )
        fprintf(fileID,'Compression Code :\n----------------------------\n');
        for i = 1:length(dict.symbol)
            fprintf(fileID,'\t{"%s"}-->{"%s"}\n',dict.symbol{i},dict.code{i});
        end
        fclose(fileID);
    end
    
%   --- /Main Function   ------------------------
end
% 
% % EOF -- huffmadict_