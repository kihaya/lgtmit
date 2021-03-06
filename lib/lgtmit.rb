# frozen_string_literal: true
require "lgtmit/version"
require "lgtmit/compositer"
require "lgtmit/cli"
require "mini_magick"

module Lgtmit
  def self.run(file_name)
    Lgtmit::Compositer.new(file_name).run
  end
end
