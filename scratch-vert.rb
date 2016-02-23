#!/usr/bin/env ruby

require "gosu"

class Scratch < Gosu::Window 

	def initialize
		@width = 800
		@height = 600
		super(@width, @height)
		self.caption = "Scratch"
		@bg = Gosu::Image.new("images/bg_game_image.png")
		@x = 0
		@y = 0
		@z = 0
	end

	def draw		
		
		# Draw image above
		@local_y = @y % -@height
	    @bg.draw(@x, @local_y, 0)

	    # Draw image below (decrement and reset via modulus)
	    if @local_y < 0
	      puts @local_y + @height
	      @bg.draw(@x, @local_y + @height, 0) 
	    end

		@coordinates.draw(0, 0, 1)
	end

	def update
		@y -= 8
		@coordinates = Gosu::Image.from_text(self, "y: #{@y}", Gosu.default_font_name, 30)
	end

end

window = Scratch.new
window.show