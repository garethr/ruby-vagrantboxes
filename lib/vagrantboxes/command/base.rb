module Vagrantboxes
  module Command
    class Base < Vagrant::Command::Base

      def execute
        options = {}

        opts = OptionParser.new do |opts|
          opts.banner = "Usage: vagrant boxes #{usage}"
          opts.on("-a", "--api", "Optional API url for vagrantbox.es") do |api|
            options[:api] = api
          end
        end

        # Parse the options
        argv = parse_options(opts)
        return unless argv

        Vagrantboxes::Client.send(meth, argv[0], options[:api])
      end

      def usage
        "#{meth} [ID]"
      end

      private

      def meth
        self.class.to_s.scan(/([A-Z].*?)(?=[A-Z]|$)/).flatten.last.downcase
      end

    end
  end
end
