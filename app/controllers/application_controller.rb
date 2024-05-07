class ApplicationController < ActionController::Base
  before_action :set_countries

  private

  def set_countries
    @countries = Country.where(name: ['Japan', 'Korea', 'Singapore'])
  end
end
