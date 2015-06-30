require "lemmatizer"
module Lemmatizer
  class Lemmatizer
    def my_lemma(form, pos = nil)
      unless pos
        [:verb, :noun, :adj, :adv].each do |p|
          result = my_lemma(form, p)
          if !result.nil?
            return result
          end
        end
        return nil
      end

      each_lemma(form, pos) do |x|
        return x
      end
      nil
    end
  end
end
