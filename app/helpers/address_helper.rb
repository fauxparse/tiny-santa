module AddressHelper
  def format_address(address)
    content_tag :address do
      concat content_tag(:div, address.name) if address.name?
      concat content_tag(:div, address.line_1) if address.line_1?
      concat content_tag(:div, address.line_2) if address.line_2?
      concat content_tag(:div, address.suburb) if address.suburb?
      concat content_tag(:div, [address.city, address.postcode].join(', ')) if address.city? || address.postcode?
      concat content_tag(:div, address.country.upcase) if address.country?
    end
  end
end
