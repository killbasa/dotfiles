#!/usr/bin/env bash

YELLOW="\e[33m"
NC="\e[39m"

yellow() {
	local message="$1"
	echo -e "${YELLOW}$message${NC}"
}
