require 'fileutils'

task :default => ['installer:create_branch_file','installer:build']

namespace :installer do
  desc "Build the script branch shell file dynamically"
  task :create_branch_file do
    File.open("scripts/set_script_branch.sh", "w+") do |f|
      f << "\n# This refers to the branch of our repo that we are using (for cloning)." +
           "\nBRANCH=#{`git rev-parse --abbrev-ref HEAD`}"
    end
  end

  desc "Build installscripts from manifest files"
  task :build do
    puts "Building installs from manifests..."
    system("./bin/build.rb")
    puts "Finished!"
  end

  desc "Adds built files for committing"
  task :add do
    system("git add .")
    system("git commit -m 'Rebuilds scripts'")
  end

end

namespace :dotfiles do

  desc "copy dotfiles"
  task :copy do

    # create backup folder
    time = Time.now.strftime("%Y%m%d%H%M%S")
    FileUtils.mkdir_p("#{ENV['HOME']}/.wdi/dotfiles/backup_#{time}")
    Dir.glob("settings/*").each do |path|
      file = File.basename(path)

      local_file = File.expand_path("~/.#{file}")

      if File.exist? local_file
        puts "backing up #{local_file}"
        FileUtils.cp(local_file, "#{ENV['HOME']}/.wdi/dotfiles/backup_#{time}/")
      end

      puts "copying file"
      FileUtils.cp(path, "#{ENV['HOME']}/.#{file}")
    end

  end

end
