
class Hello
  attr_accessor :test, :another_test 
  def sayHello
    puts "Hello World!" + test
  end
end

h = Hello.new
h.test = "nihaw"
h.sayHello