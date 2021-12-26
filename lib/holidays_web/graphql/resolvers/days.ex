defmodule Holidays.GraphQL.Resolvers.Days do
  def create_day(_parent, args, _resolution) do
    Holidays.Days.create_day(args)
  end

  def list_days(_parent, _args, _resolution) do
    {:ok, Holidays.Days.list_days()}
  end
end
