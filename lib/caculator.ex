defmodule Caculator do

  def find_percentage_of_value(percentage, value) do
    # Method 1
    # value * (percentage / 100)

    # Method 2
    # decimal_percent = BasicMath.devide(percentage,100)
    # BasicMath.multi(value, decimal_percent)

    # Method 3: Use the pipe technique
    percentage
    |> BasicMath.devide(100)
    |> BasicMath.multi(value)
    |> BasicMath.round_up()
  end

end
