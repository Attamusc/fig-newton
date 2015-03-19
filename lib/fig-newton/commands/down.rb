require "fig-newton/config"

module FigNewton
  module Commands
    class Down
      def initialize(stack_name, config_dir)
        @stack_name = stack_name
        @config = FigNewton::Config.from_file(config_dir, @stack_name)
      end

      def run(parent_directory)
        config.apps.each { |_, app| app.down(parent_directory) }
      end

      private

      attr_accessor :config, :stack_name
    end
  end
end
