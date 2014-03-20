module UsersHelper

  def display_name user
    return user.name unless user.nil? || user.name.nil? || user.name.empty?
    "No Name"
  end

  def display_total_value user
    return content_tag(:p, "EVEN", class: "strong") if user.nil? || user.total_value.nil? || user.total_value == 0
    as_money = number_to_currency user.total_value, precision: 0

    return content_tag(:p, as_money, class: :positive) if user.total_value > 0
    content_tag(:p, as_money, class: :negative)
  end

end
