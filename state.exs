defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key,caller} ->
        send caller, Map.get(map,key)
        loop(map)

      {:put,key,value} ->
        loop(Map.put(map,key,value))
    end
  end
end



# 注意start_link函数启动一个新的进程。这个进程以一个空的图（map）为参数，执行loop/1函数。 启动后，loop/1函数等待消息，并且针对每个消息执行合适的操作。 如果收到:get消息，它会把消息发回给调用者，然后再次调用自身loop/1，等待新消息。 如果收到:put消息，它便用一个新版本的图变量（里面保存了新的键/值）再次调用loop/1。
#
# 执行一下iex kv.exs：
#
# iex> {:ok, pid} = KV.start_link
# #PID<0.62.0>
# iex> send pid, {:get, :hello, self()}
# {:get, :hello, #PID<0.41.0>}
# iex> flush
# nil
# 一开始进程内的图变量是没有键值的，所以发送一个:get消息并且刷新当前进程的收件箱，返回nil。 下面发送一个:put消息再试一次：
#
# iex> send pid, {:put, :hello, :world}
# #PID<0.62.0>
# iex> send pid, {:get, :hello, self()}
# {:get, :hello, #PID<0.41.0>}
# iex> flush
# :world
