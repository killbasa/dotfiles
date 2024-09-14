# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_kb_global_optspecs
	string join \n h/help V/version
end

function __fish_kb_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_kb_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_kb_using_subcommand
	set -l cmd (__fish_kb_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c kb -n "__fish_kb_needs_command" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_needs_command" -s V -l version -d 'Print version'
complete -c kb -n "__fish_kb_needs_command" -f -a "clone" -d 'Clone a repository'
complete -c kb -n "__fish_kb_needs_command" -f -a "complete" -d 'Generate autocompletions. Example: `kb complete fish > ~/.config/fish/completions/kb.fish`'
complete -c kb -n "__fish_kb_needs_command" -f -a "config" -d 'Manage the config file'
complete -c kb -n "__fish_kb_needs_command" -f -a "dotfiles" -d 'Manage dotfiles'
complete -c kb -n "__fish_kb_needs_command" -f -a "infra" -d 'Manage infra'
complete -c kb -n "__fish_kb_needs_command" -f -a "open" -d 'Open a package\'s home page'
complete -c kb -n "__fish_kb_needs_command" -f -a "shrink" -d 'Shrink a black hole'
complete -c kb -n "__fish_kb_needs_command" -f -a "template" -d 'Generate a repository from a template'
complete -c kb -n "__fish_kb_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand clone" -s f -l force -d 'Force overwrite the target path'
complete -c kb -n "__fish_kb_using_subcommand clone" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand complete" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand config; and not __fish_seen_subcommand_from find set print help" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand config; and not __fish_seen_subcommand_from find set print help" -f -a "find" -d 'Check the config path'
complete -c kb -n "__fish_kb_using_subcommand config; and not __fish_seen_subcommand_from find set print help" -f -a "set" -d 'Manage dotfiles'
complete -c kb -n "__fish_kb_using_subcommand config; and not __fish_seen_subcommand_from find set print help" -f -a "print"
complete -c kb -n "__fish_kb_using_subcommand config; and not __fish_seen_subcommand_from find set print help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from set" -f -a "dotfiles" -d 'Set the dotfiles repository path'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from set" -f -a "infra" -d 'Set the infra repository path'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from set" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from print" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "find" -d 'Check the config path'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "set" -d 'Manage dotfiles'
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "print"
complete -c kb -n "__fish_kb_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and not __fish_seen_subcommand_from diff find open help" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and not __fish_seen_subcommand_from diff find open help" -f -a "diff" -d 'Check if there are uncommited dotfile changes'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and not __fish_seen_subcommand_from diff find open help" -f -a "find" -d 'Check the dotfiles path'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and not __fish_seen_subcommand_from diff find open help" -f -a "open" -d 'Open the dotfiles repo in VSCode'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and not __fish_seen_subcommand_from diff find open help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and __fish_seen_subcommand_from help" -f -a "diff" -d 'Check if there are uncommited dotfile changes'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and __fish_seen_subcommand_from help" -f -a "find" -d 'Check the dotfiles path'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and __fish_seen_subcommand_from help" -f -a "open" -d 'Open the dotfiles repo in VSCode'
complete -c kb -n "__fish_kb_using_subcommand dotfiles; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand infra; and not __fish_seen_subcommand_from diff find open help" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand infra; and not __fish_seen_subcommand_from diff find open help" -f -a "diff" -d 'Check if there are uncommited infra changes'
complete -c kb -n "__fish_kb_using_subcommand infra; and not __fish_seen_subcommand_from diff find open help" -f -a "find" -d 'Check the infra path'
complete -c kb -n "__fish_kb_using_subcommand infra; and not __fish_seen_subcommand_from diff find open help" -f -a "open" -d 'Open the infra repo in VSCode'
complete -c kb -n "__fish_kb_using_subcommand infra; and not __fish_seen_subcommand_from diff find open help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand infra; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand infra; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand infra; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand infra; and __fish_seen_subcommand_from help" -f -a "diff" -d 'Check if there are uncommited infra changes'
complete -c kb -n "__fish_kb_using_subcommand infra; and __fish_seen_subcommand_from help" -f -a "find" -d 'Check the infra path'
complete -c kb -n "__fish_kb_using_subcommand infra; and __fish_seen_subcommand_from help" -f -a "open" -d 'Open the infra repo in VSCode'
complete -c kb -n "__fish_kb_using_subcommand infra; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand open; and not __fish_seen_subcommand_from node rust help" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand open; and not __fish_seen_subcommand_from node rust help" -f -a "node" -d 'Open pages for an NPM package'
complete -c kb -n "__fish_kb_using_subcommand open; and not __fish_seen_subcommand_from node rust help" -f -a "rust" -d 'Open pages for a Crate'
complete -c kb -n "__fish_kb_using_subcommand open; and not __fish_seen_subcommand_from node rust help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from node" -s g -l github -d 'If the GitHub repository should be opened'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from node" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from rust" -s d -l docs -d 'If the docs should be opened'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from rust" -s g -l github -d 'If the GitHub repository should be opened'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from rust" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from help" -f -a "node" -d 'Open pages for an NPM package'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from help" -f -a "rust" -d 'Open pages for a Crate'
complete -c kb -n "__fish_kb_using_subcommand open; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand shrink" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand template; and not __fish_seen_subcommand_from init list help" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand template; and not __fish_seen_subcommand_from init list help" -f -a "init" -d 'Clone a template'
complete -c kb -n "__fish_kb_using_subcommand template; and not __fish_seen_subcommand_from init list help" -f -a "list" -d 'List available templates'
complete -c kb -n "__fish_kb_using_subcommand template; and not __fish_seen_subcommand_from init list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand template; and __fish_seen_subcommand_from init" -s f -l force -d 'Force overwrite the target path'
complete -c kb -n "__fish_kb_using_subcommand template; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand template; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c kb -n "__fish_kb_using_subcommand template; and __fish_seen_subcommand_from help" -f -a "init" -d 'Clone a template'
complete -c kb -n "__fish_kb_using_subcommand template; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available templates'
complete -c kb -n "__fish_kb_using_subcommand template; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "clone" -d 'Clone a repository'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "complete" -d 'Generate autocompletions. Example: `kb complete fish > ~/.config/fish/completions/kb.fish`'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "config" -d 'Manage the config file'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "dotfiles" -d 'Manage dotfiles'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "infra" -d 'Manage infra'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "open" -d 'Open a package\'s home page'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "shrink" -d 'Shrink a black hole'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "template" -d 'Generate a repository from a template'
complete -c kb -n "__fish_kb_using_subcommand help; and not __fish_seen_subcommand_from clone complete config dotfiles infra open shrink template help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "find" -d 'Check the config path'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "set" -d 'Manage dotfiles'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "print"
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from dotfiles" -f -a "diff" -d 'Check if there are uncommited dotfile changes'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from dotfiles" -f -a "find" -d 'Check the dotfiles path'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from dotfiles" -f -a "open" -d 'Open the dotfiles repo in VSCode'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from infra" -f -a "diff" -d 'Check if there are uncommited infra changes'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from infra" -f -a "find" -d 'Check the infra path'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from infra" -f -a "open" -d 'Open the infra repo in VSCode'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from open" -f -a "node" -d 'Open pages for an NPM package'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from open" -f -a "rust" -d 'Open pages for a Crate'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from template" -f -a "init" -d 'Clone a template'
complete -c kb -n "__fish_kb_using_subcommand help; and __fish_seen_subcommand_from template" -f -a "list" -d 'List available templates'
