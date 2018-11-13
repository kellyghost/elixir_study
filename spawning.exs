pid  = spawn fn -> 1 + 2 end

IO.puts(Process.alive?(pid) )

IO.puts(Process.alive?(self()) )


# 进程间通信,可以在iex中运行

parent = self()
spawn fn -> send(parent, {:hello,self()}) end

receive do
  {:hello,pid} -> "Got hello from #{inspect pid}"
end


# 在shell中执行程序时，辅助函数flush/0很有用。它清空并打印进程邮箱中的所有消息：
#
# iex> send self(), :hello
# :hello
# iex> flush()
# :hello
# :ok
