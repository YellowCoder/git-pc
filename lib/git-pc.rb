require 'colored'
require 'grit'
require 'git-pc/version'

class GitPc
  def initialize(argv)
    @argv = argv
    handle_args
  end

  private

  def run
    status_command
    add_command
    commit_command
    push_command
  end

  def status_command
    puts 'Executing status command'.green
    puts 'git status'.yellow
    puts
    %x(git status)
  end

  def push_command
    puts 'Executing push command'.green
    puts "git push origin #{ current_branch }".yellow
    puts
    %x(git push origin #{ current_branch })
  end

  def commit_command
    puts 'Executing commit command'.green
    puts "git commit -S -m #{ message }".yellow
    puts
    %x(git commit -S -m "#{ message }")
  end

  def add_command
    puts 'Executing add command'.green
    puts 'git add .'.yellow
    puts
    %x(git add .)
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

  def help_message
    help = <<HELP
  Shortcut to create a commit and push them.
      $ git pc 'message commit' # create a commit and push them
      $ git up --version        # print version info
      $ git up --help           # print this message
HELP
    help
  end

  def handle_args
    case @argv
    when []
      puts '** You need to pass some arg **'.red
      exit
    when ['-v'], ['--version']
      puts "git-pc #{ GitPc::VERSION }"
      exit
    when ['-h'], ['--help']
      puts help_message.yellow
    else
      run
    end
  end
end