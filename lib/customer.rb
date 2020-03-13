require 'pry'

class Customer
  attr_accessor :name, :age

  @@all = []
  
  def initialize (name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal (waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def waiters 
    list_of_waiters = []
    meals.select { |meal| list_of_waiters << meal.waiter }
    list_of_waiters
  end
end