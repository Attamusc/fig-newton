require "fig-newton/config"

module FigNewton
  module Commands
    class Pull
      def initialize(stack_name, app, config_dir)
        @stack_name = stack_name
        @app = app
        @config = FigNewton::Config.from_file(config_dir, @stack_name)
      end

      def run(parent_directory)
        if @app
          config.apps[@app].pull(parent_directory)
        else
          config.apps.each { |_, app| app.pull(parent_directory) }
        end
      end

      private

      attr_accessor :config, :stack_name
    end
  end
end
