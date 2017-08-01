require "spec_helper"

RSpec.describe Rulers do
  it "has a version number" do
    expect(Rulers::VERSION).not_to be nil
  end

  xit 'makes request' do
    get '/'

    expect(last_response.ok?).to eq(true)
    expect(last_response.body).to eq('Hello')
  end
end
