module FigNewton
  class App
    def initialize(name, config)
      @name = name
      @repo = config["repo"]
      @dir = config["dir"] || dir_from_repo
    end

    def clone(parent_directory = ".")
      clone_directory = full_dir(parent_directory)

      puts "-- Cloning #{full_repo} to '#{clone_directory}'"
      `git clone #{full_repo} #{clone_directory} &>/dev/null`
    end

    private

    attr_accessor :name, :repo, :dir

    def full_repo
      @full_repo ||= case
      when @repo.match(/\w+:\/\//)
        repo
      else
        "https://github.com/#{@repo}"
      end
    end

    def full_dir(parent)
      File.join(parent, @dir)
    end

    def dir_from_repo
      repo.split("/").last
    end
  end
end
