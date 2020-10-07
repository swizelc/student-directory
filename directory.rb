require 'csv'
# Header Method
def print_header
  puts "The students of Villains Academy".center(50, "~")
end

def ask(text)
  puts "#{text}".center(50)
  return STDIN.gets.chomp
end
# Input Students Method
def input_students()
  # Make Array
  # Start Loop
  while true
    # Ask for input
    puts "Input the student name.".center(50)
    puts "To finish, hit return twice".center(50)
    # Get input
    name = STDIN.gets.chomp
    # If they enter a name, save the name
    if name != ""
      # Cohort
      cohort = ask("Input the student cohort.")
      hobby = ask("Input the student hobby. (To enter multiple: separate with dashes)")
      # Country
      country = ask("Input the student country.")
      # Height
      height = ask("Input the student height.")
      # Make Hash
      hash = {
        :name => name,
        :cohort => cohort,
        :hobbies => hobby,
        :country => country,
        :height => height
      }
      # Push
      @students.push(hash)
    else
      break
    end
  # End Loop
  end

  # Return Array
  return @students
end

def edit_print
  puts "Enter number for options"
  puts "1. Name"
  puts "2. Cohort"
  puts "3. Hobbies"
  puts "4. Country"
  puts "5. Height"
end

def edit_menu
  edit_print
  option = STDIN.gets.chomp().to_i

  while true do
    if option <= 5 && option > 0
      return option
      break
    else
      puts "Enter valid option".center(50, "!  ")
      option = STDIN.gets.chomp().to_i
    end
  end
end


def changes()
  name = ask("Input name of the student")
  @students.each do |hash|
    if hash[:name] == name
      puts "Edit Mode".center(50, "-")
      option = edit_menu()
      case option
      when 1
        puts "Change name to: "
        hash[:name] = STDIN.gets.chomp
      when 2
        puts "Change cohort to: "
        hash[:cohort] = STDIN.gets.chomp
      when 3
        puts "Change hobbies to: "
        hash[:hobbies] = STDIN.gets.chomp
      when 4
        puts "Change country to: "
        hash[:country] = STDIN.gets.chomp
      when 5
        puts "Change height to: "
        hash[:height] = STDIN.gets.chomp
      end
    end
  end
  print_names()
end


# Student Normal
def print_names()
  # Loop Over Array
  @students.each do |hash|
    if hash[:name] != 'name'
      puts "Name: " + hash[:name] + " // Cohort: " + hash[:cohort] + " // Hobbies: " + hash[:hobbies] +
      " // Country: " + hash[:country] + " // Height: " + hash[:height]
    end
  end
  ans = ask("Would you like to make changes? y/n")
  if ans == "y"
    changes()
  end
end

def print_footer()
  student_count = @students.length - 1
  if student_count > 1
    puts "Overall, we have #{student_count} great students".center(50, "~")
  elsif student_count == 1
    puts "Overall, we have #{student_count} great student".center(50, "~")
  else
    puts "Overall, we have no students".center(50, "~")
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      puts("Goodbye!")
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def show_students
  print_header
  print_names()
  print_footer()
end

def print_menu
  puts "Select an option".center(50, "-")
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def load_students
  if !(ARGV.empty?)
    table = CSV.parse(File.read(ARGV.first), write_headers: true, :headers => ["name",  "cohort",  "hobbies",  "country",  "height"])
  else
    table = CSV.parse(File.read("students.csv"), write_headers: true, :headers => ["name",  "cohort",  "hobbies",  "country",  "height"])
  end

  (0... table.length).each do |num|
    @students << {name: table[num]['name'], cohort: table[num]['cohort'],
       hobbies: table[num]['hobbies'], country: table[num]['country'], height:
       table[num]['height']}
  end
end

def save_students
  if !(ARGV.empty?)
    file = File.open(ARGV.first, "w")
  else
    file = File.open("students.csv", "w")
  end
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts("Saved!")
end

def interactive_menu()
  if (File.file? ("students.csv")) || (File.file? (ARGV.first.to_s))
    @students = []
    load_students
  else
    @students = [{name: "name", cohort: "cohort", hobbies: "hobbies", country: "country", height: "height" }]
  end
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
#commit
interactive_menu()
