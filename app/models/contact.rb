class Contact < ApplicationRecord

  def friendly_updated_at

    created_at.strftime("%A, %b %d")

  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japan_phone_number
    "+81 #{phone_number}"

  end
end