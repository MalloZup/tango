defmodule Tango do
  @moduledoc """
  Documentation for Tango.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Tango.hello
      :world

  """
  def init_table_tasks() do
    :ets.new(:gitarro_tasks, [:set, :protected])
  end

 # refactor and store values to table
  def load_yaml(filename) do
    table_task = init_table_tasks
    data = :yamerl_constr.file(filename)
    flat = List.flatten(data)
    Enum.each flat, fn post -> 
      case post do
       {'context', value} -> IO.puts value
       {'repository', value} -> IO.puts value
       {'test', value} -> IO.puts value
      end 
    end
#    :ets.insert(table_task, data)
  end
end

defmodule Tango.CLI do
  @moduledoc """
  Documentation for tango
  """
  import Tango
  def main(args \\ []) do
    IO.puts('LOADING YML')
    load_yaml('gitarro_jobs.yml')
  end
end
