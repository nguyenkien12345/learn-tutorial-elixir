defmodule BasicMath do
  @moduledoc """
  The `basic_math` module provides calculation functions related to addition, subtraction, multiplication and division calculations
  """
  @moduledoc since: "1.0.0"

  @doc """
  `plus`: Addition of 2 numbers.

  ## Input
  * `number1`: number | required.
  * `number2`: number | required.

  ## Output
  Returns number.

  ## Examples

      iex(1)> BasicMath.plus(10,20)
      30
  """
  @doc since: "1.0.0"
  @spec plus(integer(), integer()) :: integer()
  def plus(number1, number2), do: number1 + number2

  @doc """
  `minus`: Subtraction of 2 numbers.

  ## Input
  * `number1`: number | required.
  * `number2`: number | required.

  ## Output
  Returns number.

  ## Examples
      iex(1)> BasicMath.minus(10,20)
      -10
  """
  @doc since: "1.0.0"
  @spec minus(integer(), integer()) :: integer()
  def minus(number1, number2), do: number1 - number2

  @doc """
  `multi`: Multiplication of 2 numbers.

  ## Input
  * `number1`: number | required.
  * `number2`: number | required.

  ## Output
  Returns number.

  ## Examples
      iex(1)> BasicMath.multi(10,20)
      200
  """
  @doc since: "1.0.0"
  @spec multi(integer(), integer()) :: integer()
  def multi(number1, number2), do: number1 * number2

  @doc """
  `devide`: Division of 2 numbers.

  ## Input
  * `number1`: number | required.
  * `number2`: number | required.

  ## Output
  Returns number.

  ## Examples
      iex(1)> BasicMath.devide(10,20)
      0.5
  """
  @doc since: "1.0.0"
  @spec devide(integer(), integer()) :: integer()
  def devide(number1, number2), do: number1 / number2

  @doc """
  `math`: Perform all four math operations including addition, subtraction, multiplication and division
  """
  @doc since: "1.0.0"
  @spec math(integer(), integer(), string()) :: integer()
  def math(number1 \\ 0, number2 \\ 0, operator \\ "+") do
    case operator do
      "+" -> number1 + number2
      "-" -> number1 - number2
      "*" -> number1 * number2
      "/"  -> number1 / number2
      _ -> IO.puts("Operator is not supported")
    end
  end
end
