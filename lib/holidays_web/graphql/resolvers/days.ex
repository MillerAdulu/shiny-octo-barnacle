defmodule Holidays.GraphQL.Resolvers.Days do
  def create_day(_parent, args, _resolution) do
    Holidays.Days.create_day(args)
  end
end
