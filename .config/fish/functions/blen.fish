function blen
	for i in $argv
		set bytes (printf '%s' $i | wc --bytes)
		echo "(b: $bytes c: $(math $bytes % 4)) $i"
	end
end
