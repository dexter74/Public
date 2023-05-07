clear;
kill -s TERM $(pidof rsync);
kill -s TERM $(pgrep rsync);
kill -s kill $(pidof rsync);
