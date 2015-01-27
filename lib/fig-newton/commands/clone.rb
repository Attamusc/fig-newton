require "pp"
require "fig-newton/config"

module FigNewton
  module Commands
    class Clone
      def initialize(stack_name)
        @stack_name = stack_name
        @config = FigNewton::Config.from_file(@stack_name)
      end

      def run(parent_directory)
        config.apps.each do |app|
          app.clone(parent_directory)
        end
      end

      private

      attr_accessor :config, :stack_name
    end
  end
end
