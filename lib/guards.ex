defmodule Guards do

  #  Checks if the input value is an integer
  def type(value) when is_integer(value), do: :integer

  # Check if the input value is a decimal number
  def type(value) when is_float(value), do: :float

  # Checks if input value is a string
  # def type(value) when is_binary(value), do: :binary

  # Checks if input value is an atom
  # def type(value) when is_atom(value), do: :atom

  def type(value) when not is_number(value), do: :not_number

  def is_signle_digit(value) when is_integer(value) and value < 10, do: :is_signle_digit
  def is_signle_digit(value) when not is_integer(value) or value > 9, do: :is_not_signle_digit

  # Define your own guards (priavte guards)
  defguardp is_even(value) when is_integer(value) and rem(value, 2) == 0
  # defguardp is_odd(value) when is_integer(value) and not is_even(value)

  def return_even_numbers(value \\ :empty)
  def return_even_numbers(value) when is_even(value), do: "Even numbers: " <> Integer.to_string(value)
  def return_even_numbers(value) when not is_even(value), do: "Odd numbers: " <> Integer.to_string(value)
end
