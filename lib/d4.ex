defmodule Aoc2021.D4 do
  @doc """
  D4 p1

  ## Examples

      iex> Aoc2021.D4.part_1([
      iex>   [
      iex>    [22, 13, 17, 11, 0],
      iex>    [8, 2, 23, 4, 24],
      iex>    [21, 9, 14, 16, 7],
      iex>    [6, 10, 3, 18, 5],
      iex>    [1, 12, 20, 15, 19],
      iex>   ],
      iex>   [
      iex>    [3, 15,  0,  2, 22],
      iex>    [9, 18, 13, 17, 5],
      iex>    [19, 8, 7, 25, 23],
      iex>    [20, 11, 10, 24, 4],
      iex>    [14, 21, 16, 12,  6],
      iex>  ],
      iex>   [
      iex>    [14, 21, 17, 24,  4],
      iex>    [10, 16, 15,  9, 19],
      iex>    [18,  8, 23, 26, 20],
      iex>    [22, 11, 13,  6,  5],
      iex>    [ 2,  0, 12,  3,  7],
      iex>   ]
      iex> ],
      iex> [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
      iex> )
      4512
  """
  def part_1(boards, calls) do
    Enum.reduce_while(calls, {[], nil}, fn call, {calls_made, _} ->
      new_calls_made = [call | calls_made]

      row_matched =
        Enum.find(boards, fn board ->
          Enum.any?(board, fn row -> length(row -- new_calls_made) == 0 end)
        end)

      if row_matched == nil do
        col_matched =
          Enum.find(boards, fn board ->
            board =
              Enum.zip(board)
              |> Enum.map(&Tuple.to_list/1)

            Enum.any?(board, fn col -> length(col -- new_calls_made) == 0 end)
          end)

        if col_matched do
          {:halt, {new_calls_made, col_matched}}
        else
          {:cont, {new_calls_made, nil}}
        end
      else
        {:halt, {new_calls_made, row_matched}}
      end
    end)
    |> then(fn {calls, card} ->
      sum =
        List.flatten(card)
        |> then(&(&1 -- calls))
        |> Enum.sum()

      hd(calls) * sum
    end)
  end

  @doc """
  D4 p2

  ## Examples

      iex> Aoc2021.D4.part_2([])
      :todo
  """
  def part_2(_input) do
    :todo
  end
end
