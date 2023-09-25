#include "config.h"

#include "block.h"
#include "util.h"

Block blocks[] = {
    {"temp.sh", 300, 9},
    {"battery.sh", 1, 1},
    {"volume.sh", 1, 4},
    {"music.sh", 1, 3},
    {"wifi.sh", 1, 7},
    {"brightness.sh", 1, 11},
    {"weather_script.sh", 30, 6},
	{"mlb_score", 10, 17},
    {"date.sh", 1, 5},
    {"cal.sh", 60, 2},
    {"powerbutton.sh", 0, 10},
    {"space.sh", 1, 16},
};

const unsigned short blockCount = LEN(blocks);
