
require "thor"

module Lgtmit
  class CLI < Thor

    desc "make file_name", "Put LGTM label on photo"
    def make(file_name)
      Compositer.new(file_name).run
    end
  end
end
