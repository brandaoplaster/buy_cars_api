defmodule BuyCarsApi.Showroom do
  @moduledoc """
  The Showroom context.
  """

  import Ecto.Query, warn: false
  alias BuyCarsApi.Repo

  alias BuyCarsApi.Showroom.TestDrive

  @doc """
  Returns the list of test_drives.

  ## Examples

      iex> list_test_drives()
      [%TestDrive{}, ...]

  """
  def list_test_drives do
    Repo.all(TestDrive)
  end

  @doc """
  Gets a single test_drive.

  Raises `Ecto.NoResultsError` if the Test drive does not exist.

  ## Examples

      iex> get_test_drive!(123)
      %TestDrive{}

      iex> get_test_drive!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test_drive!(id), do: Repo.get!(TestDrive, id)

  @doc """
  Creates a test_drive.

  ## Examples

      iex> create_test_drive(%{field: value})
      {:ok, %TestDrive{}}

      iex> create_test_drive(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test_drive(attrs) do
    %TestDrive{}
    |> TestDrive.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test_drive.

  ## Examples

      iex> update_test_drive(test_drive, %{field: new_value})
      {:ok, %TestDrive{}}

      iex> update_test_drive(test_drive, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test_drive(%TestDrive{} = test_drive, attrs) do
    test_drive
    |> TestDrive.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test_drive.

  ## Examples

      iex> delete_test_drive(test_drive)
      {:ok, %TestDrive{}}

      iex> delete_test_drive(test_drive)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test_drive(%TestDrive{} = test_drive) do
    Repo.delete(test_drive)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test_drive changes.

  ## Examples

      iex> change_test_drive(test_drive)
      %Ecto.Changeset{data: %TestDrive{}}

  """
  def change_test_drive(%TestDrive{} = test_drive, attrs \\ %{}) do
    TestDrive.changeset(test_drive, attrs)
  end
end
