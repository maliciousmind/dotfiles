# Path to your oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf

# Path to your oh-my-fish configuration.
set -g OMF_CONFIG $HOME/.config/omf

### Configuration required to load oh-my-fish ###
# Note: Only add configurations that are required to be set before oh-my-fish is loaded.
# For common configurations, we advise you to add them to your $OMF_CONFIG/init.fish file or
# to create a custom plugin instead.

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

if test -f $HOME/.config/fish/aliases.fish
  source $HOME/.config/fish/aliases.fish
end

if test -f $HOME/.config/fish/exports.fish
  source $HOME/.config/fish/exports.fish
end

function fish_title;end
function fish_greeting;end

set default_path /usr/bin /usr/sbin /bin /sbin
set homebrew /usr/local/bin /usr/local/sbin
set brew_rbenv "/usr/local/var/rbenv/shims"
set tmux_gen $HOME/.tmuxgen/bin $HOME/.tmuxgen
set npm_bin /usr/local/share/npm/bin

# Exports for go
set -xg GOPATH $HOME/go
set -xg GOBIN $GOPATH/bin

set appengine_go $HOME/Documents/go_appengine
set go_root /usr/local/opt/go/libexec/bin

set -gx PATH $appengine_go $go_root $homebrew $brew_rbenv \
$default_path $tmux_gen $npm_bin $GOBIN

set -gx RBENV_ROOT /usr/local/var/rbenv
set -e SHELL
status --is-interactive; and . (rbenv init -|psub)

function ggi --description 'Gobally install a gem ie: for all ruby versions'
  set -l versions (rbenv versions | ruby -e '$stdin.read.split("\n").each { |l| version = l.match(/(\d\.\d\.\d-?p?\d{3}?)/); puts version[0] if version;}')
  for version in $versions
    echo Installing $argv[1] for $version
    rbenv local $version
    gem install $argv[1] > /dev/null
  end
end
