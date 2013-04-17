#!/usr/bin/env ruby

require 'colorize'
require 'trollop'

class String
  remove_const :MODES
  MODES = {
    :default        => 0, # Turn off all attributes
    :bright         => 1, # Set bright mode
    :underline      => 4, # Set underline mode
    :blink          => 5, # Set blink mode
    :swap           => 7, # Exchange foreground and background colors
    :hide           => 8  # Hide text (foreground color would be the same as background)
  }

  # redefined so colors are always outputed despite STDOUT being a pipe or not
  # (or else there would be no point in having this script called inside others)
  def colorize( params )
    begin
      require 'Win32/Console/ANSI' if RUBY_PLATFORM =~ /win32/
    rescue LoadError
      raise 'You must gem install win32console to use colorize on Windows'
    end
    
    color_parameters = {}

    if (params.instance_of?(Hash))
      color_parameters[:color] = COLORS[params[:color]]
      color_parameters[:background] = COLORS[params[:background]]
      color_parameters[:mode] = MODES[params[:mode]]
    elsif (params.instance_of?(Symbol))
      color_parameters[:color] = COLORS[params]
    end
    
    color_parameters[:color] ||= @color ||= COLORS[:default]
    color_parameters[:background] ||= @background ||= COLORS[:default]
    color_parameters[:mode] ||= @mode ||= MODES[:default]

    color_parameters[:uncolorized] ||= @uncolorized ||= self.dup
   
    # calculate bright mode
    color_parameters[:color] += 50 if color_parameters[:color] > 10

    color_parameters[:background] += 50 if color_parameters[:background] > 10

    "\033[#{color_parameters[:mode]};#{color_parameters[:color]+30};#{color_parameters[:background]+40}m#{color_parameters[:uncolorized]}\033[0m".set_color_parameters( color_parameters )
  end
end

opts = Trollop::options do
  opt :foreground, 'set the foreground color', :type => :string
  opt :background, 'set the background color', :type => :string
  opt :bold, 'use bold (the light_ equivalent in the foreground)', short: 'B'
  opt :list, 'list the available colors'
end

if opts[:list]
  String::COLORS.keys.each do |color|
    puts "#{color}".colorize(color)
  end
  exit
end

fg = opts[:foreground] || 'default'
bg = opts[:background] || 'default'
mode = 'default'

if opts[:bold]
  unless fg == 'default' || fg.start_with?('light_')
    fg = "light_#{fg}"
  else
    mode = 'bright'
  end
end

ARGV.each do |arg|
  puts "#{arg}".colorize(color: fg.to_sym , background: bg.to_sym, mode: mode)
end
