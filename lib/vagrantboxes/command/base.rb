module Vagrantboxes
  module Command
    class Base < Vagrant::Command::Base

      def execute
        @options = {}

        opts = OptionParser.new do |opts|
          opts.banner = "Usage: vagrant boxes #{usage}"
          opts.on("-a", "--api", "Optional API url for vagrantbox.es") do |api|
            @options[:api] = api
          end
        end

        # Parse the options
        argv = parse_options(opts)
        argv
      end

    end
  end
end
