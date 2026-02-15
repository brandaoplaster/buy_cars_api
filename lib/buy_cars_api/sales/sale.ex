defmodule BuyCarsApi.Sales.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  alias BuyCarsApi.Catalog.Vehicle
  alias BuyCarsApi.Accounts.Customer

  schema "sales" do
    field :sale_date, :naive_datetime
    field :sale_price, :decimal
    field :payment_method, :string
    field :status, :string

    belongs_to :vehicle, Vehicle
    belongs_to :customer, Customer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:sale_date, :sale_price, :payment_method, :status])
    |> validate_required([:sale_date, :sale_price, :payment_method, :status])
  end
end
