json.extract! review, :id, :user_id, :room_id, :title, :body, :rating, :created_at, :updated_at
json.url review_url(review, format: :json)