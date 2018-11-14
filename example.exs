# defmodule Example do
#
#   def listen do
#     receive do
#       {:ok, "hello"} -> IO.puts("world")
#     end
#
#     listen
#
#   end
#
# end



# iex> pid = spawn(Example, :listen, [])
# #PID<0.108.0>
#
# iex> send pid, {:ok, "hello"}
# World
# {:ok, "hello"}
#
# iex> send pid, :ok
# :ok




# defmodule Example do
#   def explode, do: exit(:kaboom)
#
#   def run do
#     Process.flag(:trap_exit, true)
#     spawn_link(Example, :explode, [])
#
#     receive do
#       {:EXIT, from_pid, reason} -> IO.puts("Exit reason:#{reason}")
#     end
#   end
# end
#
#
#
#


defmodule Example do
  def explode, do: exit(:kaboom)

  def run do
    {pid, ref} = spawn_monitor(Example, :explode, [])

    receive do
      {:DOWN, ref, :process, from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end
end
