# frozen_string_literal: true
module Lgtmit
  class Compositer
    require "pathname"

    attr_accessor :file_name, :image

    POS = "0, 0"
    TEXT = "LGTM"
    COLOR = "#ffffff"
    GRAV = "center"
    FMT = "png"
    P_SCALE = 3

    def initialize(file_name)
      @file_name = file_name
      @image = MiniMagick::Image.open(@file_name)
    end

    def run
      configure_image!
      write_image!
    end

    def configure_image!
      @image.combine_options do |config|
        config.fill(COLOR)
        config.gravity(GRAV)
        config.pointsize(p_size_calc)
        config.draw("text #{POS} '#{TEXT}'")
      end
      @image.format(FMT)
      @image
    end

    def write_image!
      @image.write("#{TEXT}_#{Pathname.new(file_name).basename}")
    end

    private

    def p_size_calc
      if @image[:width] > @image[:height]
        @image[:width] / P_SCALE
      else
        @image[:height] / P_SCALE
      end
    end
  end
end
