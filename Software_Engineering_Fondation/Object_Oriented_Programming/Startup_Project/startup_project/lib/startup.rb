require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries #Hash title` => `salary` pairs
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(acquired_startup)
        self.funding > acquired_startup.funding
    end

    def hire(employee_name, title)
        raise StandardError.new "there is an error." if !@salaries.has_key?(title)
            
        @employees << Employee.new(employee_name, title)
    end

    def size
        self.employees.length
    end

    def pay_employee(employee)
        employee_salary = @salaries[employee.title]

        if @funding > employee_salary
            employee.pay(employee_salary)
            @funding -= employee_salary
        else
            raise StandardError.new "Not enough Funding, can not pay #{employee.name} !!!"
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee)}
    end

    def average_salary
        total_employee = @employees.length
        sum = 0

        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum / total_employee
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(acquired_startup)
        @funding += acquired_startup.funding
        
        # Salaries of acquired_startup added in startup 
        acquired_startup.salaries.each do |title, salary|
            @salaries[title] = salary if !(@salaries.include?(title))
        end

        # Adding employees
        # acquired_startup.employees.each {|employee| @employees << employee}
        @employees += acquired_startup.employees

        # Closing acquired_startup
        acquired_startup.close
    end
end
