# Fish
alias fr='source ~/.config/fish/config.fish > /dev/null 2>&1'
alias fe='vim ~/.config/fish/config.fish'
alias fexports='vim ~/.config/fish/exports.fish'
alias faliases='vim ~/.config/fish/aliases.fish'

# Typos
alias cl='clear'
alias clar='clear'
alias dofiles='dotfiles'

# Shortcuts
alias drop='cd ~/Dropbox'
alias dev='cd ~/Dropbox/development'
alias mot='cd ~/Dropbox/development/motivii'
alias mas='cd ~/Dropbox/development/motivii/Maslow'
alias asc='cd ~/Dropbox/development/ascential'
alias kit='cd ~/Dropbox/development/ascential/kitchener'
alias cana='cd ~/Dropbox/development/ascential/canneslions-app'
alias canb='cd ~/Dropbox/development/ascential/canneslions-backend'
alias dotfiles='cd ~/dotfiles; and vim .; and cd -'
alias serve_dir='ruby -run -e httpd . -p 5055'
alias tat='tmux attach -t'
alias tls='tmux ls'
alias chr='cd ~/Dropbox/development/digital-chronos'
alias dc='docker-compose'
alias dce='dc exec'
alias dcew='dce web'
alias kt='dc run -e MIX_ENV=test web mix test'

alias time_in_london='cd ~/Dropbox/time_in_london/; bundle check; or bundle install; bundle exec ruby time_in_london.rb; cd -'
function time_until
  cd ~/Dropbox/time_in_london/; and bundle exec ruby time_until.rb $argv; and cd -
end

alias docs='cd ~/Documents'
alias upgradeall='brew update; and brew upgrade; and omf update'

# Rails
alias rdb='bundle exec rake db:migrate'
alias rdbt='bundle exec rake db:migrate db:test:prepare'
alias be='bundle exec'
alias beg='bundle exec guard -c'
alias rs='bundle exec rails server --binding 127.0.0.1'
alias berc='bundle exec rails console'
alias bec='bundle exec cucumber'
alias berr='bundle exec rake routes'
alias berrg='bundle exec rake routes | grep '

# Phoenix
alias mps='mix phoenix.server'
alias mpr='mix phoenix.routes'
alias mdp='mix deps.get'
alias mpc='iex -S mix'

# Git
alias g='git'
alias gb='g branch'
alias gbd='g branch -d'
alias gpt='bundle exec rake test; and bundle exec rake jshint; and gp'
alias gc='g c -S'
alias gca='gc --amend'
alias gco='g co'
alias gcob='gco -b'
alias gst='g st -s'
alias gaa='g add --all'
alias ga='g add'
alias gup='g up'
alias glg='g lg'
alias gdfc='g diff --cached --color-words --patience'
alias gdf='g diff --color-words --patience'
alias gp='g push -u origin (current_branch)'
alias gpf='gp --force'
alias gtags='g ctags'
alias current_branch='git rev-parse --abbrev-ref HEAD'
alias clean_local_branches='git branch --merged develop | grep -v master | grep -v develop | xargs git branch -d'
function create_remote_branch
  gcob $argv
  gp
end
alias hpr='gp; and hub pull-request -b'
alias bbpr='gp; and bitbucket pull_request (current_branch)'
alias current_branch='git rev-parse --abbrev-ref HEAD'
alias last_commit_message_long='git --no-pager log -1 --pretty=%B'
alias last_commit_message_short='git --no-pager log -1 --pretty=%s'
alias previous_commit_hash='git rev-parse HEAD~1'

alias last_commit='git rev-parse HEAD'
function gph
  git push $argv (current_branch):master
end

function branch_creation_commit
  git merge-base master (current_branch)
end

# heroku
alias hk='/usr/local/bin/heroku'
alias hlog='hk logs -t -a'
alias hlg='hk logs -t'
alias hconf='hk config -a'
alias hp='g push heroku (current_branch):master'

function railsgirls
  eval $argv --app desolate-coast-9056
end

alias bb='cd ~/dotfiles; brew update; and brew upgrade; and brew bundle; cd -'
alias rails-development-box='ssh ubuntu@54.194.162.16'
alias redis='redis-server --daemonize yes; and redis-cli flushall'
alias prc='production hk run rails c'

function pipeset --no-scope-shadowing
    set -l _options
    set -l _variables
    for _item in $argv
        switch $_item
            case '-*'
                set _options $_options $_item
            case '*'
                set _variables $_variables  $_item
        end
    end
    for _variable in $_variables
        set $_variable ""
    end
    while read _line
        for _variable in $_variables
            set $_options $_variable $$_variable$_line\n
        end
    end
    return 0
end
