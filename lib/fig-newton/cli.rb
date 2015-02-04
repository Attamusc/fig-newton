require "thor"

module FigNewton
  class CLI < Thor
    class_option :conf, type: :string,
                        default: ".",
                        desc: "The directory where fig-newton should look for stack configuration files",
                        aliases: ["c"]

    desc "init STACK_NAME", "Generate a skeleton description file for the STACK_NAME application stack"
    option :force, type: :boolean,
                   default: false,
                   desc: "Overwrite file if it already exists",
                   aliaes: ["f"]
    def init(stack_name)
      require "fig-newton/commands/init"
      command = FigNewton::Commands::Init.new(stack_name, options[:conf])
      command.run(options[:force])
    end

    desc "clone STACK_NAME", "Use git to pull down the repositories for the given stack"
    option :parent_directory, type: :string,
                              default: ".",
                              desc: "The parent directory of the cloned repositories",
                              aliases: ["p"]
    def clone(stack_name)
      require "fig-newton/commands/clone"
      command = FigNewton::Commands::Clone.new(stack_name, options[:conf])
      command.run(options[:parent_directory])
    end

    desc "up STACK_NAME", "Bring up all the applications defined for the given stack. Equivalent to running fig up in each application directory."
    option :parent_directory, type: :string,
                              default: ".",
                              desc: "The parent directory of the cloned repositories",
                              aliases: ["p"]
    def up(stack_name)
      require "fig-newton/commands/up"
      command = FigNewton::Commands::Up.new(stack_name, options[:conf])
      command.run(options[:parent_directory])
    end

    desc "down STACK_NAME", "Bring down all the applications defined for the given stack. Equivalent to running fig kill in each application directory."
    option :parent_directory, type: :string,
                              default: ".",
                              desc: "The parent directory of the cloned repositories",
                              aliases: ["p"]
    def down(stack_name)
      require "fig-newton/commands/down"
      command = FigNewton::Commands::Down.new(stack_name, options[:conf])
      command.run(options[:parent_directory])
    end
  end
end
