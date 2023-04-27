json.extract! product, :id, :title, :price, :image_link, :description, :lat, :long, :youtube_video_path, :created_at, :updated_at
json.url product_url(product, format: :json)
