defmodule Holidays.Repo.Migrations.CreateDays do
  use Ecto.Migration

  def change do
    create table(:days) do
      add :uuid, :string, null: false
      add :name, :string, null: false
      add :date, :string, null: false

      timestamps(inserted_at: :created_at)
    end
  end
end
