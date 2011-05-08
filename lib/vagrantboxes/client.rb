require 'cgi'
require 'json'
require 'net/http'
require 'vagrant'


module Vagrantboxes
  
  ENDPOINT = "http://api2.vagrantbox.es"

  module Client

    def self.search(term, api_url)
      base = api_url ? api_url : ENDPOINT
      url = "#{base}/boxes.json"
      if term
        url = "#{url}?q=#{CGI.escape(term)}"
      end
      results = request(url)
      results.sort! { |a,b| a['id'] <=> b['id'] }
      results.each { |result|
        puts "#{result['id'].to_s.ljust(4)} #{result['title'].ljust(25)} #{result['url']}"
      }
    end

    def self.url(id, api_url)
      base = api_url ? api_url : ENDPOINT
      if id =~ /^[-+]?[0-9]+$/
        url = "#{base}/boxes/#{id}.json"
        result = request(url)
        puts result['url']
      end
    end

    def self.show(id, api_url)
      base = api_url ? api_url : ENDPOINT
      if id =~ /^[-+]?[0-9]+$/
        url = "#{base}/boxes/#{id}.json"
        result = request(url)

        puts
        puts result['title']
        puts result['url']
        puts
        puts result['description']
      end
    end

    def self.add(id, api_url)
      base = api_url ? api_url : ENDPOINT
      if id =~ /^[-+]?[0-9]+$/
        url = "#{base}/boxes/#{id}.json"
        result = request(url)
        env = Vagrant::Environment.new
        env.ui = Vagrant::UI::Shell.new(env, Thor::Base.shell.new)
        env.load!
        Vagrant::Box.add(env, result['title'], result['url'])
      end
    end

    def self.request(url)
      resp = Net::HTTP.get_response(URI.parse(url))
      data = resp.body
      resp.code == "200" ? JSON.parse(data) : nil
    end

  end
end
