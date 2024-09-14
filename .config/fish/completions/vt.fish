# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_vt_global_optspecs
	string join \n h/help V/version
end

function __fish_vt_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_vt_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_vt_using_subcommand
	set -l cmd (__fish_vt_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c vt -n "__fish_vt_needs_command" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_needs_command" -s V -l version -d 'Print version'
complete -c vt -n "__fish_vt_needs_command" -f -a "channel" -d 'Manage the config file'
complete -c vt -n "__fish_vt_needs_command" -f -a "complete" -d 'Generate autocompletions'
complete -c vt -n "__fish_vt_needs_command" -f -a "config" -d 'Manage the config file'
complete -c vt -n "__fish_vt_needs_command" -f -a "get" -d 'Get a channel\'s live or upcoming streams'
complete -c vt -n "__fish_vt_needs_command" -f -a "lists" -d 'Manage the config file'
complete -c vt -n "__fish_vt_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from add list move remove help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from add list move remove help" -f -a "add" -d 'Set a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from add list move remove help" -f -a "list" -d 'List channels'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from add list move remove help" -f -a "move" -d 'Change a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from add list move remove help" -f -a "remove" -d 'Remove a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from add list move remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "add" -d 'Set a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "list" -d 'List channels'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "move" -d 'Change a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand complete" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find help" -f -a "apikey" -d 'Set a YouTube API key'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find help" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from apikey" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "apikey" -d 'Set a YouTube API key'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand get" -l json
complete -c vt -n "__fish_vt_using_subcommand get" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -f -a "add" -d 'Add a channel to a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -f -a "create" -d 'Create a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -f -a "delete" -d 'Delete a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -f -a "get" -d 'Get a channel\'s live or upcoming streams'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -f -a "list" -d 'List lists'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -f -a "remove" -d 'Remove a channel from a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and not __fish_seen_subcommand_from add create delete get list remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from get" -l json
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a channel to a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from help" -f -a "get" -d 'Get a channel\'s live or upcoming streams'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from help" -f -a "list" -d 'List lists'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a channel from a list'
complete -c vt -n "__fish_vt_using_subcommand lists; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel complete config get lists help" -f -a "channel" -d 'Manage the config file'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel complete config get lists help" -f -a "complete" -d 'Generate autocompletions'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel complete config get lists help" -f -a "config" -d 'Manage the config file'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel complete config get lists help" -f -a "get" -d 'Get a channel\'s live or upcoming streams'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel complete config get lists help" -f -a "lists" -d 'Manage the config file'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel complete config get lists help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "add" -d 'Set a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "list" -d 'List channels'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "move" -d 'Change a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "remove" -d 'Remove a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "apikey" -d 'Set a YouTube API key'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from lists" -f -a "add" -d 'Add a channel to a list'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from lists" -f -a "create" -d 'Create a list'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from lists" -f -a "delete" -d 'Delete a list'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from lists" -f -a "get" -d 'Get a channel\'s live or upcoming streams'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from lists" -f -a "list" -d 'List lists'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from lists" -f -a "remove" -d 'Remove a channel from a list'
