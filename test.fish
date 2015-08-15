#!/usr/bin/env fish

if not set -q FLINE_PATH
    set -g FLINE_PATH (pwd)
end

source $FLINE_PATH/fishline.fish

set -l SEGMENTS

if [ (count $argv) -eq 0 ]
    set SEGMENTS (functions | sed -nr 's/FLSEG_(\S+)/\1/p')
else
    set SEGMENTS $argv
end

echo

for SEG in $SEGMENTS

    printf '%*s\r' (tput cols) '' | tr ' ' -
    printf "-- Testing segment: %s --\n\n" $SEG

    if functions FLTEST_$SEG > /dev/null
        eval FLTEST_$SEG
    else
        printf "No test availlable for segment: %s\n\n" $SEG
    end

end

printf '%*s\r' (tput cols) '' | tr ' ' -
printf "-- Done Testing --\n\n" $SEG
