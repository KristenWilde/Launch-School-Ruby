# Get information from the user
# Calculate monthly interest rate
# Calculate loan duration in months
# Calculate monthly payment 
# Tell the user

def valid_number?(num)
  num.to_i().nonzero? || num.to_i == 0
end

puts "Welcome to Loan Calculator."
puts "I will ask you for some information, then tell you what your monthly payment will be."

loop do
  puts "What is your loan amount, in dollars?"
  
  loan_total = Kernel.gets().chomp().to_f
  
  puts "What is your Annual Percentage Rate (APR)? Enter the percentage points.\n(For example, for 5% interest you would enter 5)."
  
  apr = gets.chomp.to_f
  
  puts "I need to know the duration of your loan. I'll ask for years first, then months.\nHow many full years?"
  
  duration_years = gets.chomp.to_i
  
  puts "How many months, in addition to those years?"
  
  duration_additional_months = gets.chomp.to_i

  duration_months = (duration_years * 12) + duration_additional_months
  puts "#{duration_months} total payments"
  monthly_interest_rate = (apr * 0.01)/ 12.0
  puts "Your monthly interest rate will be #{monthly_interest_rate}"
  monthly_payment = loan_total * 
                    (monthly_interest_rate / 
                    (1- (1 + monthly_interest_rate)**-duration_months))
  
  puts "You will make #{duration_months} monthly payments of $#{format('%02.2f', monthly_payment)}."
  
  puts("Would you like to perform another calcuation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

puts "Thank you for using Loan Calculator."