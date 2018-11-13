#脚本方式调用模式，不会生成.beam文件，编写exs脚本文件而不是ex文件

defmodule Math do
  def sum(a,b) do
    a + b
  end
end

IO.puts(Math.sum(3,4)) 
