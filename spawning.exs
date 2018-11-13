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



#该进程在失败时把它的父进程也弄停止了，因为它们是链接的。


# spawn_link fn -> raise "oops" end
#
# receive do
#   :hello -> "let's wait untill the process fails"
#
# end



# 任务建立在进程派生函数之上，提供了更好的错误报告和内省。
# 使用Task.start/1和Task.start_link/1代替spawn/1和spawn_link/1， 返回{:ok pid}而不仅仅是子进程的PID。这使得任务可以在监督者树中使用

Task.start  fn -> raise "oops" end

receive do
  :hello -> "let's wait untill the process fails"

end
