#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

function __fishline_segment_close -d "close the previous fishline segment"

    set FLINT_LAST true
    __fishline_segment normal normal
    set FLINT_LAST false
    set -e FLINT_BCOLOR
    set FLINT_FIRST true

end
