require "haml"

input = ARGV[0] 
die "Enter at least one parameter: input filename (no extention)" unless input

input_filename = input + '.haml'

output = ARGV[1]
output = input unless output 
output_filename = output + '.html'

template = File.read(input_filename) or die "Unable to read file #{input_filename}"
engine = Haml::Engine.new(template)
html = engine.render

output_file = File.open(output_filename, 'w') or die "Unable to write to file #{output_filename}" 
output_file.write(html)

