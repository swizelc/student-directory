# Header Method
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Footer Method
def print(students)
  students.each do |name|
    puts (students.find_index(name) + 1).to_s + ". name: " + name + " cohort: november"
  end
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
    if name != ""
      students.push(name)
    else
      break
    end
  # End Loop
  end
  # Return Array
  return students
end

# Student by first character
def studend_by_first_char(students)
  puts "enter character: "
  char = gets.chomp
  students.each { |student|
    if student[0] == char
      puts student
    end
  }
end
# Print
def print_footer(students)
  student_count = students.length
  puts "Overall, we have #{student_count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
studend_by_first_char(students)
