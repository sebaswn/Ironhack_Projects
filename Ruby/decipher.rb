def solve_cipher(shift, alphabet = ('a'..'z').to_a.join + ('A'..'Z').to_a.join + ('0'..'9').to_a.join)
    a = 0
    @alphabet = alphabet
    @cipher = alphabet.chars.rotate(shift).join
 
end

def decrypt(text)
    puts text.tr(@cipher, @alphabet)
end

puts "What must I decrypt ?"
text = gets.chomp

var = 0

while var < 63
	shift = var
	solve_cipher(shift)
	decrypt(text)
	var = var + 1
end