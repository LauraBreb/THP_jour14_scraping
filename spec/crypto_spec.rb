require_relative '../lib/crypto'

describe "#crypto_name" do
  it "scrap crypto name of the website" do
    expect(crypto_name()).to eq("")
  end
end