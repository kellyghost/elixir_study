defmodule Math do
  def zero?(0) do
    true
  end

  def zero?(x) when is_number(x) do
    false
  end
end


# iex> Math.zero?(0)
# true
# iex> fun = &Math.zero?/1
# &Math.zero?/1
# iex> is_function fun
# true
# iex> fun.(0)
# true




# 本地定义的，或者已导入的函数，比如is_function/1，可以不用前缀模模块名：
#
# iex> &is_function/1
# &:erlang.is_function/1
# iex> (&is_function/1).(fun)
# true
# 这种语法还可以作为快捷方式来创建和使用函数：
#
# iex> fun = &(&1 + 1)
# #Function<6.71889879/1 in :erl_eval.expr/5>
# iex> fun.(1)
# 2
# 代码中&1 表示传给该函数的第一个参数。 因此，&(&1+1)其实等同于fn x->x+1 end。
