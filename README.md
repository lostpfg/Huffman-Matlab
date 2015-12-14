# Huffman-Matlab
Custom Huffman code dictionary generator,encoder and decoder functions

### Main Functions
##### huffmandict_( alphabet, prob, debug )
Based on the probability(prob) of each symbol(alphabet), generates the Huffman codebook.
Example of usage:

    alphabet = {'x' 'y' 'z' 'w' 'k'}     % Alphabet vector                               
    prob     = [0.1 0.6 0.05 0.15 0.10]  % Probability vector              
    dict     = huffmandict(alphabet,prob, 0)  

Command Window (Output)

    symbol: {'x'  'y'  'z'  'w'  'k'}
    code: {'110'  '0'  '111'  '100'  '101'}

 
##### huffmanenco_( sig, dict, debug )
Based on the huffman codebook from huffmandict_(dict) encodes the input signal(sig).
Example of usage: 

    % Signal of valid letters.
    sig = [ 'k'    'y'    'x'    'z'    'y'    'w'    'w' ];
    % Encode the signal using the Huffman code dictionary.
    sig_encoded = huffmanenco_(sig,dict)

Command Window (Output)
 
    10101101110100100
