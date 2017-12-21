=begin
Deoxyribonucleic acid (DNA) is a chemical found in the nucleus of cells and
carries the "instructions" for the development and functioning of living
organisms.
If you want to know more http://en.wikipedia.org/wiki/DNA
In DNA strings, symbols "A" and "T" are complements of each other,
as "C" and "G". You have function with one side of the DNA; you need to get the
other complementary side. DNA strand is never empty or there is no DNA at all
(again, except for Haskell).
DNA_strand ("ATTGC") # return "TAACG"
DNA_strand ("GTAT") # return "CATA"
=end

# My Solution
def dna_strand(dna)
  dna.chars.map do |d|
    case d
      when "T" then "A"
      when "A" then "T"
      when "C" then "G"
      when "G" then "C"
    end
  end.join
end

# Better Solution
def DNA_strand(dna)
  dna.tr("ATCG","TAGC")
end
