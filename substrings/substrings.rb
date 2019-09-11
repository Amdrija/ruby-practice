def substrings (text, dictionary)

    word_hash = {}
    dictionary.each do |word|
        count = 0
        text_copy = String.new(text).downcase!
        while text_copy.match?(word)
            text_copy.sub!(word,"")
            count += 1
        end
        word_hash[word] = count if count > 0
    end
    word_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)