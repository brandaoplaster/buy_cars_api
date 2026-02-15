defmodule BuyCarsApi.Showroom.TestDrive do
  use Ecto.Schema
  import Ecto.Changeset

  alias BuyCarsApi.Catalog.Vehicle
  alias BuyCarsApi.Accounts.Customer

  schema "test_drives" do
    field :scheduled_date, :naive_datetime
    field :completed_date, :naive_datetime
    field :status, :string
    field :notes, :string

    belongs_to :vehicle, Vehicle
    belongs_to :customer, Customer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(test_drive, attrs) do
    test_drive
    |> cast(attrs, [:scheduled_date, :completed_date, :status, :notes])
    |> validate_required([:scheduled_date, :completed_date, :status, :notes])
  end
end
