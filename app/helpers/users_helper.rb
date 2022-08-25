module UsersHelper
  def profile_picture(user, width = 100, height = nil)
    image_path = user.image || "profile-placeholder.jpg"
    image_tag(image_path, width: width, height: height, class: "img-circle m-r-5")
  end

  def can_edit_profile?(user_id)
    user_signed_in? && current_user.id == user_id
  end
end
