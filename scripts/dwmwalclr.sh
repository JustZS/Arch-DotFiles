#!/bin/bash

# Get the line number of the second-to-last line
LINE=$(($(wc -l < ~/.cache/wal/colors-wal-dwm.h)-1))

sed -i '/^static const char norm_bg\[\] =/s/"[^"]*"/"#000000"/' ~/.cache/wal/colors-wal-dwm.h

# Swap urg_bg and ##temp_fg## in the second-to-last line
sed -i "${LINE}s/urg_bg/norm_bg/" ~/.cache/wal/colors-wal-dwm.h

# Replace urg_fg with a temporary value in the second-to-last line
sed -i "${LINE}s/urg_fg/norm_bg/" ~/.cache/wal/colors-wal-dwm.h

# Replace SchemeUrg with SchemeSel in the second-to-last line
sed -i "${LINE}s/SchemeUrg/SchemeSel/" ~/.cache/wal/colors-wal-dwm.h

