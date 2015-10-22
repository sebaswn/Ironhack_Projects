
  def solve_cipher(shift, alphabet = ('a'..'z').to_a.join + ('A'..'Z').to_a.join + ('0'..'9').to_a.join)
    @alphabet = alphabet
    @cipher = alphabet.chars.rotate(shift).join
  end

  def encrypt(text)
    puts text.tr(@alphabet, @cipher)
  end

  def decrypt(text)
    puts text.tr(@cipher, @alphabet)
  end

puts "Would you like to encrypt a message or decrypt a message ? (e/d)"
  var = gets.chomp

if var == "e"
  puts "What would you like to encrypt ?"
  text = gets.chomp
  puts "Default key code is 3. Would you like to change ? (y/n)"
  var = gets.chomp
  if var == "y"
    puts "What is your key code ?"
    shift = Integer(gets.chomp)
    solve_cipher(shift)
    encrypt(text)
  elsif var == "n"
    shift = 3
    solve_cipher(shift)
    encrypt(text)
  else
   puts "Error. Please enter y or n"
  end
end

if var == "d"
  puts "What would you like to decrypt ?"
  text = gets.chomp
  puts "Default key code is 3. Would you like to change ? (y/n)"
    var = gets.chomp
  if var == "y"
    puts "What is your key code ?"
    shift = Integer(gets.chomp)
    solve_cipher(shift)
    decrypt(text)
  elsif var == "n"
    shift = 3
    solve_cipher(shift)
    decrypt(text)
  else
   puts "Error. Please enter y or n"
  end
end