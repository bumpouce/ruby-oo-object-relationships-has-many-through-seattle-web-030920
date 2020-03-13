class Waiter
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

    def new_meal (customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end
    
    def customer 
        list_of_customers = []
        meals.select { |meal| list_of_customers << meal.customer }
        list_of_customers
    end

    def best_tipper
        best_tipper = ""
        best_tip = 0

        meals.select {|meal| (best_tip = meal.tip; best_tipper = meal.customer) if meal.tip > best_tip }
        best_tipper
    end
end