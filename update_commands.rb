#!/usr/bin/env ruby

# Use this script to update the commands auto-completed in autoload/terraform.vim.

require 'open3'

command_re = /^\s\s\s\s(\S+)/
plugin_file = 'autoload/terraform.vim'

# Create the list of commands.

if File.file?('./terraform')
    stdout, stderr, _status = Open3.capture3('./terraform list-commands')
else
    stdout, stderr, _status = Open3.capture3('terraform list-commands')
end

output = if stderr == ''
           stdout.split("\n")
         else
           stderr.split("\n")
         end
commands = output.collect do |l|
  match = command_re.match(l)
  "    \\ '#{match[1]}'" if match
end.reject(&:nil?).join(",\n")

# Read in the existing plugin file.
plugin = File.open(plugin_file, 'r').readlines

# Replace the terraResourceTypeBI lines with our new list.
first = plugin.index { |l| /^  let l:commands = \[/.match(l) } + 1
last = plugin.index { |l| /^  \\ \]\n/.match(l) }
plugin.slice!(first, last - first)
commands.split("\n").reverse_each do |r|
  plugin.insert(first, r)
end

# Write the plugin file back out.
File.open(plugin_file, 'w') do |f|
  f.puts plugin
end
