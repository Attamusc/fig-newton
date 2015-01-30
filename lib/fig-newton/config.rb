require "yaml"
require "fig-newton/app"

module FigNewton
  class Config
    def self.filepath_from_stack(stack_name)
      File.join(".", "#{stack_name}.yml")
    end

    def self.from_file(stack_name)
      filename = filepath_from_stack(stack_name)
      data = YAML::load_file(filename)

      new(data, filename)
    end

    def initialize(data, filename)
      @data = data
      @filename = filename
    end

    def name
      data["name"]
    end

    def apps
      @apps ||= data["apps"].map do |name, config|
        FigNewton::App.new(name, config)
      end
    end

    private

    attr_accessor :data, :filename
  end
end
