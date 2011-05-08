require 'json'
require 'net/http'

module Vagrantboxes

  class Command < Vagrant::Command::GroupBase

    ENDPOINT = "http://api2.vagrantbox.es"

    register "vagrantboxes","Interact with the vagrantbox.es list of boxes"

    desc "search [TERM]", "Find a box"
    method_option :api, :default => ENDPOINT
    def search(term=nil)
      url = "#{options[:api]}/boxes.json"
      if term
        url = "#{url}?q=#{term}"
      end
      resp = Net::HTTP.get_response(URI.parse(url))
      data = resp.body

      results = JSON.parse(data)
      results.sort! { |a,b| a['id'] <=> b['id'] }

      results.each { |result|
        puts "#{result['id'].to_s.ljust(4)} #{result['title'].ljust(25)} #{result['url']}"
      }
    end

    desc "show [ID]", "Show all information for a given box"
    method_option :api, :default => ENDPOINT
    def show(id=nil)
  
      if id =~ /^[-+]?[0-9]+$/
        url = "#{options[:api]}/boxes/#{id}.json"
        resp = Net::HTTP.get_response(URI.parse(url))
        if resp.code == "200"
          data = resp.body
          result = JSON.parse(data)
          puts result['title']
          puts result['url']
          puts
          puts result['description']
        end
      end
    end

    desc "url [ID]", "Return the URL for a given box"
    method_option :api, :default => ENDPOINT
    def url(id=nil)
      if id =~ /^[-+]?[0-9]+$/
        url = "#{options[:api]}/boxes/#{id}.json"
        resp = Net::HTTP.get_response(URI.parse(url))
        if resp.code == "200"
          data = resp.body
          result = JSON.parse(data)
          puts result['url']
        end
      end
    end
  end

end
