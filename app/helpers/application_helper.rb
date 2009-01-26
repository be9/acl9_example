# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def menu
    menu_items.map { |title, url| link_to title, url }.join("\n")
  end

  private

  def menu_items
    available = [
      ["Products",  products_url],
      ["Purchases", purchases_url, :admin?],
      ["Users",     users_url, 'admin', 'partner'],
      ["Ones",      ones_url, :admin?],
      ["Twos",      twos_url, :partner?],
      ["Threes",    threes_url, :contractor?],
      ["Fours",     fours_url, :admin?, :partner?],
      ["Fives",     fives_url, :admin?, :contractor?],
      ["Sixes",     sixes_url, :partner?, :contractor?],
    ]

    items = []

    available.each do |m|
      roles = m[2..-1]

      items << m[0...2] if roles.empty? || 
                          (current_user && roles.any? { |role|
                            role.is_a?(Symbol) ? current_user.send(role) : current_user.has_role?(role)})
    end

    if current_user
      items << ["Profile", profile_url]
      items << ["Logout", logout_url]
    else
      items << ["Login", login_url]
    end

    items
  end
end
