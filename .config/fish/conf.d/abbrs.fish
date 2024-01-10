# apt
abbr --add au 'sudo apt full-upgrade'
abbr --add upg 'sudo apt update && sudo apt upgrade'

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

# Misc
abbr --add c 'clear'
abbr --add cat 'bat'
abbr --add de 'direnv'
abbr --add projects 'cd ~/projects'
abbr --add n 'nvim'

# Personal
abbr --add kdo 'kb dotfiles open'
abbr --add kio 'kb infra open'

# Backups
abbr --add bk_volta 'volta list --format plain > ~/dotfiles/volta/lockfile.txt'
abbr --add bk_brew 'brew bundle dump --global --describe --file=~/dotfiles/Brewfile -f && sed -i "/vscode /d" Brewfile'

# Function abbreviations
abbr --add r 'reload'
