def prompt(msg)
  puts "=> #{msg}"
end

def valid_number?(amount)
  amount.to_i.to_s == amount && amount.to_i >= 0 ||
  amount.to_f.to_s == amount && amount.to_f >= 0
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt("Please enter the loan amount in $ in a number format "\
    "(e.g. 10000 for ten thousand dollars: )")
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    prompt("Invalid input. Please provide the loan amount again.")
  end
  loan_amount
end

def get_apr
  apr = ''

  loop do
    prompt("Please enter the APR in percentage points (e.g. for 5% enter 5): ")
    apr = gets.chomp
    break if valid_number?(apr)
    prompt("Invalid input. Please provide a percentage.")
  end
  apr
end

def get_loan_duration
  loan_duration_in_years = ''

  loop do
    prompt("Enter your loan duration in years: ")
    loan_duration_in_years = gets.chomp
    break if valid_number?(loan_duration_in_years)
    prompt("Invalid input. Please enter the duration in years.")
  end
  loan_duration_in_years
end

def calculate_payment(loan_amount, apr, loan_duration_in_years)
  monthly_interest = (apr.to_f / 12) / 100
  loan_duration_in_months = loan_duration_in_years.to_f * 12
  expression = (1 + monthly_interest)**(-loan_duration_in_months)
  monthly_payment = (loan_amount.to_f) * (monthly_interest / (1 - expression))
  monthly_payment = monthly_payment.floor(2)
end

prompt("Welcome to mortgage calculator!")

# main loop
loop do
  system 'clear'
  loan_amount = get_loan_amount
  apr = get_apr
  loan_duration_in_years = get_loan_duration

  monthly_payment = calculate_payment(loan_amount, apr, loan_duration_in_years)
  total_payment = (monthly_payment * loan_duration_in_years.to_f * 12).floor(2)

  prompt("For a loan of $#{loan_amount}, APR of #{apr}% "\
  "and loan duration of #{loan_duration_in_years} years "\
  "Your monthly payment is #{monthly_payment}."\
  "Your total payment is #{total_payment}. ")
  
  prompt("Do you want to do another calculation?")
  input = gets.chomp
  break unless input.downcase[0] == 'y'
end

prompt("Goodbye!")


