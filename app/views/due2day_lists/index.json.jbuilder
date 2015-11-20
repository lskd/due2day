json.array!(@due2day_lists) do |due2day_list|
  json.extract! due2day_list, :id, :title, :description
  json.url due2day_list_url(due2day_list, format: :json)
end
