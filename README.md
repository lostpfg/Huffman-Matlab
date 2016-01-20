# Huffman-Matlab
Custom Huffman code dictionary generator,encoder and decoder functions
All functions support debug mode, which creates a log file of execution
with several infos about each execution.

### Main Functions
##### huffmandict_( alphabet, prob, debug )
Based on the probability of each symbol, generates the Huffman codebook.
Example of usage:

    alphabet = {'x' 'y' 'z' 'w' 'k'}         % Alphabet vector.                               
    prob     = [0.1 0.6 0.05 0.15 0.10]      % Probability vector.     
    dict     = huffmandict(alphabet,prob, 0) % Set 0->1, creates log file. 

Command Window (Output)

    symbol: {'x'  'y'  'z'  'w'  'k'}
    code:   {'110'  '0'  '111'  '100'  '101'}

 
##### huffmanenco_( sig, dict, debug )
Based on the huffman codebook from huffmandict_, encodes the input signal.
Example of usage: 

    sig = [ 'k';'y';'x';'z';'y';'w';'w' ]; % Signal of valid letters.
    % Encode the signal using the Huffman code dictionary.
    sig_encoded = huffmanenco_( sig, dict, 0 ) % Set 0->1, creates log file.

Command Window (Output)
 
    10101101110100100
    
##### huffmadeco_( sig, dict, debug )
Based on the huffman codebook from huffmandict_, decodes the input signal.
Example of usage: 

    sig = [ 10101101110100100 ]; % Εncoded signal.
    % Encode the signal using the Huffman code dictionary.
    sig_decoded = huffmanenco_( sig, dict, 0 )

Command Window (Output)
 
    'k'    'y'    'x'    'z'    'y'    'w'    'w'
