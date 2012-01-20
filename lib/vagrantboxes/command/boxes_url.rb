module Vagrantboxes
  module Command
    class BoxesUrl < Base

      def usage
        "url [ID]"
      end

      def execute
        argv = super
        return unless argv
        Vagrantboxes::Client.url(argv[0], @options[:api])
      end

    end
  end
end
