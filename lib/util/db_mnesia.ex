defmodule Util.DbMnesia do
  def select(table_name) do
    :mnesia.start()
    table_atom = String.to_atom(table_name)
    :mnesia.wait_for_tables([table_atom], 1000)

    columns =
      :mnesia.table_info(table_atom, :attributes)
      |> Enum.map(&Atom.to_string(&1))

    specs =
      [table_atom] ++
         Enum.map(1..Enum.count(columns), &:"$#{&1}")
      |> List.to_tuple()

    rows =
      :mnesia.transaction(fn ->
        :mnesia.select(table_atom, [{specs, [], [:"$$"]}])
      end)
      |> elem(1)

    %{
      columns: columns,
      command: :select,
      connection_id: 0,
      num_rows: Enum.count(rows),
      rows: rows
    }
  end
end
