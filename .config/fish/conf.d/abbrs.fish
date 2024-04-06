# apt
abbr --add upg 'sudo apt update && sudo apt upgrade'
abbr --add bupg 'brew update && brew upgrade && brew cleanup'

# git
abbr --add g 'git'

# Docker
abbr --add d 'docker'
abbr --add dc 'docker compose'

# Kubernetes
abbr --add k 'kubectl'

# Node
abbr --add v 'volta'
abbr --add p 'pnpm'
abbr --add y 'yarn'
abbr --add yu 'yarn upgrade-interactive'
abbr --add ydd 'yarn dedupe --strategy highest'
abbr --add pu 'pnpm upgrade --latest --interactive'
abbr --add pur 'pnpm upgrade -r --latest --interactive'
abbr --add pdd 'pnpm dedupe'

# Misc
abbr --add c 'clear'
abbr --add cat 'bat'
abbr --add pcat 'xargs bat'
abbr --add pj 'cd ~/projects'
abbr --add n 'nvim'
abbr --add ws 'websocat'
abbr --add hex 'hexyl'

# Personal
abbr --add kdo 'kb dotfiles open'
abbr --add kio 'kb infra open'

# Backups
abbr --add bk_volta 'volta list --format plain > $DOTFILES_HOME/volta/lockfile.txt'
abbr --add bk_brew 'brew bundle dump --global --describe --file=$DOTFILES_HOME/Brewfile --force && \
	sed -i "/vscode /d" $DOTFILES_HOME/Brewfile'

# Syncs
abbr --add dsync '$DOTFILES_HOME/scripts/stow-sync.sh'

# Function abbreviations
abbr --add r 'reload'
