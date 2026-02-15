defmodule BuyCarsApi.Accounts.Dealer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dealers" do
    field :name, :string
    field :document, :string
    field :email, :string
    field :phone, :string
    field :address, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dealer, attrs) do
    dealer
    |> cast(attrs, [:name, :document, :email, :phone, :address])
    |> validate_required([:name, :document, :email, :phone, :address])
  end
end
