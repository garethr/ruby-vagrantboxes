require 'vagrantboxes/client'

module Vagrantboxes
  class Command < Vagrant::Command::GroupBase
    register "vagrantboxes","Interact with the vagrantbox.es list of boxes"

    desc "search [TERM]", "Find a box"
    method_option :api
    def search(term=nil)
      Vagrantboxes::Client.search(term, options[:api])
    end

    desc "show [ID]", "Show all information for a given box"
    method_option :api
    def show(id=nil)
      Vagrantboxes::Client.show(id, options[:api])
    end

    desc "url [ID]", "Return the URL for a given box"
    method_option :api
    def url(id=nil)
      Vagrantboxes::Client.url(id, options[:api])
    end
    
    desc "add [ID]", "Download and add the box to your vagrant installation"
    method_option :api
    def add(id=nil)
      Vagrantboxes::Client.add(id, options[:api])
    end

  end

end
