defmodule MyMath do
  @moduledoc """
  Preovides math.
  ##  Example
      iex> Math.sum(1.2)
      3

  """

  @doc """
  Calculates  the sum of two numbers.
  """
  def sum(a,b), do: a + b

end


#文档的文件必须得是ex,不能用exs脚本文件，而且得用 elixirc ，不是elixir
