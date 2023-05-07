clear;

kill -s TERM $(pidof rsync) 2>/dev/null;
kill -s TERM $(pgrep rsync) 2>/dev/null;
kill -s kill $(pidof rsync) 2>/dev/null;

