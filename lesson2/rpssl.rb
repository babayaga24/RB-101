VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def transform_choice(choice)
  choice_mapping = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
  }

  if choice_mapping[choice] == nil
    return choice
  else
    return choice_mapping[choice]
  end
end

def won?(first, second)
  winning_hash = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['lizard', 'paper'],
  'spock' => ['scissors', 'rock'],
  'lizard' => ['spock', 'paper']
}
  options = winning_hash.fetch(first)
  options.include?(second)
end

def display_result(player, computer)
  if won?(player, computer)
    prompt("You win!")
  elsif won?(computer, player)
    prompt("You lose :(")
  else
    prompt("It's a tie!")
  end
end

def update_score(player, computer)
  if won?(player, computer)
    user_score = user_score + 1
  elsif won?(computer, player)
    computer_score = computer_score + 1
  else
  end
  return user_score, computer_score
end

prompt("Welcome to Rock Paper Scissors Lizard Spock")
sleep 1

sleep 1

loop do
  user_score = 0
  computer_score = 0
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Enter 'r' for rock, 'p' for paper, 's' for scissors, 'l' for lizard and 'sp' for spock if you wish")
    choice = Kernel.gets().chomp()
    choice = transform_choice(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  display_result(choice, computer_choice)
  update_score(choice, computer_choice)

  prompt("User score = #{user_score}. Computer score = #{computer_score}")

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless (answer.downcase().start_with?('y') && !(user_score == 3 || computer_score == 3))
end

prompt("Thank you for playing. Goodbye!")
