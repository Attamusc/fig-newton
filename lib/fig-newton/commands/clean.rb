require "fig-newton/config"

module FigNewton
  module Commands
    class Clean
      def initialize(stack_name, app, config_dir)
        @stack_name = stack_name
        @app = app
        @config = FigNewton::Config.from_file(File.join(config_dir, @stack_name))
      end

      def run(parent_directory)
        if @app
          config.apps[@app].clean(parent_directory)
        else
          config.apps.each { |_, app| app.clean(parent_directory) }
        end
      end

      private

      attr_accessor :config, :stack_name
    end
  end
end
