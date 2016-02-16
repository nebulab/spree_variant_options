Spree::Variant.class_eval do

  include ActionView::Helpers::NumberHelper

  # supports interaction with spree_multi_currency
  # we receive the current_currency as parameter to select the right price
  def to_hash(currency = Spree::Config[:currency])
    actual_price  = self.amount_in(currency)
    #actual_price += Calculator::Vat.calculate_tax_on(self) if Spree::Config[:show_price_inc_vat]
    {
      :id    => self.id,
      :in_stock => self.in_stock?,
      :price => number_to_currency(actual_price, unit: currency)
    }
  end

end
