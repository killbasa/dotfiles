complete -c vt -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c vt -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c vt -n "__fish_use_subcommand" -f -a "channel" -d 'Manage the config file'
complete -c vt -n "__fish_use_subcommand" -f -a "complete" -d 'Generate autocompletions. Example: `vt complete fish > ~/.config/fish/completions/vt.fish`'
complete -c vt -n "__fish_use_subcommand" -f -a "config" -d 'Manage the config file'
complete -c vt -n "__fish_use_subcommand" -f -a "get"
complete -c vt -n "__fish_use_subcommand" -f -a "list"
complete -c vt -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "add"
complete -c vt -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "list"
complete -c vt -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "rm"
complete -c vt -n "__fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from rm" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "add"
complete -c vt -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "list"
complete -c vt -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "rm"
complete -c vt -n "__fish_seen_subcommand_from channel; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_seen_subcommand_from complete" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from config; and not __fish_seen_subcommand_from find; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from config; and not __fish_seen_subcommand_from find; and not __fish_seen_subcommand_from help" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_seen_subcommand_from config; and not __fish_seen_subcommand_from find; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_seen_subcommand_from config; and __fish_seen_subcommand_from find" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from config; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from find; and not __fish_seen_subcommand_from help" -f -a "find" -d 'Check the config path'
complete -c vt -n "__fish_seen_subcommand_from config; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from find; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_seen_subcommand_from get" -s l -l limit -r
complete -c vt -n "__fish_seen_subcommand_from get" -l json
complete -c vt -n "__fish_seen_subcommand_from get" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c vt -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from complete; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "channel" -d 'Manage the config file'
complete -c vt -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from complete; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "complete" -d 'Generate autocompletions. Example: `vt complete fish > ~/.config/fish/completions/vt.fish`'
complete -c vt -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from complete; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "config" -d 'Manage the config file'
complete -c vt -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from complete; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "get"
complete -c vt -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from complete; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "list"
complete -c vt -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from complete; and not __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c vt -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm" -f -a "add"
complete -c vt -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm" -f -a "list"
complete -c vt -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from channel; and not __fish_seen_subcommand_from add; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from rm" -f -a "rm"
complete -c vt -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from config; and not __fish_seen_subcommand_from find" -f -a "find" -d 'Check the config path'
