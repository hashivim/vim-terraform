#!/usr/bin/env ruby

# Use this script to update the resources recognized in syntax/terraform.vim.
# You'll need a current checkout of the Terraform source.

resource_declaration = /"(.*)":.*resource.*\(\),$/
syntax_file = 'syntax/terraform.vim'

# Specify the location of the Terraform source as the only argument to this
# script.
raise 'Please specify the location of the Terraform source.' if ARGV.empty?

# Find all the lines that declare resources.
resource_lines = []
Dir.glob("#{ARGV[0]}/builtin/providers/*/*provider.go").each do |f|
  resource_lines += File.open(f, 'r').readlines.select do |l|
    resource_declaration.match(l)
  end
end

# Extract the resource names into a list formatted for vim script.
resources = resource_lines.collect do |rl|
  "          \\ #{resource_declaration.match(rl)[1]}\n"
end.sort

# Read in the existing syntax file.
syntax = File.open(syntax_file, 'r').readlines

# Replace the terraResourceTypeBI lines with our new list.
first = syntax.index { |l| /^syn keyword terraResourceTypeBI/.match(l) } + 1
last = syntax.index { |l| /^syn keyword terraTodo/.match(l) } - 3
(last - first).times do
  syntax.delete_at(first)
end
resources.reverse_each do |r|
  syntax.insert(first, r)
end

# Write the syntax file back out.
File.open(syntax_file, 'w') do |f|
  f.puts syntax
end
