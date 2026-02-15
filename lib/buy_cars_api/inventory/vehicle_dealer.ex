defmodule BuyCarsApi.Inventory.VehicleDealer do
  use Ecto.Schema
  import Ecto.Changeset

  alias BuyCarsApi.Catalog.Vehicle
  alias BuyCarsApi.Accounts.Dealer

  schema "vehicles_dealers" do
    field :acquisition_date, :date
    field :acquisition_price, :decimal

    belongs_to :vehicle, Vehicle
    belongs_to :dealer, Dealer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vehicle_dealer, attrs) do
    vehicle_dealer
    |> cast(attrs, [:acquisition_date, :acquisition_price])
    |> validate_required([:acquisition_date, :acquisition_price])
  end
end
