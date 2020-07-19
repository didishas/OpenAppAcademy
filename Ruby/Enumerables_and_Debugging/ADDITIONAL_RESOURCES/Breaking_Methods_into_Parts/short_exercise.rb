# def return_number(a)
#   ((a / 2)**2) * (65 - (a / 2))
# end
def estimated_child_age(age)
	age / 2
end
def current_child_bank_account(age)
	estimated_child_age(age)**2
end

def years_before_retirement(age)
	65 - estimated_child_age(age)
end

def money_earn_retirement(age)
	current_child_bank_account(age) * years_before_retirement(age)
end
