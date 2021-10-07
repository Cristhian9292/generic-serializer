defmodule GenericSerializer do
  @moduledoc """
  Documentation for GenericSerializer.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GenericSerializer.hello()
      :world

  """

  def generic_list(list) when is_list(list) do
    Enum.map(list, fn f -> generic_map(f) end)
  end

  def generic_list(_) do
    []
  end

  def generic_map(%Ecto.Association.NotLoaded{}) do
    nil
  end

  def generic_map(params) when is_map(params) do
    params
    |> handler_map_or_struct()
    |> delete_key_words_struct()
    |> format_fields_in_map()
  end

  def generic_map(params) do
    params
  end

  def format_fields_in_map(map) do
    keys =
      map
      |> Map.keys()

    elemnt_proccess =
      for key <- keys, length(keys) >= 0 do
        element = Map.get(map, key)

        case element do
          element = %NaiveDateTime{} ->
            element

          element when is_map(element) ->
            if Map.has_key?(element, :__meta__) or Map.has_key?(element, :__struct__) do
              element
              |> generic_map()
            else
              element
            end

          element when is_list(element) ->
            element
            |> generic_list()

          element ->
            element
        end
      end

    Enum.zip(keys, elemnt_proccess) |> Enum.into(%{})
  end

  defp delete_key_words_struct(struct) do
    Map.delete(struct, :__meta__)
  end

  defp handler_map_or_struct(%{__struct__: _} = arg) do
    arg
    |> Map.from_struct()
  end

  defp handler_map_or_struct(arg) when is_map(arg) do
    arg
  end
end
