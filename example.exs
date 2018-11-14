defmodule Example do

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("world")
    end

    listen

  end

end



# iex> pid = spawn(Example, :listen, [])
# #PID<0.108.0>
#
# iex> send pid, {:ok, "hello"}
# World
# {:ok, "hello"}
#
# iex> send pid, :ok
# :ok
