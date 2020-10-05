# Header Method
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Footer Method
def print(students)
  students.each do |name|
    puts "name:" + name + "cohort: november"
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


# Print
def print_footer(students)
  student_count = students.length
  puts "Overall, we have #{student_count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
