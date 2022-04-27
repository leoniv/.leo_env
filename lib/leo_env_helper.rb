module LeoEnvHelper
  REPO_ROOT = File.expand_path('../../', __FILE__)

  class DotFile
    require 'fileutils'
    ORIGN_SUFF = '.leo_env.origin'

    attr_reader :path, :home
    def initialize(path, home)
      @path = path
      @home = home
    end

    def name
      File.basename(path)
    end

    def origin
      File.join(home, name)
    end

    def origin_backup
      File.join(home, "#{name}#{ORIGN_SUFF}")
    end

    def mv_origin
      return unless origin_exist?
      return if link_exist?
      FileUtils.mv(origin, origin_backup)
    end

    def link
      mv_origin
      return if link_exist?
      File.symlink(path, origin)
    end

    def origin_exist?
      File.exist? origin
    end

    def link_exist?
      return false unless File.symlink?(origin)
      link_path = File.readlink(origin)
      link_path == path
    end
  end

  class ConfigFile < DotFile
    def initialize(path, home)
      super path, File.join(home, ".config")
    end
  end

  class BinFile < DotFile
    def initialize(path, home)
      super path, File.join(home, "bin")
    end
  end

  class Installer
    attr_reader :home
    def initialize(home)
      @home = home
    end

    def dotfiles
      Dir.glob(File.join(REPO_ROOT, 'home', '.*')).select do |f|
        File.basename(f) != '.' && File.basename(f) != '..'
      end.map do |f|
        DotFile.new(f, home)
      end
    end

    def configfiles
      Dir.glob(File.join(REPO_ROOT, 'home', 'config', '*')).select do |f|
        File.basename(f) != '.' && File.basename(f) != '..'
      end.map do |f|
        ConfigFile.new(f, home)
      end
    end

    def binfiles
      Dir.glob(File.join(REPO_ROOT, 'home', 'bin', '*')).select do |f|
        File.basename(f) != '.' && File.basename(f) != '..'
      end.map do |f|
        BinFile.new(f, home)
      end
    end

    def setup_files
      (dotfiles + configfiles + binfiles).each do |dot_file|
        dot_file.link
      end
    end

    def install
      setup_files
      Plug.new.setup.plugin_install
    end
  end

  class Plug
    GITHUB = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    def plugged_dir
      FileUtils.mkdir_p(File.join(REPO_ROOT, 'home/.vim', 'plugged'))[0]
    end

    def plug_dir
      FileUtils.mkdir_p(File.join(REPO_ROOT, 'home/.vim/autoload'))[0]
    end

    def plug_file
      File.join(plug_dir, 'plug.vim')
    end

    def exist?
      File.exist?(plug_file)
    end

    def setup
      plugged_dir
      clone
      self
    end

    def clone
      return if exist?
      `curl -fLo #{plug_file} --create-dirs #{GITHUB}`
    end

    def plugin_install
      system('vim --noplugin -u ~/.vim/plug.vim -N "+set hidden" -N "+PlugInstall --sync" +UpdateRemotePlugins +qall')
    end
  end
end
