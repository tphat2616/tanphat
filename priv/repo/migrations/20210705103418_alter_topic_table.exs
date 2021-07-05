defmodule Tanphat.Repo.Migrations.AlterTopicTable do
  use Ecto.Migration

  def change do
    alter table("topic") do
      add :like, :integer
      add :dislike, :integer
    end
  end
end
