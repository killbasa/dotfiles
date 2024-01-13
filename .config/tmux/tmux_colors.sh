#!/usr/bin/env bash

print_color() {
	for i in {0..255} ; do
		printf "\x1b[38;5;%smcolour%s\n" "${i}" "${i}"
	done
}

print_color | less -r
