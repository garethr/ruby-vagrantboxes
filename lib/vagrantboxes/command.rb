module Vagrantboxes

  class Command < Vagrant::Command::GroupBase

    register "vagrantboxes","Interact with the vagrantbox.es list of boxes"

    desc "search [TERM]", "Find a box"
    def search(term=nil)
      puts "bob"
    end

  end

end
