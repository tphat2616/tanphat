defmodule Tanphat.TopicService do
  alias Tanphat.Repo
  import Ecto.Query

  def save_topic(attrs) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  def list_blog(topic_id, opts \\ []) do
    Topic
    |> where([tp], tp.topic_id == ^topic_id)
    |> order_by(desc: :like)
    |> order_by(desc: :updated_at)
    |> Repo.paginate(opts)
  end
end
