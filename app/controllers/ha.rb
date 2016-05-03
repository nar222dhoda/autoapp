options = { font_size: 10, font_family: "Arial" }
puts options
h = { "a" => 100, "b" => 200 }
h["a"] = 9
h["c"] = 4
h   #=> {"a"=>9, "b"=>200, "c"=>4}
h.store("d", 42) #=> 42
puts h   #=> {"a"=>9, "b"=>200, "c"=>4, "d"=>42}
h = { "a" => 100, "b" => 200 }
h.each {|k,v| puts "#{k} #{v}"}

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
puts h2.merge(h1)   #=> {"a"=>100, "b"=>254, "c"=>300}

