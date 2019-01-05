# cURL Average Timings

This is a simple bash script to get the averages of various website response timings using cURL.

### Requirements
```
sudo apt-get install curl #cURL command line tool
sudo apt-get install bc #bc command line calculator
```

### How to use
```bash
git clone git@github.com:chentda/curl-average-timings.git

cd curl-average-timings

./curl_average_timings.sh <"URL for website"> <Number of iterations as integer>

```

### Example


### cURL Timings Definitions (According to [cURL's manual page](https://curl.haxx.se/docs/manpage.html))
* **namelookup**: The time, in seconds, it took from the start until the name resolving was completed.
* **connect**: The time, in seconds, it took from the start until the TCP connect to the remote host (or proxy) was completed.
* **appconnect**: The time, in seconds, it took from the start until the SSL/SSH/etc connect/handshake to the remote host was completed.
* **pretransfer**: The time, in seconds, it took from the start until the file transfer was just about to begin. This includes all pre-transfer commands and negotiations that are specific to the particular protocol(s) involved.
* **redirect**: The time, in seconds, it took for all redirection steps include name lookup, connect, pretransfer and transfer before the final transaction was started. time_redirect shows the complete execution time for multiple redirections.
* **starttransfer**: The time, in seconds, it took from the start until the first byte was just about to be transferred. This includes time_pretransfer and also the time the server needed to calculate the result.
* **total**: The total time, in seconds, that the full operation lasted. The time will be displayed with millisecond resolution.
