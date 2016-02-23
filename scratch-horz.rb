#!/usr/bin/env ruby

require 'gosu'

class ScratchHorz < Gosu::Window
  attr_accessor :x, :y # side note - are these used at all?

  def initialize

    super 800, 600
    @background  = Gosu::Image.new("./images/bg_game_image.png")
    @x1, @y1 = 0, 0
  end

  def update

    @x1 -= 10

    @coordinates = Gosu::Image.from_text(
      self, "x: #{@x1} - loc: #{@local_x} bgwidth: #{-@background.width}", Gosu.default_font_name, 30)
  end

  def draw

    # -10 % -800 = -800
    @local_x = @x1 % -800
    puts @local_x
    #@background.draw(@local_x, @y1, 0)

    if @local_x < 0
      puts @local_x + 800
      # 810, 0
      # 820, 0
      @background.draw(@local_x + 800, @y1, 0) 
    end

    @coordinates.draw(0, 0, 1)
  end

end

scratch = ScratchHorz.new()
scratch.show