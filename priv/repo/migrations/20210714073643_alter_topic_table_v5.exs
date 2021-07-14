defmodule Tanphat.Repo.Migrations.AlterTopicTableV5 do
  use Ecto.Migration

  def change do
    alter table("topic") do
      add :release?, :boolean, default: false
    end
  end
end
