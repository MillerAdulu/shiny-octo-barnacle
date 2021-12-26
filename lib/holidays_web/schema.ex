defmodule Holidays.Schema do
  use Absinthe.Schema

  alias Holidays.GraphQL.Middleware.ErrorHandler
  alias Holidays.GraphQL.Middleware.SafeResolution

  alias Holidays.GraphQL.Schema

  import_types(Absinthe.Type.Custom)
  import_types(Schema.DayTypes)

  query do

  end

  mutation do
    import_fields(:create_day)
  end

  def middleware(middleware, _field, %{identifier: type}) when type in [:query, :mutation] do
    SafeResolution.apply(middleware) ++ [ErrorHandler]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end

end
