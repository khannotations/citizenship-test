# encoding: utf-8
require 'json'
f = File.open("test.txt")
q_regex = /^(\d+\.\s+)(.+)$/

qs = []
qa = {}
q = ""
a = ""
f.each do |line|
  line.gsub!(/\P{ASCII}/, '')
  if (m = q_regex.match(line))
    qs << qa unless qa.empty?
    qa = {}
    qa[:question] = m[2].strip 
    qa[:answer] = ""
  else
    qa[:answer] += (line.strip + "\n")
  end
end
qs << qa

puts qs.to_json