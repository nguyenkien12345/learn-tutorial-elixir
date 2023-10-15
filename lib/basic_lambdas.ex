defmodule BasicLambdas do

  def convert_double_numbers(number1, number2) do
    # Method 1:
    # Enum.map(numbers, fn x -> x * 2 end)

    # Method 2:
    # We will consider double as a function
    # use function double
    # double = fn x -> x * 2 end
    # double.(numbers)

    # Method 3:
    # We will consider double as a function
    # use function double
    # &(&1) giống hệt như fn x -> x. Nhưng không cần sử dụng end
    # double = &(&1 * 2)
    # double.(numbers)

    # Method 4:
    # Enum.map(numbers, &(&1 * 2))

    # Method 5:
    # prod = fn a,b -> a * b + 10 end
    # prod.(number1, number2)

    # Method 6:
    # prod = &((&1 * &2) + 10)
    # prod.(number1, number2)
  end

end
