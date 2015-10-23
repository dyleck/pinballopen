json.array!(@nationalities) do |nationality|
  json.extract! nationality, :id, :name, :flag_img_path
  json.url nationality_url(nationality, format: :json)
end
