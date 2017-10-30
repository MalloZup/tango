defmodule Tango do
  @moduledoc """
  Documentation for Tango.
  """

  defp init_table_tasks() do
    :ets.new(:gitarro_tasks, [:set, :protected])
  end

  defp scan_yaml(data_yaml) do
    Enum.each data_yaml, fn post -> 
      case post do
       {'context', value} -> IO.puts value
       {'repository', value} -> IO.puts value
       {'test', value} -> IO.puts value
      end 
    end
  end

  def load_yaml(filename) do
    table_task = init_table_tasks
    data = :yamerl_constr.file(filename)
    flat = List.flatten(data)
    scan_yaml(flat)
    # FIXME: insert values on table.
    #:ets.insert(table_task, data)
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
