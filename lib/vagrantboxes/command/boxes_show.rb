module Vagrantboxes
  module Command
    class BoxesShow < Base

      def usage
        "show [ID]"
      end

      def execute
        argv = super
        return unless argv
        Vagrantboxes::Client.show(argv[0], @options[:api])
      end

    end
  end
end
