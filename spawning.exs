pid  = spawn fn -> 1 + 2 end

IO.puts(Process.alive?(pid) )

IO.puts(Process.alive?(self()) )


# 进程间通信,可以在iex中运行

parent = self()
spawn fn -> send(parent, {:hello,self()}) end

receive do
  {:hello,pid} -> "Got hello from #{inspect pid}"
end
