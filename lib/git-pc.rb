require 'colored'
require 'grit'
require 'git-pc/version'

class GitPc
  attr_accessor :argv

  def run(argv)
    @argv = argv

    status_command
    add_command
    commit_command
    push_command
  end

  private

  def status_command
    puts "Executing status command".green
    puts "git status".yellow
    puts
    %x(git status)
  end

  def add_command
    puts "Executing add command".green
    puts "git add .".yellow
    puts
    %x(git add .)
  end

  def commit_command
    puts "Executing commit command".green
    puts "git commit -S -am #{ message }".yellow
    puts
    %x(git commit -S -am "#{ message }")
  end

  def push_command
    puts "Executing push command".green
    puts "git push origin #{ current_branch }".yellow
    puts
    %x(git push origin #{ current_branch })
  end


  def current_branch
    @current_branch ||= repo.head.name
  end

  def repo
    @repo ||= get_repo
  end

  def message
    @argv[0] || 'no message commit'
  end

  def get_repo
    repo_dir = `git rev-parse --show-toplevel`.chomp
    begin
      @repo = Grit::Repo.new(repo_dir)
    rescue
      raise "We don't seem to be in a git repository."
    end
  end
end