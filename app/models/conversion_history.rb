# frozen_string_literal: true

class ConversionHistory < ApplicationRecord # rubocop:disable Style/Documentation
  validates :from, :to, :amount, presence: true
  before_save :calc_result

  after_create do
    broadcast_prepend_to 'conversion_histories'
  end

  after_destroy_commit do
    broadcast_remove_to 'conversion_histories'
  end

  private

  def calc_result
    open_exchange_rate = OpenExchangeRates::Rates.new
    self.result = open_exchange_rate.convert(amount, from: from, to: to)
  end
end
