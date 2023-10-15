defmodule Tutorials do
	# Cách viết 1
	# def upto(0) do
	#   :ok
	# end

	# Cách viết 2
	# def upto(0), do: :ok

	# def upto(nums) do
	#     # Logic 1 sẽ in ra 3,2,1
	#     # IO.puts(nums) # Giả sử ta truyền vào 3 thì nó sẽ in ra lần lượt là 3,2,1
	#     # upto(nums - 1)

	#     # Logic 2 sẽ in ra 1,2,3
	#     upto(nums - 1) # Giả sử ta truyền vào 3 thì nó sẽ in ra lần lượt là 1,2,3
	#     IO.puts(nums)
	# end

	# Check if all elements in the list are even numbers
	def check_even_numbers(list) do
			Enum.all?(list, fn x -> rem(x,2) == 0 end) |> IO.puts()
	end

	# Check if any element in the list is odd number
	def check_odd_number(list) do
			Enum.any?(list, fn x -> rem(x,2) != 0 end) |> IO.puts()
	end

	# How many elements are even numbers, How many elements are odd numbers
	def count_even_odd_number(list) do
			even_numbers = Enum.count(list, fn x -> rem(x,2) == 0 end)
			odd_numbers = Enum.count(list, fn x -> rem(x,2) != 0 end)
			"Even Numbers: #{even_numbers}. Odd Numbers:  #{odd_numbers}" |> IO.puts()
	end

	def calculate_between_dates(startDate, endDate) do
		startDate = Date.from_iso8601(startDate)
		endDate = Date.from_iso8601(endDate)
		{_, startDateF} = startDate
		{_, endDateF} = endDate
		diffDays = Date.diff(endDateF, startDateF)
		diffDays
	end

	def handle_array() do
		peoples = [
			%{name: "NTK",  age: 10, gender: true,  address: %{city: "CityA", ward: "WardA"}, group: "A", startDate: "2023-01-10", endDate: "2023-02-01"},
			%{name: "MTTT", age: 20, gender: false, address: %{city: "CityA", ward: "WardA"}, group: "A", startDate: "2023-02-10", endDate: "2023-03-01"},
			%{name: "NNPM", age: 20, gender: false, address: %{city: "CityA", ward: "WardA"}, group: "A", startDate: "2023-03-10", endDate: "2023-04-01"},
			%{name: "NHQ",  age: 30, gender: true,  address: %{city: "CityB", ward: "WardB"}, group: "B", startDate: "2023-04-10", endDate: "2023-05-01"},
			%{name: "VHN",  age: 40, gender: false, address: %{city: "CityB", ward: "WardB"}, group: "B", startDate: "2023-05-10", endDate: "2023-06-01"},
			%{name: "",  		age: 0, gender: false,  address: %{city: "CityC", ward: "WardC"}},
			%{name: "",  		age: 0, gender: false,  address: %{city: "CityD", ward: "WardD"}},
		]

		# Delete all users with blank field names
		standardPeoples = Enum.reject(peoples, fn user -> String.trim(user.name) == "" end)

		# Convert the value of field name from upper to lower
		# Change  the true value of gender to 1 and the false value of gender to 0
		new_peoples = Enum.map(standardPeoples, fn user ->
			%{user |
				gender: (if user.gender, do: 1, else: 0),
				name: String.downcase(user.name),
			}
		end)

		new_peoples = Enum.map(new_peoples, fn user ->
			between_date = calculate_between_dates(user.startDate, user.endDate)
			Map.put(user, :betweenDate, between_date)
		end)

		# Get a list of all users with male gender
		# Get a list of all users with female gender
		maleUsers = Enum.filter(new_peoples, fn user -> user.gender == 1 end)
		countMaleUsers = length(maleUsers)
		femaleUsers = Enum.filter(new_peoples, fn user -> user.gender == 0 end)
		countFemaleUsers = length(femaleUsers)

		{youngestUser, oldestUser} = Enum.min_max_by(new_peoples, &(&1.age));

		sortDescUsers = Enum.sort(new_peoples, fn %{age: age1}, %{age: age2} -> age2 <= age1 end)
		sortAscUsers = Enum.sort(new_peoples, fn %{age: age1}, %{age: age2} -> age1 <= age2 end)

		groupedUsers = Enum.group_by(new_peoples, &(&1.group))

		# startDateCP = Date.from_iso8601("2023-01-10") |> Date.to_utc()
		# endDateCP = Date.from_iso8601("2023-03-10") |> Date.to_utc()
		# dateRangeUsers = Enum.filter(new_peoples, fn person ->
		# 	Date.compare(Date.from_iso8601(person.startDate) |> Date.to_utc(), startDateCP) >= 0 && Date.compare(Date.from_iso8601(person.endDate) |> Date.to_utc(), endDateCP) <= 0
		# end)

		filteredDataUsers = Enum.map(new_peoples, fn %{name: name, age: age, gender: gender} ->
			%{name: name, age: age, gender: gender}
		end)

		result = %{
			youngestUser: youngestUser,
			oldestUser: oldestUser,
			maleUsers: %{count: countMaleUsers, data: maleUsers},
			femaleUsers: %{count: countFemaleUsers, data: femaleUsers},
			filteredDataUsers: filteredDataUsers,
			sortDescUsers: sortDescUsers,
			sortAscUsers: sortAscUsers,
			groupedUsers: groupedUsers,
		}
		result |> IO.inspect()
	end

	def get_unique_elements_with_counts(list) do
    Enum.uniq(list)
    |> Enum.map(fn x -> {x, Enum.count(list, fn y -> x == y end)} end)
  end

	def get_max_element(list) do
		list
		|> Enum.max_by(fn {_, value} -> value end)
		|> IO.inspect()
	end

	def comprehensions do
		# comprehensions: Always returns a new list
		# VD: 1
		# list = [1,2,3,4,5,6,7,8,9,10]
		# newList = for x <- list do
		# 	x * x
		# end
		# Output: [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

		# VD: 2
		# list = [one: "Kien", two: "Thuy", three: "Quan", four: "Nhien"]
		# newListKey = for {_key, _value} <- list do
		# 	_key
		# end
		# Output: [:one, :two, :three, :four]
		# newListValue = for {_key, _value} <- list do
		# 	_value
		# end
		# Output: ["Kien", "Thuy", "Quan", "Nhien"]

		# VD: 3
		# tuplesDemo = %{"K" => "Kien", "T" => "Thuy", "Q" => "Quan", "N" => "Nhien"}
		# newList = for {_key, _value} <- tuplesDemo do
		# 	{_key, _value}
		# end
		# Output: [{"K", "Kien"}, {"N", "Nhien"}, {"Q", "Quan"}, {"T", "Thuy"}]

		# VD: 4 Special
		# list = [ok: "Kien", ok: "Thuy", error: "Quan", error: "Nhien"]
		# Only return the list with the key ok
		# listOk = for {:ok, _value} <- list do
		# 	_value
		# end
		# Only return the list with the key error
		# listError = for {:error, _value} <- list do
		# 	_value
		# end

		# VD: 5 Special
		# String.duplicate(string, number): Hàm này nhận hai đối số, đầu tiên là chuỗi ký tự và thứ hai là số nguyên từ biến number.
		# Hàm này sẽ tạo một chuỗi bằng cách nhân chuỗi với số number. Ví dụ, nếu chuỗi là "*" và number là 3, thì kết quả sẽ là "***".
		# list = [1,2,3,4]
		# newList = for n <- list, times <- 1..n do
		# 		String.duplicate("*", times) <> "\n"
		# end
		# Nếu biên dich sang Js nó sẽ như sau:
		# for(let i = 1; i <= 4; i++) {
		# 	Sau đó nó sẽ thực hiện tiếp lần lượt từng vòng lặp con với logic như sau:
		# 	n = 1 => time <- [1,1]
		# 	n = 2 => time <- [1,2]
		# 	n = 3 => time <- [1,3]
		# 	n = 4 => time <- [1,4]
		# }
		# Output: ["*", "*", "**", "*", "**", "***", "*", "**", "***", "****"]

		# VD: 6
		# newList = for x <- 1..10, rem(x,2) == 0  do
		# 	x
		# end
		# Output: [2, 4, 6, 8, 10]

		# VD: 7
		# newList = for x <- 1..30, rem(x,2) == 0, rem(x,3) == 0  do
		# 	x
		# end
		# Output: [6, 12, 18, 24, 30]
	end

	# def test(list) when is_list(list) and length(list) > 0 do
	# 	grouped = Enum.group_by(list, fn x -> x end)
	# 	groupSizes = Enum.map(grouped, fn {name, group} -> {name, length(group)} end)

	# 	{maxKey, maxValue} = hd(groupSizes)
	# 	{maxKeyData, maxValueData} = {maxKey, maxValue}
	# 	firstGroup = hd(list)

	# 	resultData = Enum.map(tl(groupSizes), fn {key, value} ->
	# 		if value > maxValueData do
	# 			 {key, value}
 	# 		else
	# 				result = Enum.find(groupSizes, fn {key, value} -> key == firstGroup  end)
	# 				result
	# 		end
	# 	end)

	# 	endData = Enum.at(resultData, -1)
	# 	|> IO.inspect()
	# end

	# def test(_other) when not is_list(_other) or length(_other) == 0 do
  #   {:error, %{message: "list is required", status: false, error_code: 404}}
	# 	|> IO.inspect()
  # end

	def test([_ | _] = list) do
		case list do
			[] ->
				{:error, %{message: "list is empty", status: false, error_code: 404}}
				|> IO.inspect()
			[head | tail] ->
				grouped = Enum.group_by(list, fn x -> x end)
				groupSizes = Enum.map(grouped, fn {name, group} -> {name, length(group)} end)

				{maxKey, maxValue} = hd(groupSizes)
				{maxKeyData, maxValueData} = {maxKey, maxValue}
				firstGroup = hd(list)

				resultData = Enum.map(tl(groupSizes), fn {key, value} ->
					if value > maxValueData do
						{key, value}
					else
							result = Enum.find(groupSizes, fn {key, value} -> key == firstGroup  end)
							result
					end
				end)

				endData = Enum.at(resultData, -1)
				|> IO.inspect()
			_ ->
				{:error, %{message: "list is required", status: false, error_code: 404}}
				|> IO.inspect()
		end
	end

	def test(_others) do
		raise "list is required"
	end

	def test_lib_faker() do
		newListName = for x <- 1..10 do
			Faker.Person.name()
			|> IO.puts()
		end
	end
end

# Tutorials.handle_array()

# Tutorials.comprehensions()

# Tutorials.test([1,1,1,1,1,2,2,2])
# Tutorials.test([1,1,1,1,1,2,2,2,2,2])
# Tutorials.test([2,1,1,1,1,2,2,2,2,2,1,1])
# Tutorials.test([2,2,2,2,1,1,1,3,3,3,3,3])
# Tutorials.test([1,2,2,2,2,1,1,1,3,3,3,3,3,1])
# Tutorials.test([3,3,3,3,1,1,1,1,1,2,2,2,2,2,4,4,4,4,4,3])
# Tutorials.test([])
# Tutorials.test({1,2})

Tutorials.test_lib_faker()
