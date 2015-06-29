# Git related
alias g='git'
alias gb='g branch'
alias gpt='bundle exec rake test; and bundle exec rake jshint; and gp'
alias gc='g c'
alias gco='g co'
alias gst='g st -s'
alias gaa='g add --all'
alias ga='g add'
alias gup='g up'
alias glg='g lg'
alias gdfc='g diff --cached --color-words --patience'
alias gdf='g diff --color-words --patience'
alias hpr='hub pull-request -b'
alias hlog='heroku logs -t -a'
alias hlg='heroku logs -t'
alias hconf='heroku config -a'
alias hp='g push heroku (current_branch):master'
alias current_branch="git rev-parse --abbrev-ref HEAD"
alias magnetic_repo_name="git remote show origin -n | grep 'Fetch' | ruby -e 'puts \$stdin.read.match(/Magnetic\/(.*)\.git/)[1]'"
alias last_commit="git rev-parse HEAD"
alias mysql="mysql -uroot"
alias bb="cd ~/dotfiles; and brew bundle; and cd -"

function gph
  git push $argv (current_branch):master
end

# Code review tool
alias gp='g push origin (current_branch)'
alias current_branch="git rev-parse --abbrev-ref HEAD"
alias last_commit_message_long="git --no-pager log -1 --pretty=%B"
alias last_commit_message_short="git --no-pager log -1 --pretty=%s"
alias previous_commit_hash="git rev-parse HEAD~1"
function review
  gp
  codereview --rev HEAD~1 \
    --title=(last_commit_message_short) \
    --message="Repo: "(magnetic_repo_name)"
Branch: "(current_branch)"

Desc: "(last_commit_message_long)"

Done.
" \
    #--reviewers=CJ,stephen,rob --send_mail
end

function ammend_review
  if test (count $argv) -eq 1
    gp
    codereview --rev HEAD~1 \
      --issue=$argv[1] \
      --title=(last_commit_message_short) \
      --message="Repo: "(magnetic_repo_name)"
Branch: "(current_branch)"

"(last_commit_message_long)"" \
    --reviewers=CJ,stephen,rob --send_mail
  else
    echo "Usage: $_ 4590002"
  end
end

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
alias mag='cd ~/Documents/development/magnetic'
alias dotfiles='cd ~/dotfiles; and vim .; and cd -'
alias godev='cd $GOPATH/src/github.com/maliciousmind'

#alias vim='vim -w ~/.vimlog "$@"'
#alias tmux="tmux -2"
alias http='http'
alias docs='cd ~/Documents'
alias upgradeall='brew update; and brew upgrade'

# Rails
alias rdb='rake db:migrate'
alias be='bundle exec'
alias beg='bundle exec guard -c'
alias rs='bundle exec rails server --binding 127.0.0.1'