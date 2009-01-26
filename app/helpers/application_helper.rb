# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def menu
    menu_items.map { |title, url| link_to title, url }.join("\n")
  end

  private

  def menu_items
    items = []

    items << ["Products",  products_url]

    if current_user
      items << ["Purchases", purchases_url] if current_user.admin?

      if current_user.has_role?(:admin) || current_user.has_role?(:partner)
        items << ["Users",     users_url]
      end

      items << ["Profile", profile_url]

      items << ["Logout", logout_url]
    else
      items << ["Login", login_url]
    end

    items
  end
end
