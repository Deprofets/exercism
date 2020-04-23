class Complement
  def self.of_dna(strand)
    strand.tr 'GCTA', 'CGAU'
  end
end

# RNA Transcription
# Given a DNA strand, its transcribed RNA strand is formed by replacing
# each nucleotide with its complement:
#
# * `G` -> `C`
# * `C` -> `G`
# * `T` -> `A`
# * `A` -> `U`
