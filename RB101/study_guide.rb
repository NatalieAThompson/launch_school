#Written Assesment Study Guide Start##
=begin
Concepts -- Create own definitions and examples
  truthiness
    - All objects in ruby can be evaluated to true or false. Truthiness is based on this evaluation. The only objects that evaluate to 
      false a false and nil
  false vs nil
    - false is a boolean object 
    - nil is a nil object
    - Both evaluate to false when looking a truthiness but are different object types
  variables as pointers
    - variables are names for places in memory that hold objects
  local variable scope
    - the main body and methods all have unique scopes that hold variables that can't be seen by the other scopes
    * interaction with method invocations with block
      -local variables can be accessed by method invocations with a block
      -but any local variables created in the block cannot be accessed outside of the block
    * interaction with method definitions
      -local variables cannot be seen by method definitions unless passed in as an argument
  pass by reference vs pass by value
    - pass by reference passes the object location in memory and can mutate
    - pass by value passes a copy of the object to the method so there are no side effects
  mutating methods
    - mutation in methods is when the method changes the data at the memory location of an object.
  collections (hash, array, string)
    -popular collection methods (each, map, select,etc)
        .each 
          The each method iterates over a collection object and executes the code within the block for every iteration, 
          but ignores the block and returns the object it was invoked on. 
        .map
          The map method iterates over a collection object and builds a new array, with the same length of the passed in array,
          by using the return value of the block as the values for each index.
        .map!
          The map! method transforms a collection object based on the return value of the block argument.
        .select
          The select method iterates over a collection object and builds a new collection object. The new object will have equal or less 
          elements than the object select was invoked on based on if the return value of the block argument evaluates to true or false.
  variable shadowing
    -this is when a block parameter has the same name as a local variable outside of the block
    -the block parameter takes precedance so no changes happen to the local variable.
  do/end block
    -blocks passed in as arguments to methods
  syntactic sugar

Vocabulary
  initalized
    a
  assigned
    = 'hi'
    a = 'hi' local variable a is initalized and assigned to the string object 'hi'
  invoke
    -when a method is called on 
    a.each_char The each_char method is invoked on variable a
  argument
    Method arguments && block arguments
    -Arguments are passed into a method
      def cats(str) -> str is a parameter
      cats("I am a cat") -> "I am a cat" is the argument. 
  parameter
    - variables given names in a method that are assigned by an argument
  outputs
    - what is written to the command line
  return value
    - values returned by method calls or conditionals
  evaluates
  local variable
    - a variable within the local scope
  constant
    - a variable always defined in the main scope with an Uppercase first letter
  element reference
    - when we are just looking at the element???
  reassignment

indexed assignment , indexed reassignment or element update

What does this output? What does this return? Why?

A format guide for the test
  We’ve initialized the variable var_name and assigned to it the Integer/String/etc object value to it.
=end