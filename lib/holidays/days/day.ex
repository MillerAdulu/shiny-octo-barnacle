defmodule Holidays.Days.Day do
  use Ecto.Schema
  import Ecto.Changeset

  schema "days" do
    field :uuid, :string
    field :date, :string
    field :name, :string

    timestamps(inserted_at: :created_at)
  end

  @doc false
  def changeset(day, attrs) do
    day
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
    |> add_uuid
  end

  defp add_uuid(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        {:ok, uuid} = Ecto.UUID.load(Ecto.UUID.bingenerate())

        put_change(
          changeset,
          :uuid,
          uuid
        )

      _ ->
        changeset
    end
  end
end
