#!/bin/bash

#This is a simple bash script to get the averages of various website response timings using cURL

#Formatted cURL output that contains the various response timings separated by '-'
curl_format="%{time_namelookup}-%{time_connect}-%{time_appconnect}-%{time_pretransfer}-%{time_redirect}-%{time_starttransfer}-%{time_total}"
#Website you want to send the request to
URL=$1
#How many requests you want to hit website with to get averages
iterations=$2
decimal_rounding=5

#Initialising total variables for the various timings
total_time_namelookup="0"
total_time_connect="0"
total_time_appconnect="0"
total_time_pretransfer="0"
total_time_redirect="0"
total_time_starttransfer="0"
total_time_total="0"

for i in `seq 1 $iterations`;
do
	response=$(curl -o /dev/null -s -w $curl_format $URL)

	#Splits response string by the delimiter of "-"
	response_times=($(echo "$response" | tr "-" "\n"))

	#Assigning each type of response time to a variable
	time_namelookup=${response_times[0]}
	time_connect=${response_times[1]}
	time_appconnect=${response_times[2]}
	time_pretransfer=${response_times[3]}
	time_redirect=${response_times[4]}
	time_starttransfer=${response_times[5]}
	time_total=${response_times[6]}

	#Adding variables assigned above in loop to the respective total variables that are set at start of script
	total_time_namelookup=$(echo "$total_time_namelookup + $time_namelookup" | bc)
	total_time_connect=$(echo "$total_time_connect + $time_connect" | bc)
	total_time_appconnect=$(echo "$total_time_appconnect + $time_appconnect" | bc)
	total_time_pretransfer=$(echo "$total_time_pretransfer + $time_pretransfer" | bc)
	total_time_redirect=$(echo "$total_time_redirect + $time_redirect" | bc)
	total_time_starttransfer=$(echo "$total_time_starttransfer + $time_starttransfer" | bc)
	total_time_total=$(echo "$total_time_total + $time_total" | bc)
done

#Calculating the average for each type of response time
average_time_namelookup=$(echo "scale=$decimal_rounding; $total_time_namelookup / $iterations" | bc)
average_time_connect=$(echo "scale=$decimal_rounding; $total_time_connect / $iterations" | bc)
average_time_appconnect=$(echo "scale=$decimal_rounding; $total_time_appconnect / $iterations" | bc)
average_time_pretransfer=$(echo "scale=$decimal_rounding; $total_time_pretransfer / $iterations" | bc)
average_time_redirect=$(echo "scale=$decimal_rounding; $total_time_redirect / $iterations" | bc)
average_time_starttransfer=$(echo "scale=$decimal_rounding; $total_time_starttransfer / $iterations" | bc)
average_time_total=$(echo "scale=$decimal_rounding; $total_time_total / $iterations" | bc)

echo "Averages of response timings:"
echo ""
echo "   time_namelookup: $average_time_namelookup"
echo "      time_connect: $average_time_connect"
echo "   time_appconnect: $average_time_appconnect"
echo "  time_pretransfer: $average_time_pretransfer"
echo "     time_redirect: $average_time_redirect"
echo "time_starttransfer: $average_time_starttransfer"
echo "                    --------"
echo "        time_total: $average_time_total"
