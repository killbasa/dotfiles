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
complete -c vt -n "__fish_vt_needs_command" -f -a "channel" -d 'Manage channels'
complete -c vt -n "__fish_vt_needs_command" -f -a "check" -d 'Check the live or upcoming streams of a channel'
complete -c vt -n "__fish_vt_needs_command" -f -a "complete" -d 'Generate autocompletions'
complete -c vt -n "__fish_vt_needs_command" -f -a "config" -d 'Manage the config file'
complete -c vt -n "__fish_vt_needs_command" -f -a "groups" -d 'Manage groups'
complete -c vt -n "__fish_vt_needs_command" -f -a "update" -d 'Update the vt install'
complete -c vt -n "__fish_vt_needs_command" -f -a "video" -d 'Video utilities'
complete -c vt -n "__fish_vt_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from create delete info list rename help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from create delete info list rename help" -f -a "create" -d 'Create a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from create delete info list rename help" -f -a "delete" -d 'Delete a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from create delete info list rename help" -f -a "info" -d 'Get information about a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from create delete info list rename help" -f -a "list" -d 'List channels'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from create delete info list rename help" -f -a "rename" -d 'Rename a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and not __fish_seen_subcommand_from create delete info list rename help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "info" -d 'Get information about a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "list" -d 'List channels'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "rename" -d 'Rename a channel'
complete -c vt -n "__fish_vt_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand check" -l json -d 'Show the output in JSON format'
complete -c vt -n "__fish_vt_using_subcommand check" -s v -l verbose -d 'Show verbose output'
complete -c vt -n "__fish_vt_using_subcommand check" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand complete" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find show help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find show help" -f -a "apikey" -d 'Set a YouTube API key'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find show help" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find show help" -f -a "show" -d 'Show the current config'
complete -c vt -n "__fish_vt_using_subcommand config; and not __fish_seen_subcommand_from apikey find show help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from apikey" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "apikey" -d 'Set a YouTube API key'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show the current config'
complete -c vt -n "__fish_vt_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "add" -d 'Add a channel to a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "check" -d 'Check the live or upcoming streams of the channels in a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "create" -d 'Create a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "delete" -d 'Delete a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "list" -d 'List groups'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "remove" -d 'Remove a channel from a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "rename" -d 'Rename a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and not __fish_seen_subcommand_from add check create delete list remove rename help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from check" -l json -d 'Show the output in JSON format'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from check" -s v -l verbose -d 'Show verbose output'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from check" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "add" -d 'Add a channel to a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "check" -d 'Check the live or upcoming streams of the channels in a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "list" -d 'List groups'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove a channel from a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "rename" -d 'Rename a group'
complete -c vt -n "__fish_vt_using_subcommand groups; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand update" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand video; and not __fish_seen_subcommand_from check help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand video; and not __fish_seen_subcommand_from check help" -f -a "check" -d 'Check the information of a video'
complete -c vt -n "__fish_vt_using_subcommand video; and not __fish_seen_subcommand_from check help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand video; and __fish_seen_subcommand_from check" -s h -l help -d 'Print help'
complete -c vt -n "__fish_vt_using_subcommand video; and __fish_seen_subcommand_from help" -f -a "check" -d 'Check the information of a video'
complete -c vt -n "__fish_vt_using_subcommand video; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "channel" -d 'Manage channels'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "check" -d 'Check the live or upcoming streams of a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "complete" -d 'Generate autocompletions'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "config" -d 'Manage the config file'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "groups" -d 'Manage groups'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "update" -d 'Update the vt install'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "video" -d 'Video utilities'
complete -c vt -n "__fish_vt_using_subcommand help; and not __fish_seen_subcommand_from channel check complete config groups update video help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "create" -d 'Create a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "delete" -d 'Delete a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "info" -d 'Get information about a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "list" -d 'List channels'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "rename" -d 'Rename a channel'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "apikey" -d 'Set a YouTube API key'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "show" -d 'Show the current config'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from groups" -f -a "add" -d 'Add a channel to a group'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from groups" -f -a "check" -d 'Check the live or upcoming streams of the channels in a group'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from groups" -f -a "create" -d 'Create a group'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from groups" -f -a "delete" -d 'Delete a group'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from groups" -f -a "list" -d 'List groups'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from groups" -f -a "remove" -d 'Remove a channel from a group'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from groups" -f -a "rename" -d 'Rename a group'
complete -c vt -n "__fish_vt_using_subcommand help; and __fish_seen_subcommand_from video" -f -a "check" -d 'Check the information of a video'
