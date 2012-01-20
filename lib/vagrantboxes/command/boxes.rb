require 'vagrantboxes/client'

module Vagrantboxes
  module Command
    class Boxes < Vagrant::Command::Box

      def initialize(argv, env)
        super

        @subcommands = Vagrant::Registry.new
        @subcommands.register(:search)   { Vagrantboxes::Command::BoxesSearch }
        @subcommands.register(:show)     { Vagrantboxes::Command::BoxesShow }
        @subcommands.register(:url)      { Vagrantboxes::Command::BoxesUrl }
        @subcommands.register(:add)      { Vagrantboxes::Command::BoxesAdd }
      end

      # Prints the help out for this command
      def help
        opts = OptionParser.new do |opts|
          opts.banner = "Usage: vagrant boxes <command> [<args>]"
          opts.separator ""
          opts.separator "Available subcommands:"

          # Add the available subcommands as separators in order to print them
          # out as well.
          keys = []
          @subcommands.each { |key, value| keys << key.to_s }

          keys.sort.each do |key|
            opts.separator "     #{key}"
          end

          opts.separator ""
          opts.separator "For help on any individual command run `vagrant boxes COMMAND -h`"
        end

        @env.ui.info(opts.help, :prefix => false)
      end

    end
  end
end

Vagrant.commands.register(:boxes)          { Vagrantboxes::Command::Boxes }
