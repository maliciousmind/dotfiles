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
alias rapps='cd ~/Documents/rails-apps'
alias dev='cd ~/Documents/development'
alias mot='cd ~/Documents/development/motivii'
alias mas='cd ~/Documents/development/motivii/Maslow'
alias dotfiles='cd ~/dotfiles; and vim .; and cd -'
alias godev='cd $GOPATH/src/github.com/maliciousmind'
alias serve_dir='ruby -run -e httpd . -p 5055'
alias tat='tmux attach -t'
alias tls='tmux ls'

alias time_in_london='cd ~/Dropbox/time_in_london/; and bundle exec ruby time_in_london.rb; and cd -'

alias docs='cd ~/Documents'
alias upgradeall='brew update; and brew upgrade; and omf update; and omf self-update'

# Rails
alias rdb='rake db:migrate'
alias rdbt='rake db:migrate db:test:prepare'
alias be='bundle exec'
alias beg='bundle exec guard -c'
alias rs='bundle exec rails server --binding 127.0.0.1'
#alias rc='bundle exec rails console'

alias dc='docker-compose'
function codeclimate
  docker run \
    --interactive --tty --rm \
    --env CODE_PATH="$PWD" \
    --volume "$PWD":/code \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /tmp/cc:/tmp/cc \
    codeclimate/codeclimate $argv
end

# Git
alias g='git'
alias gb='g branch'
alias gpt='bundle exec rake test; and bundle exec rake jshint; and gp'
alias gc='g c'
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
alias gp='g push origin (current_branch)'
alias gpf='gp --force'
alias current_branch='git rev-parse --abbrev-ref HEAD'
alias clean_local_branches='git branch --merged develop | grep -v master | grep -v develop | xargs git branch -d'
alias hpr='hub pull-request -b'
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
alias hk='/usr/local/Cellar/heroku-toolbelt/3.42.17/bin/heroku'
alias hlog='hk logs -t -a'
alias hlg='hk logs -t'
alias hconf='hk config -a'
alias hp='g push heroku (current_branch):master'

function production
  eval $argv --app motivii-maslow-production
end

function staging
  eval $argv --app motivii-maslow-staging
end

alias mysql='mysql -uroot'
alias bb='cd ~/dotfiles; and brew bundle; and cd -'

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
