require "lgtmit/version"
require "lgtmit/compositer"
require "mini_magick"

module Lgtmit
  def self.run(file_name)
    Lgtmit::Compositer.new(file_name).run
  end
end
