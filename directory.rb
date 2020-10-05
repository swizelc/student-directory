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
def student_by_first_char(students)
  puts "enter character: "
  char = gets.chomp
  students.each { |student|
    if student[0] == char
      puts student
    end
  }
end

def student_by_length(students)
  puts "enter length to be less than or equal to"
  len = gets.chomp.to_i
  students.each { |student|
    if student.length <= len
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
student_by_first_char(students)
student_by_length(students)
