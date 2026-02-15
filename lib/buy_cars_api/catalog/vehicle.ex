defmodule BuyCarsApi.Catalog.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  alias BuyCarsApi.Catalog.Category

  schema "vehicles" do
    field :model, :string
    field :brand, :string
    field :year, :integer
    field :color, :string
    field :mileage, :integer
    field :price, :decimal
    field :status, :string
    field :condition, :string
    field :vehicle_type, Ecto.Enum, values: [:car, :motorcycle]
    field :country_of_origin, :string

    belongs_to :category, Category

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [
      :model,
      :brand,
      :year,
      :color,
      :mileage,
      :price,
      :status,
      :condition,
      :vehicle_type,
      :country_of_origin
    ])
    |> validate_required([
      :model,
      :brand,
      :year,
      :color,
      :mileage,
      :price,
      :status,
      :condition,
      :vehicle_type,
      :country_of_origin
    ])
  end
end
