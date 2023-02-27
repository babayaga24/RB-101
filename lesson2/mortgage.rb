def prompt(msg)
  puts "=> #{msg}"
end

prompt("Enter the loan amount in $:")
loan_amount = Kernel.gets().chomp().to_f

prompt("Enter the APR in %:")
apr = Kernel.gets().chomp().to_f

prompt("Enter the loan duration (in years):")
loan_duration_in_years = Kernel.gets().chomp().to_f

monthly_interest = (apr / 12) / 100

loan_duration_in_months = loan_duration_in_years * 12

expression = (1 + monthly_interest)**(-loan_duration_in_months)
monthly_payment = (loan_amount) * (monthly_interest / (1 - expression))
monthly_payment = monthly_payment.floor(2)

puts "Your monthly payment is #{monthly_payment}."
