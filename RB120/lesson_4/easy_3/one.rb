# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
# What happens in each of the following cases:

# case 1:
hello = Hello.new
hello.hi
# The local variable `hello` is initialized to the instatiation of the `Hello` object. 
# `hi` is invoked on `hello` which looks inside the `hello` interface to find a matching instance method, which is found
# in the `Hello` class. The `hi` instance method defined on lines 10-12 looks for another instance method named `greet` and 
# passes in the string obejct `"Hello"` as an argument. `greet` is found inside the super class Greeting and defined on
# lines 4-6. Greet outputs the object that the local variable message is pointing to which is `"Hello"`.
# case 2:
hello = Hello.new
hello.bye
=begin
The local variable `hello` is initialized to th instationation of the `Hello` object. 
`bye` is invoked on `hello` which looks inside the `hello` interface to find a matching instance method. The interface does not
contain a matching instance method so throws an error message. The look up path for the instance would be `Hello, Greeting, Object
Kernal, BasicObject`
=end
# case 3:
hello = Hello.new
hello.greet
=begin
The local variable `hello` is initialized to the instatiation of the `Hello` object.
The .greet method is invoked on `hello` which looks through `hello`'s interface for a matching method. 
Since to be matching the methods have to share the same name and number of arguments the `greet` method does not exsit
in the interface. On line 41 greet take no arguments but the `greet` instance method defined on line 4 does take an argument.
The above code will throw an error.
=end
# case 4:
hello = Hello.new
hello.greet("Goodbye")
=begin
The local variable `hello` is initialized to the instatiation of the `Hello` object.
The `greet` method is invoked on the `hello` instance which checks the instances interface for a matching instance method.
The search starts in the Hello class and moves to the super class when a matching method is not found. In the super class
`Greeting` the `greet` instance method is called. The local variable `message` which points to the string object passed in
`"Goodbye"` is output to the screen by the `puts` method call.
=end
# case 5:
Hello.hi
=begin
`hi` is invoked on the `Hello` class object. The code would throw an error message because a class method `hi` is not 
defined inside of `Hello` or a super class.
=end