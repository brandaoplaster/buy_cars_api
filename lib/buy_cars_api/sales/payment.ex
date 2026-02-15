defmodule BuyCarsApi.Sales.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  alias BuyCarsApi.Sales.Sale

  schema "payments" do
    field :amount, :decimal
    field :payment_date, :naive_datetime
    field :payment_method, :string
    field :installment_number, :integer
    field :status, :string

    belongs_to :sale, Sale

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:amount, :payment_date, :payment_method, :installment_number, :status])
    |> validate_required([:amount, :payment_date, :payment_method, :installment_number, :status])
  end
end
