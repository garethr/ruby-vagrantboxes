module Vagrantboxes
  module Command
    class BoxesSearch < Base

      def usage
        "search [TERM]"
      end

      def execute
        argv = super
        return unless argv
        Vagrantboxes::Client.search(argv[0], @options[:api])
      end

    end
  end
end
