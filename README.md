# Peaks

Write a script in Ruby that is able to take an array of numbers and find all the elements
of the array where the element before and the element after the element are both less
than the element. Write tests for the code including tests for the edge cases.
You can use any frameworks or Gems you like and you can use the internet as well as
a resource.

## Install & Run
1. `git clone https://github.com/netlogics/peaks.git`
2. `cd peaks`
3. `irb`
4. `require_relative 'peaks'`
5. `peaks = Peaks.new [1,4,2,3,6,0]`
6. `peaks.peak_indicies` => [1, 4]

## Test
`ruby test_peaks.rb`
