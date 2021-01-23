module CompanyActions
  extend ActiveSupport::Concern

  included do
    before_save :update_city_and_state, if: :zip_code_changed?
    def update_city_and_state
      data = ZipCodes.identify(zip_code)
      if data.present?
        self.city = data[:city]
        self.state_code = data[:state_code]
      else
        raise "There is no city and state is found with the given zipcode. Please provide the valid zipcode"
      end
    end
  end
end