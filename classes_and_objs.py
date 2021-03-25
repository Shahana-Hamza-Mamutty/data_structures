# class MyClass:
#   x = 5

# aa = MyClass()
# print(aa.x)


# class Person:
#   def __init__(self, name, age):
#     self.name = name
#     self.age = age

#   def test_fun(self):
#     print('yaaaaaa')

# p1 = Person("John", 36)


# print(p1.name)
# p1.test_fun()

# class Person:
#   def __init__(self, fname, lname):
#     self.firstname = fname
#     self.lastname = lname

#   def printname(self):
#     print(self.firstname, self.lastname)

# class Student(Person):
#   def __init__(self, fname, lname):
#     super().__init__(fname, lname)

# #Use the Person class to create an object, and then execute the printname method:

# x = Student("John", "Doe")
# x.printname()


# class Person:
#   "This is a person class"
#   age = 10

#   def greet(self):
#       print('Hello')

# # create a new object of Person class
# harry = Person()

# # Output: <function Person.greet>
# print(Person.greet)

# # Output: <bound method Person.greet of <__main__.Person object>>
# print(harry.greet)

# # Calling object's greet() method
# # Output: Hello
# harry.greet()



class Polygon:
  def __init__(self, no_of_sides):
    self.n = no_of_sides
    self.sides = [0 for i in range(no_of_sides)]

  def inputSides(self):
    self.sides = [float(input("Enter side "+str(i+1)+" : ")) for i in range(self.n)]

  def dispSides(self):
    for val in range(len(self.sides)):
      print("Side",val+1,"is",self.sides[val])


class Triangle(Polygon):
    def __init__(self):
        Polygon.__init__(self,3)

    def findArea(self):
        a, b, c = self.sides
        # calculate the semi-perimeter
        s = (a + b + c) / 2
        area = (s*(s-a)*(s-b)*(s-c)) ** 0.5
        print('The area of the triangle is %0.2f' %area)

  # def inputSides(self):
  #     self.sides = [float(input("Enter side "+str(i+1)+" : ")) for i in range(self.n)]

  # def dispSides(self):
  #     for i in range(self.n):
  #         print("Side",i+1,"is",self.sides[i])



aa = Polygon(3)
print(aa.inputSides())
print(aa.dispSides())