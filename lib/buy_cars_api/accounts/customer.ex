defmodule BuyCarsApi.Accounts.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :name, :string
    field :email, :string
    field :document, :string
    field :phone, :string
    field :birth_date, :date
    field :address, :string
    field :gender, Ecto.Enum, values: [:male, :female]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [
      :name,
      :email,
      :document,
      :phone,
      :birth_date,
      :address,
      :gender
    ])
    |> validate_required([
      :name,
      :email,
      :document,
      :phone,
      :birth_date,
      :address,
      :gender
    ])
  end
end
