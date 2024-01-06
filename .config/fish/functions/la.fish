function la
	argparse 'a/all' -- $argv

	set -l CMD "ls --color=always -l"

	if set -q _flag_all
		set CMD "$CMD -a"
    end

  	eval "$CMD $argv" | awk '
    {
      	k=0;
      	for (i=0; i<=8; i++)
        	k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));

      	if (k==0)
        {
          	format="%-6s %-9s  %-14s %-10s  %s\n";
          	printf format, "Perms", "User", "Modified", "Size", "Name";
          	printf format, "-----", "----", "--------", "----", "----";
        }
      	else
        	printf("%-6o %-9s  %-4s %-2s %-5s  %-10s  %s\n", k, $3, $6, $7, $8, $5, $9);
    }'
end
