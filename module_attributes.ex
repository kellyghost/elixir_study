# defmodule MyMath do
#   @moduledoc """
#   Preovides math.
#   ##  Example
#       iex> Math.sum(1.2)
#       3
#
#   """
#
#   @doc """
#   Calculates  the sum of two numbers.
#   """
#   def sum(a,b), do: a + b
#
# end


#文档的文件必须得是ex,不能用exs脚本文件，而且得用 elixirc ，不是elixir


defmodule MyServer do
  @initial_state %{host: "147.0.0.1",prot: 2456}
  IO.inspect(@initial_state)

  @my_data 14
  def first_data, do: @my_data

  @my_data 13
  def second_data,do: @my_data

end


IO.puts(MyServer.first_data)
IO.puts(MyServer.second_data)
