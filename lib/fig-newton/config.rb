require "yaml"
require "fig-newton/app"

module FigNewton
  class Config
    def self.filepath_from_stack(config_dir, stack_name)
      File.join(config_dir, "#{stack_name}.yml")
    end

    def self.from_file(config_dir, stack_name)
      filename = absolute_path(config_dir, stack_name)
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
      @apps ||= data["apps"].each_with_object({}) do |app, apps|
        name, config = app.flatten
        apps[name] = FigNewton::App.new(name, config)
        apps
      end
    end

    private

    attr_accessor :data, :filename

    def self.absolute_path(config_path, stack_name)
      dir = if config_path[0] =~ /\//
              config_path
            else
              File.absolute_path(File.join(".", config_path))
            end

      filepath_from_stack(dir, stack_name)
    end
  end
end
