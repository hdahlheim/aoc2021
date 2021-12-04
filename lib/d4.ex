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

      board_matched =
        Enum.find(boards, fn board ->
          transposed_board =
            Enum.zip(board)
            |> Enum.map(&Tuple.to_list/1)

          all_options = Enum.concat(board, transposed_board)

          Enum.any?(all_options, fn row -> length(row -- new_calls_made) == 0 end)
        end)

      case board_matched do
        nil -> {:cont, {new_calls_made, nil}}
        _ -> {:halt, {new_calls_made, board_matched}}
      end
    end)
    |> then(fn {calls, card} ->
      List.flatten(card)
      |> then(&(&1 -- calls))
      |> Enum.sum()
      |> then(&(&1 * hd(calls)))
    end)
  end

  @doc """
  D4 p2

  ## Examples

      iex> Aoc2021.D4.part_2([
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
      1924
  """
  def part_2(boards, calls) do
    Enum.reduce_while(calls, {[], boards}, fn call, {calls_made, boards} ->
      new_calls_made = [call | calls_made]

      boards_remaining =
        Enum.reject(boards, fn board ->
          transposed_board =
            Enum.zip(board)
            |> Enum.map(&Tuple.to_list/1)

          all_options = Enum.concat(board, transposed_board)

          Enum.any?(all_options, fn row -> length(row -- new_calls_made) == 0 end)
        end)

      case length(boards_remaining) do
        0 -> {:halt, {new_calls_made, boards}}
        _ -> {:cont, {new_calls_made, boards_remaining}}
      end
    end)
    |> then(fn {calls, card} ->
      List.flatten(card)
      |> then(&(&1 -- calls))
      |> Enum.sum()
      |> then(&(&1 * hd(calls)))
    end)
  end
end
