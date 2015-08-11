namespace :copy_strategy do

  task :detach_git do
    Rake::Task['git:check'].clear
    Rake::Task['git:create_release'].clear
    task :'git:check' => :'copy_strategy:check'
    task :'git:create_release' => :'copy_strategy:create_release'
  end

  task :check do
    puts 'checking git...'
  end

  task :create_release do
    revision = `git ls-remote #{fetch(:repo_url)} HEAD`.split(' ')[0]
    tmp_dir = ENV['TMPDIR'] || '/tmp/'
    local_filename = "#{tmp_dir}#{revision}.tar.gz"
    sh "git archive --remote=#{fetch(:repo_url)} #{fetch(:branch, 'master')} | gzip > #{local_filename}"
    on roles(:all) do
      execute :mkdir, '-p', release_path
      upload!(local_filename, release_path)
      within release_path do
        execute :cat, "#{revision}.tar.gz | tar xz"
      end
    end
  end
end
namespace :deploy do
  task :check => :'copy_strategy:detach_git'
  task :updating => :'copy_strategy:detach_git'
end
