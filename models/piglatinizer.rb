class PigLatinizer
  attr_accessor :sent

    def piglatinize(sent)
        sent.gsub('.','').split(' ').collect do |word|
          translate word
        end.compact.join(' ')
      end

      def translate(word)
        if word.length > 1
          if word == 'and' || word == 'an' || word == 'in'
            word
          elsif capture = consonant_expression.match(word)
            capture.post_match.to_s + capture.to_s + 'ay'
          elsif vowel?(first_letter=word[0].downcase)
            word + 'ay'
          elsif vowel?(last_letter=word[-1].downcase)
            move_last_letter(word) + 'ay'
          end
        else
          word
        end
      end

      # Move last letter to beginning of word
      def move_last_letter(word)
        word[-1] +  word[0..-2]
      end

      private
      def consonant_expression
        # at the beginning of a String
        # capture anything not a vowel (consonants)
        # capture 1, 2 or 3 occurences
        # ignore case and whitespace
        /^ [^aeiou] {1,3}/ix
      end

      def vowel?(letter)
        vowels.include?(letter)
      end

      def vowels
        %w[a e i o u]
      end
end
