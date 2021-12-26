defmodule Holidays.GraphQL.Schema.DayTypes do
  use Absinthe.Schema.Notation

  alias Holidays.GraphQL.Resolvers


  ## Data Types
  object :day do
    field :uuid, :string
    field :name, :string
    field :date, :string
    field :created_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  object :create_day do
    @desc "Create a new holiday"
    field :create_day, :day do
      arg(:name, non_null(:string))
      arg(:date, non_null(:string))
      resolve(&Resolvers.Days.create_day/3)
    end
  end
end
