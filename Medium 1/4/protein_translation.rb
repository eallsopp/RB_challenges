=begin
Protein Translation

Lets write a program that will translate RNA sequences into proteins. 
RNA can be broken into three nucleotide sequences called 
codons, and then translated to a polypeptide like so:
RNA: "AUGUUUUCU" => translates to

Codons: "AUG", "UUU", "UCU"
=> which become a polypeptide with the following sequence =>

Protein: "Methionine", "Phenylalanine", "Serine"


There are 64 codons which in turn correspond to 20 amino acids; however, 
# all of the codon sequences and resulting amino acids are not important in this exercise.

There are also four terminating codons (also known as 'STOP' codons); 
if any of these codons are encountered (by the ribosome), all translation ends 
and the protein is terminated. 
All subsequent codons after are ignored, like this:

RNA: "AUGUUUUCUUAAAUG" =>

Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

Protein: "Methionine", "Phenylalanine", "Serine"

Note the stop codon terminates the translation and the final methionine is not 
translated into the protein sequence.--
Below are the codons and resulting Amino Acids needed for the exercise.

Codon 	            Amino Acids
AUG 	              Methionine
UUU, UUC 	          Phenylalanine
UUA, UUG 	          Leucine
UCU, UCC, UCA, UCG 	Serine
UAU, UAC 	          Tyrosine
UGU, UGC 	          Cysteine
UGG 	              Tryptophan
UAA, UAG, UGA 	    STOP


Problem: Create a program that translates RNA sequences to Proteins/Aminos
RNA => Codons => Amino Acids and vice versa

Given a Codon, return the Amino Acid
Given a string of RNA, return the Amino's associated wtih a 3 character sring of codons
STOP if necessary


Methods:
#of_codon
  translates codon into Amino Acids
    return STOP if codon is the STOP value

#of_rna
 - given a string, break string into 3 character sequences, and determine the 
 Amino Acids from those given codons
 return the array of codons, stop when necessary
    The ARRAY should NOT include the word STOP 
 raise a InvalidCodeError if the RNA sequence is not in the Data Structure
    i.e. EEE, EGG raises error
    
    
    Data Structure: 
    OPTION 1: Create a Hash that has aminos as keys, codons as values
      this will allow me to access arrays of data in the program
      and return the key or values as needed
    Option 2: Create 2 hashes, with the same indicies for Aminos/Codons

ALGO: 
  Create a constant AMINO_ACids which contains a hash of keys - amino acids, and 
  values which are an array of the codons
  
  Methods are Class MEthods for Translation
  #of_codon => amino acid name
    iterate over the hash AMINO ACIDS
        return the values of the Hash, which is an array
        see if that array includes the given sequence, if so return the key
          if the key is 'STOP', do not include it in an array if collecting Amino Names
  #of_rna
    strand is passed in as a string, must break the string into pieces of 3
    pass each strand into  #self.of_codon 
      pass the returns into an arary to return
  
=end
class InvalidCodonError < StandardError
end

class Translation
  AMINO_ACIDS = {
    'Methionine' => ['AUG'], 'Phenylalanine' => ['UUU', 'UUC'], 
    'Leucine' => ['UUA', 'UUG'], 'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine' => ['UAU', 'UAC'], 'Cysteine' => ['UGU', 'UGC'],
    'Tryptophan' => ['UGG'], 'STOP' => ['UAA', 'UAG', 'UGA']
  }
  
  def self.of_codon(sequence)
    AMINO_ACIDS.each { |key, v| return key if v.include?(sequence) }
  end
  
  def self.of_rna(strand)
    amino_acid = []
    rna_array = strand.chars.each_slice(3).map(&:join)
    
    rna_array.map do |sequence|
      raise InvalidCodonError if /[^AUCG]/ =~ sequence
      break if self.of_codon(sequence) == 'STOP'
      amino_acid << self.of_codon(sequence)
    end
    
    amino_acid.uniq
  end
end