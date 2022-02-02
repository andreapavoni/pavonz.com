defmodule Pavonz.Blog.Post do
  @enforce_keys [:id, :author, :title, :body, :description, :tags, :date]
  defstruct [:id, :author, :title, :body, :description, :tags, :date]

  def build(filename, attrs, body) do
    [year, month_day_id] = filename |> Path.rootname() |> Path.split() |> Enum.take(-2)
    [month, day, id] = String.split(month_day_id, "-", parts: 3)
    date = Date.from_iso8601!("#{year}-#{month}-#{day}")
    description = attrs.description |> Earmark.as_html!()

    struct!(
      __MODULE__,
      Map.to_list(attrs) ++ [id: id, date: date, body: body, description: description]
    )
  end
end
