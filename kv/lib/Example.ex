defmodule Example do
  def cpu_burns(a,b,c) do
    x = a * 2
    y = b * 3
    z = c * 5

    x + y + z
  end

end


# 调试的方法：
# 参考： https://elixirschool.com/zh-hans/lessons/specifics/debugging/
#
# 启动
# iex > :debugger.start()
# 挂载模块
# iex > :int.ni(Example)
#
# 增加断点
# :int.break(Example, 8)
#
# 运行
# iex > Example.cpu_burns(1, 1, 1)
# 
# 双击那一列，就可以启动调试界面了
