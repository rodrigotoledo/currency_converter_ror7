class ConversionHistory < ApplicationRecord
  validates :from, :to, :amount, presence: true
  before_save :calc_result

  private
  def calc_result
    open_exchange_rate = OpenExchangeRates::Rates.new
    self.result = open_exchange_rate.convert(self.amount, :from => self.from, :to => self.to)
  end
end
