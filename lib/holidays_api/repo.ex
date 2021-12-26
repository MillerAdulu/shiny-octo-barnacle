defmodule HolidaysApi.Repo do
  use Ecto.Repo,
    otp_app: :holidays_api,
    adapter: Ecto.Adapters.Postgres
end
