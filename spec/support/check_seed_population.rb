## Check if rake db:seed populated right values

RSpec.shared_examples 'db:seed validable' do |model, attr, source|
  it "contain default values for #{model}" do
    init_vals = model.all.pluck(attr)
    expect((init_vals & source).sort).to eq source.sort
  end
end