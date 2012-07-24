#!/usr/bin/env ruby
require 'rubygems'
class Vigenere
  def diagram(plaintext)
    @key = [];@plain = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z); (1..plaintext.gsub(/\W/,'').split(//).length).each {@key.push(@plain[Random.rand(0..25)])}; @cipher = []; x = 0; plaintext.gsub(/\W/, '').split(//).each {|plain_char| c = @plain.rotate(@plain.index(@key[x].downcase)); @cipher.push(@plain[c.index("#{plain_char.downcase}")]); x += 1 }; print "KEY:\t #{@key.join('-').upcase}\n"; print "PLAIN:\t #{plaintext.gsub(/\W/, '').split(//).join('-').upcase}\n";print "CIPHER:\t #{@cipher.join('-').upcase}\n";print "\n\n";x=0; while x < 26 do print "\t #{@plain.rotate(x).join('-').upcase}\n"; x += 1; 
    end
    return puts "\nKEY:\t\t #{@key.join}\nCIPHERTEXT:\t #{@cipher.join}"
  end

  def encrypt(plaintext)
    @key = [];@plain = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z); (1..plaintext.gsub(/\W/,'').split(//).length).each {@key.push(@plain[Random.rand(0..25)])}; @cipher = []; x = 0; plaintext.gsub(/\W/, '').split(//).each {|plain_char| c = @plain.rotate(@plain.index(@key[x].downcase)); @cipher.push(@plain[c.index("#{plain_char.downcase}")]); x += 1 };
    return @cipher.join, @key.join
  end
  
  def key_encrypt(plaintext, key)
    @key = key.split(//); @plain = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z); self.fill_secret(plaintext, key); @cipher = []; x = 0; plaintext.gsub(/\W/, '').split(//).each {|plain_char| c = @plain.rotate(@plain.index(@key[x].downcase)); @cipher.push(@plain[c.index("#{plain_char.downcase}")]); x += 1 };
    return @cipher.join
  end
 

  def decrypt(ciphertext, key)
    @key = key.split(//); @ciphertext = ciphertext.split(//); plain = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z); self.fill_secret(ciphertext, key); @plaintext = []; x = 0; @ciphertext.each {key_alphabet = plain.rotate(plain.index(@key[x])); @plaintext.push(key_alphabet[plain.index("#{@ciphertext[x]}")]); x += 1 };
    return @plaintext.join
  end

  def fill_secret(plaintext, key)
    @key = key.gsub(/\W/, '').split(//)
    if plaintext.split(//).length > @key.length 
      x = 0
      while plaintext.split(//).length > @key.length
        @key.push(@key[x])
        x += 1
      end
    end
    return @key
  end

end
