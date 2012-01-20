require 'vagrantboxes/client'

module Vagrantboxes
  module Command
    class Boxes < Vagrant::Command::Base
      def execute
        options = {}

        opts = OptionParser.new do |opts|
          opts.banner = "Usage: vagrant boxes search [TERM]\n"
                     << "       vagrant boxes show [ID]\n"
                     << "       vagrant boxes url [ID]\n"
                     << "       vagrant boxes add [ID]"

          opts.on("-a", "--api", "Optional API url for vagrantbox.es") do |api|
            options[:api] = api
          end
        end

        # Parse the options
        argv = parse_options(opts)
        return if !argv || Vagrantboxes::Client.respond_to?(argv[0])

        Vagrantboxes::Client.send(argv[0], options[:api])
      end
    end
  end
end
