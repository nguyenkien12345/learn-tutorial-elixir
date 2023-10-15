defmodule Tutorials.Structs.Expense do
  alias Tutorials.Structs.Expense

  defstruct title: "", date: nil, amount: 0, store: ""

  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t()
  }

  @spec all() :: [t()]
  def all() do
    [
      %Expense{title: "washing_machine", date: ~D[2023-08-12], amount: 800, store: "NK"},
      %Expense{title: "Iron", date: ~D[2023-09-15], amount: 50, store: "TH"},
      %Expense{title: "washing_dishes", date: ~D[2023-08-15], amount: 500, store: "DMX"},
      %Expense{title: "Blanket", date: ~D[2023-10-22], amount: 10, store: "NK"},
    ]
  end

  @spec total_amount([t()]) :: number()
  def total_amount(list) do
    list
    |> Enum.reduce(0, fn item, acc -> item.amount + acc end)
  end

  @spec sort_by_date([t()], String) :: [t()]
  def sort_by_date(list, condition) do
    cond do
      condition == "asc" -> list |> Enum.sort_by(& (&1.date), :asc)
      condition == "desc" -> list |> Enum.sort_by(& (&1.date), :desc)
      true -> list
    end
  end

  @spec add_expense(t) :: [t()]
  def add_expense(%Expense{} = expense) do
    [expense | all()]
  end

  @spec update_amount_by_title(String.t(), number()) :: [t()]
  def update_amount_by_title(title, amount) do
    # Get Old Expense
    [oldExpense] = Enum.filter(all(), fn %{title: expense_title} -> String.downcase(expense_title) == String.downcase(title) end)
    # Update Old Expense
    newExpense = %{oldExpense | amount: amount}
    # all() |> List.delete(oldExpense): Thực hiện xóa Old Expense xong mới thêm New Expense
    [newExpense | all() |> List.delete(oldExpense)]
  end

  @users ["NTK", "MTTT", "NHQ", "VHN"]
  @passwords ["123", "456", "789", "111"]

  def authenticate(username) when username in @users, do: {:ok, "authorized"}
  def authenticate(_username), do: {:error, "unauthorized"}

  def verify_password(username, password) when username in @users and password in @passwords, do: {:ok, "password verified"}
  def verify_password(_username, _password), do: {:error, "wrong password"}

  def login(username, password) do
    with {:ok, _auth_message} <- authenticate(username),
         {:ok, _pw_message} <- verify_password(username, password) do
         {:ok, "#{username} logged in successfully"}
    else
        {:error, msg} -> {:error,  "#{username} logged in failed: #{msg}"}
        _ -> :unauthorized
    end
  end
end

# Tutorials.Structs.Expense.total_amount(Tutorials.Structs.Expense.all()) |> IO.puts()
# Tutorials.Structs.Expense.sort_by_date(Tutorials.Structs.Expense.all(), "asc") |> IO.inspect()
# Tutorials.Structs.Expense.sort_by_date(Tutorials.Structs.Expense.all(), "desc") |> IO.inspect()
# Tutorials.Structs.Expense.sort_by_date(Tutorials.Structs.Expense.all(), "default") |> IO.inspect()

# Gọi với iex -S mix
# newExpense = %Expense{title: "Pillow", date: nil, amount: 5, store: "Lazada"}
# Tutorials.Structs.Expense.add_expense(newExpense)
# Tutorials.Structs.Expense.update_amount_by_title("Iron", 55) |> IO.inspect()

Tutorials.Structs.Expense.login("NTK", "123") |> IO.inspect()
