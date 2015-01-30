require "fig-newton/config"

module FigNewton
  module Commands
    class Init
      def initialize(stack_name)
        @stack_name = stack_name
        @yaml = nil
      end

      def run(forced = false)
        generate_yaml
        write_yaml(forced)
      end

      private

      def generate_yaml
        @yaml = unindent(<<-YAML)
          name: #{@stack_name}
          apps:
            tugboat:
              repo: "behance/tugboat"
            example-app:
              repo: "behance/example"
              dir: "xmp"
        YAML
      end

      def write_yaml(forced)
        if File.exist?(stack_filename) && !forced
          puts "The file \"#{stack_filename}\" already exists. Use --force to overwrite it"
          return
        end

        File.open(stack_filename, "w") { |f| f.write(@yaml) }
      end

      def stack_filename
        @filename ||= FigNewton::Config.filepath_from_stack(@stack_name)
      end

      def unindent(s)
        s.gsub(/^#{s.scan(/^[ \t]+(?=\S)/).min}/, "")
      end
    end
  end
end
