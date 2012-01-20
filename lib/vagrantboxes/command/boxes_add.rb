module Vagrantboxes
  module Command
    class BoxesAdd < Base

      def usage
        "add [ID]"
      end

      def execute
        argv = super
        return unless argv
        Vagrantboxes::Client.add(argv[0], @options[:api])
      end

    end
  end
end
