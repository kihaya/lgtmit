require "lgtmit/version"
require "lgtmit/compositer"
require "mini_magick"

module Lgtmit
  def self.run(file_name)
    image = MiniMagick::Image.open(file_name)

    p_size = if image[:width] > image[:height]
               image[:width] / P_SCALE
             else
               image[:height] / P_SCALE
             end

    image.combine_options do |config|
      config.fill COLOR
      config.gravity GRAV
      config.pointsize p_size
      config.draw "text #{POS} '#{TEXT}'"
    end

    image.format FMT
    image.write "#{TEXT}_#{file_name}"
  end
end
