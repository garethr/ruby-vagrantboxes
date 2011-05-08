require 'json'
require 'net/http'

module Vagrantboxes

  class Command < Vagrant::Command::GroupBase

    ENDPOINT = "http://api2.vagrantbox.es"

    register "vagrantboxes","Interact with the vagrantbox.es list of boxes"

    desc "search [TERM]", "Find a box"
    def search(term=nil)
      url = "#{ENDPOINT}/boxes.json"
      resp = Net::HTTP.get_response(URI.parse(url))
      data = resp.body

      results = JSON.parse(data)

      result.each { |result|
        puts result['title']
      }
    end

  end

end
