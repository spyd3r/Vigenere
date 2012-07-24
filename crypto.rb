#!/usr/bin/env ruby
require 'rubygems'
require './vigenere.rb'

Vigenere.new.diagram("this is a super secret message")
a = Vigenere.new.encrypt("this is a super secret message")
puts a.inspect
puts Vigenere.new.decrypt(a[0], a[1])
