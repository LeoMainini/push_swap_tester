# PUSH_SWAP TESTER

This is a simple benchmark script for Push_Swap

Push_Swap is a project where you  will need to sort data on a stack, with a limited set of instructions, using
the lowest possible number of actions. 

To succeed you’ll have to manipulate various
types of algorithms and choose the most appropriate solution (out of many) for an
optimized data sorting.

## Functionality

Run the helper script for information of the script.

There is no setup required, just clone the git in the root of your push_swap folder, or wherever your push_swap binary is, and run the script

For debugging purposes or if you feel the numbers arent what they should be, run help.sh to get more detailed information





## Example

```txt
./test_all.sh
 
Found push_swap

Compiling push_swap

Files cleaned

Compilation complete

Testing 3 numbers       ->  [~~~~~~~~~~] ✓
        -> Avg instructions for 100 iterations of 3 random numbers      = 1
	-> Max instructions for 100 iterations of 3 random numbers      = 2

Testing 5 numbers       ->  [~~~~~~~~~~] ✓
        -> Avg instructions for 100 iterations of 5 random numbers      = 7
	-> Max instructions for 100 iterations of 5 random numbers      = 12

Testing 100 numbers     ->  [~~~~~~~~~~] ✓
        -> Avg instructions for 500 iterations of 100 random numbers    = 604
	-> Max instructions for 500 iterations of 100 random numbers    = 675

Testing 500 numbers     ->  [~~~~~~~~~~] ✓
        -> Avg instructions for 50 iterations of 500 random numbers     = 5487
	-> Max instructions for 50 iterations of 500 random numbers     = 5870


```


