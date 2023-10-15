defmodule ConditionalLooping do
  @name_list ["kien", "quan", "khoa"]

  # Bước 1
  # Nhận vào 2 list:
  # list 1 là danh sách đầu vào,
  # list 2 là danh sách chúng ta đang xây dựng giải pháp để xử lý
  def names(phrase), do: names(String.split(phrase), [])

  # Bước 2A
  def names([name | tail], acc) when name in @name_list do
    names(tail, [String.upcase(name) | acc])
  end

  # Bước 2B
  def names([name | tail], acc) do
    names(tail, [name | acc])
  end

  # Bước 3:
  # Nếu mà list 1 trả về danh sách rỗng => Kết thúc đệ quy và trả lại chuỗi
  def names([], acc), do: Enum.reverse(acc) |> Enum.join(" ")
end
