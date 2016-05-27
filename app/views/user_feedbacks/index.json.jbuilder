json.array!(@user_feedbacks) do |user_feedback|
  json.extract! user_feedback, :id, :mobile_number, :current_brand, :current_variant, :other_brand, :other_variant, :no_of_sticks, :reason_cb, :reason_cv, :reason_ob, :reason_ov, :reason_sticks
  json.url user_feedback_url(user_feedback, format: :json)
end
