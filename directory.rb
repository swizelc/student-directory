# Header Method
def print_header
  puts "The students of Villains Academy".center(50, "~")
end

# Input Students Method
def input_students
  # Make Array
  students = []
  # Start Loop
  while true
    # Ask for input
    puts "Input the student name."
    puts "To finish, hit return twice"
    # Get input
    name = gets.chomp
    # If they enter a name, save the name
    if name != ""
      # Cohort
      puts "Input the student cohort."
      cohort = gets.chomp
      # Hobby
      puts "Input number of hobbies"
      hobbies_num = gets.chomp.to_i
      hobbies = []
      hobbies_num.times {
        puts "Input the student hobby."
        hobby = gets.chomp
        hobbies.push(hobby)
      }
      # Country
      puts "Input the student country."
      country = gets.chomp
      # Height
      puts "Input the student height."
      height = gets.chomp
      # Make Hash
      hash = {
        :name => name,
        :cohort => cohort,
        :hobbies => hobbies,
        :country => country,
        :height => height
      }
      # Push
      students.push(hash)
    else
      break
    end
  # End Loop
  end

  # Return Array
  return students
end

def edit_menu
  puts "Enter number for options"
  puts "1. Name"
  puts "2. Cohort"
  puts "3. Hobbies"
  puts "4. Country"
  puts "5. Height"
  option = gets.chomp().to_i

  while true do
    if option <= 5 && option > 0
      return option
      break
    else
      puts "Enter valid option"
      option = gets.chomp().to_i
    end
  end
end


def changes(students)
  puts "Input name of the student"
  name = gets.chomp
  students.each do |hash|
    if hash[:name] == name
      puts "Edit Mode".center(50, "-")
      option = edit_menu()
      case option
      when 1
        puts "Change name to: "
        hash[:name] = gets.chomp
      when 2
        puts "Change cohort to: "
        hash[:cohort] = gets.chomp
      when 3
        puts "Change hobbies to: "
        hash[:hobbies] = gets.chomp
      when 4
        puts "Change country to: "
        hash[:country] = gets.chomp
      when 5
        puts "Change height to: "
        hash[:height] = gets.chomp
      end
    end
  end
  print(students)
end


def print_cohort(students)
  cohorts = []
  students.each do |student|
    cohort = student[:cohort]
    if ! (cohorts.include? cohort)
      cohorts.push(cohort)
    end
  end
  cohorts.each do |cohort|
    puts "Cohort: #{cohort}".center(50, "-")
    students.each do |student|
      if student[:cohort] == cohort
        puts student[:name]
      end
    end
  end
end

# Student Normal
def print(students)
  # Loop Over Array
  students.each do |hash|
    # Get the number
    num = students.find_index(hash) + 1
    # Start String
    line = num.to_s + ". "
    # Loop Over Hash
    hash.each do |key, value|
      # Add to line
      if value.is_a? String
        line = line + key.to_s + ": " + value.to_s + ", "
      else
        line = line + key.to_s + ": " + value.join(", ") + ", "
      end
    # End Loop Hash
    end
    # Puts the line
    puts line
    end
  puts "Would you like to make changes? y/n"
  ans = gets.chomp
  if ans == "y"
    changes(students)
  end
end


=begin
# Student While
def print_while(students)
  # Counter
  max_counter = students.length
  while max_counter > 0
    # Lower Counter
    max_counter -= 1
    # Get the number
    num = students.length - max_counter
    # Puts the line
    puts num.to_s + ". name: " + students.reverse[max_counter] + " cohort: november"
  end
end

# Student First Character Filter
def print_char_filter(students)
  # Get char to search for
  puts "Input character to search for."
  char = gets.chomp
  # Start Loop
  students.each do |name|
    # Char?
    if name[0] = char
      # Get the number
      num = students.find_index(name) + 1
      # Puts the line
      puts num.to_s + ". name: " + name + " cohort: november"
    end
  # End Loop
  end
end

# Student Length Filter
def print_length_filter(students)
  # Get char to search for
  puts "Input length to be less than or equal to."
  len = gets.chomp.to_i

  # Start Loop
  students.each do |name|
    # Char?
    if name.length <= len
      # Get the number
      num = students.find_index(name) + 1
      # Puts the line
      puts num.to_s + ". name: " + name + " cohort: november"
    end
  # End Loop
  end
end
=end

# Print
def print_footer(students)
  student_count = students.length
  puts "Overall, we have #{student_count} great students".center(50, "-")
end

# Run our code
print_header
students = input_students
print_cohort(students)
#print(students)
print_footer(students)
