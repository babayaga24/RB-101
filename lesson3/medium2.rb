# Question 1
# a = "forty two"
# b = "forty two"
# c = a

# puts a.object_id
# puts b.object_id
# puts c.object_id

# Question 2
# a = 42
# b = 42
# c = a

# puts a.object_id
# puts b.object_id
# puts c.object_id

# Question 3
# def tricky_method(string_param_one, string_param_two)
#   string_param_one += "rutabaga"
#   string_param_two << "rutabaga"
# end

# string_arg_one = "pumpkins"
# string_arg_two = "pumpkins"
# tricky_method(string_arg_one, string_arg_two)

# puts "String_arg_one looks like this now: #{string_arg_one}"
# puts "String_arg_two looks like this now: #{string_arg_two}"

# Question 4
# def tricky_method_two(a_string_param, an_array_param)
#   a_string_param << 'rutabaga'
#   an_array_param = ['pumpkins', 'rutabaga']
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method_two(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# Question 5
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6
