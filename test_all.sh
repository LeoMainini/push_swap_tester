# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test_all.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: leferrei <leferrei@student.42lisboa.c      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/04 15:23:47 by leferrei          #+#    #+#              #
#    Updated: 2022/10/05 13:41:34 by leferrei         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PUSH_SWAP_PATH=".."
LEN_3=100
LEN_5=100
LEN_100=500
LEN_500=50

test_ps() {
echo -n "Testing $1 numbers	->  "
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
	echo "./push_swap $ARG\n$moves\nTotal moves for this input = $calcs\n" >> test_$1.log
	if [ $calcs -gt $max ]
	then
		max=$calcs
	fi
	if [ $(($i % ($2 / 10))) -eq "0" ]
	then
		echo -n "~"

	fi
	if [ $i -eq $2 ]
	then
		echo "] ✓"
	fi
done
mean=$((total / $2))
echo "	-> Avg instructions for $2 iterations of $1 random numbers\t= $mean"
echo "	-> Max instructions for $2 iterations of $1 random numbers\t= $max\n"
}

if find $PUSH_SWAP_PATH -type f -perm 755 -name "push_swap" -print -quit | grep -q "^"
then
	echo "Found push_swap\n"
else
	echo "Failed to find push_swap folder"
	exit
fi

echo "Compiling push_swap\n"

make -C $PUSH_SWAP_PATH re -s;

test_ps 3 $LEN_3
test_ps 5 $LEN_5
test_ps 100 $LEN_100
test_ps 500 $LEN_500
