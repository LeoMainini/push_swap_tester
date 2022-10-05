# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test_all.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leferrei <leferrei@student.42lisboa.com>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/05 15:08:20 by leferrei          #+#    #+#              #
#    Updated: 2022/10/05 15:27:11 by leferrei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PUSH_SWAP_PATH=".."
LOG_OUT=0
LEN_3=100
LEN_5=100
LEN_100=500
LEN_500=50

test_ps() {
printf "Testing $1 numbers	->  "
total=0
max=0
rm -rf test_$1.log
echo -n "["
for i in $(seq 1 $2)
do
	ARG=$(shuf -i 0-1000 -n $1 | tr '\n' ' ')
	moves=$($PUSH_SWAP_PATH/push_swap $ARG)
	calcs=$(echo "$moves" | wc -l)
	total=$((total + calcs))
	if [ $LOG_OUT != 0 ]
	then
		printf "./push_swap $ARG\n$moves\nTotal moves for this input = $calcs\n\n" >> test_$1.log
	fi
	if [ $calcs -gt $max ]
	then
		max=$calcs
	fi
	if [ $(($i % ($2 / 10))) -eq "0" ]
	then
		printf "~"
	fi
	if [ $i -eq $2 ]
	then
		printf "] ✓\n"
	fi
done
mean=$((total / $2))
printf "	-> Avg instructions for $2 iterations of $1 random numbers\t= $mean\n"
printf "	-> Max instructions for $2 iterations of $1 random numbers\t= $max\n\n"
}

if find $PUSH_SWAP_PATH -type f -perm 755 -name "push_swap" -print -quit | grep -q "^"
then
	printf "Found push_swap\n\n"
else
	printf "Failed to find push_swap folder\n"
	exit
fi

printf "Compiling push_swap\n\n"

make -C $PUSH_SWAP_PATH re -s;

test_ps 3 $LEN_3
test_ps 5 $LEN_5
test_ps 100 $LEN_100
test_ps 500 $LEN_500
