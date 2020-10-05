# Header Method
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
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
      puts "Input the student hobby."
      hobby = gets.chomp
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
        :hobby => hobby,
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
      line = line + key.to_s + ": " + value.to_s + ", "
    # End Loop Hash
    end
    # Puts the line
    puts line
  end
end

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


# Print
def print_footer(students)
  student_count = students.length
  puts "Overall, we have #{student_count} great students"
end

# Run our code
students = input_students
#print_header
print(students)
#print_footer(students)
