pid  = spawn fn -> 1 + 2 end

IO.puts(Process.alive?(pid) )

IO.puts(Process.alive?(self()) )
