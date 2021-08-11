def decodeBits(bits)
  #your code here
  highest = 0
  current = 0
  i = 0
  str = ""
  if bits.split("").all? {|x| x == "1"} 
    return "."
  end
  while i < bits.length
    if bits[i] == "0"
      current += 1
      if current > highest
        highest = current
      end
    elsif bits[i] == "1"
      current = 0
    end
    i += 1
  end
  spacing = ""
  (highest / 7).times do
    spacing += "0"
  end
  
  string = ""
  highest.times do
    string += "0" 
  end
  
  if bits.start_with?("0") && bits.split("1").length < 5
    return "."
  end
  if bits.split(string).all? {|x| !x.include?("0")}
    bits.split(string).each do |char|
      if char.length == string.length || char.length < string.length
        str += "."
        if char.length < string.length 
          str += " "
        end
      else
        str += "-"
      end
    end
    return str
  end
    
  arr = bits.split(spacing * 7)
  arr.each.with_index do |subarr, idx|
    array = subarr.split(spacing.to_s)
    array.each do |char|
      if char.include?("1")
        if char.length == spacing.length 
          str += "."
        else
          str += "-"
        end
      elsif char.empty? && str[-1] != " "
        str += " "
      end
    end
    if idx < arr.length - 1
      str += "  "
    end
  end
  return str
end

def decodeMorse(morseCode)
  #your code here
  str = ""
  arr = morseCode.split("  ")
  arr.each.with_index do |subarr, i|
    array = subarr.split(" ")
    array.each do |char|
      str += MORSE_CODE[char]
    end
    if i < arr.length - 1
      str += " "
    end
  end
  return str
    
end
