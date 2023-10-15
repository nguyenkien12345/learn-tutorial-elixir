defmodule ControlFlow do

  def check_weight(weight \\ 0) do
    # Method 1:
    if weight < 55, do: "Safe weight", else: "Unsafe weight"
    # Method 2:
    unless weight < 55, do: "Unsafe weight", else: "Safe weight"
  end

  def check_fuel_level(percentage \\ 0) do
    cond do
      percentage == 100 -> "full tank"
      percentage > 75 -> "3/4 tank"
      percentage > 49 -> "1/2 tank"
      percentage > 24 -> "1/4 tank"
      true -> "empty tank"
    end
  end

  def error_code_check(value) do
    case value do
      200 -> :ok
      201 -> :created
      204 -> :no_content
      n when is_integer(n) and n > 299 -> :error
      _ -> :unknown
    end
  end

  # We cannot call functions in guard
  defp convert_kg_to_lb(kg_value), do: kg_value * 2.2

  def equipment_check(equipment_tuple) do
    case equipment_tuple do
      {weight, unit_type, quantity} when weight / quantity < 16 and unit_type == :kg -> :equipment_cleared
      {weight, unit_type, quantity} when unit_type == :lb ->
        if convert_kg_to_lb(weight) / quantity < 16, do: :equipment_cleared, else: :failed
      _ -> :unknown
    end
  end

end
