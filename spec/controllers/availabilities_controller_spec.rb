require 'rails_helper'

RSpec.describe AvailabilitiesController, type: :controller do

  describe "GET #show" do

    before { get :show }

    it { is_expected.to respond_with(200) }

    it { is_expected.to render_template(:show) }
  end

end
