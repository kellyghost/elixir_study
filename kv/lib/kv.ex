defmodule KV do
  @moduledoc """
  Documentation for KV.
  """

  @doc """
  Hello world.

  ## Examples

      iex> KV.hello()
      :world

  """
  def hello do
    :world
  end
end



mix new kv --module KV
编译
$ cd kv
$ mix compile

一旦工程被编译成功，便可以从工程目录启动一个iex会话：
$ iex -S mix


执行测试，使用命令mix test：
