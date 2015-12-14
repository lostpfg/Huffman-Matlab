% Setup MATLAB console.
% Clear all global variables, console and open windows.
clc;
clear all;
close all;
% Alphabet and Probability vectors.
% https://en.wikipedia.org/wiki/Letter_frequency
alphabet = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'};
prob     = [ .08167 .01492 .02782 .04253 .12702 .02228 .02015 .06094 .06966 .00153 .00772 .04025 .02406 .06749 .07507 .01929 .00095 .05987 .06327 .09056 .02758 .00978 .02361 .00150 .01974 .00074 ];
randsrc_ = alphabet( randsrc( 1, 10000, [1:length(prob); prob] ) );
% Get the dictionary of the given alphabet.
dict    = huffmandict_( alphabet, prob, 0 );
% Get the encoded signal.
encoded = huffmanenco_( randsrc_, dict, 0 );
% Get the decoded signal.
decoded = huffmandeco_( encoded, dict, 0 );
% Length of the encoded signal.
length( encoded )
% Efficiency of huffman code
eff_calc(dict,prob)