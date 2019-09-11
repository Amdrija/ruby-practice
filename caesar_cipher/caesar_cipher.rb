def caesar_cipher(text, shift = 0)
    encrypted_text = ""
    text.each_char do |c|
        if (c >= "A" && c <= "Z")
            c = ((c.ord - "A".ord + shift) % 26 + "A".ord).chr
        elsif (c >= "a" && c <= "z")
            c = ((c.ord - "a".ord + shift) % 26 + "a".ord).chr
        end
        encrypted_text += c
    end
    encrypted_text
end

puts "Enter the message you want to encrypt:"
message = gets.chomp
puts "Enter the shift number:"
shift = gets.chomp.to_i
puts caesar_cipher(message,shift)