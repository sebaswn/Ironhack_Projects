require "pry"
class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end

    def calculate_salary
        #What will this return? 
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
      super(name, email) #Navigator, look into what super does. 
    @hourly_rate = hourly_rate
    @hours_worked = hours_worked
  end

  def calculate_salary
  	total_hours_rate = @hourly_rate * @hours_worked
    puts total_hours_rate
    deduction = (total_hours_rate/100)*18
	puts deduction
	total_salary = total_hours_rate - deduction
	puts total_salary
  end
end

class SalariedEmployee < Employee
	def initialize(name, email, salary)
		super(name, email)
		@salary = salary
	end

	def deductions
		deduction = (@salary/100)*18
		puts deduction
		total_salary = @salary - deduction
		puts total_salary
	end
end

class MultiPaymentEmployee < Employee
	def initialize(name, email, salary, overtime_rate, hours_worked)
		super(name, email)
		@salary = salary
		@overtime_rate = overtime_rate
		@hours_worked = hours_worked
		
	end

	def calculated_salary
		
		if(@hours_worked > 40)

			hours_overtime =  @hours_worked - 40
			#binding.pry
			overtime_total = hours_overtime * 275
			total_before_taxes = @salary + overtime_total

			deduction = (total_before_taxes/100)*18
			puts deduction
			total_salary = total_before_taxes - deduction
			puts total_before_taxes
		else
			deduction = (@salary/100)*18
			puts deduction
			total_salary = @salary - deduction
			puts total_salary
		end
	end
end


class Payroll
    def initialize(employees)
      @employees = employees
  end

  def notify_employee(employee)
          employee.each do |name|
			
			if (name.class == HourlyEmployee)
				puts "You have been paid " + name.calculate_salary
			# elsif (name.class == SalariedEmployee)

			# elsif (name.class == MultiPaymentEmployee)
			
			end

          end
  end

  def pay_employees
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
  end
end



josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
sebas = HourlyEmployee.new('Sebas', 'sebastiannee@yahoo.com', 15, 50)
eliza = HourlyEmployee.new('Eliza', 'eliza@gmail.com', 15, 60)

nizar.deductions
sebas.calculate_salary
ted.calculated_salary

employees_array = [josh, nizar, ted, sebas, eliza]

payroll = Payroll.new(employees_array)

payroll.notify_employee(employees_array)






