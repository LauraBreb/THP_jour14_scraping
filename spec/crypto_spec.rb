require_relative '../lib/crypto'

describe "#crypto_name" do
  it "scraps crypto name of the website" do
    expect(crypto_name()).to include("BTC")
  end
end

describe "#crypto_price" do
  it "scraps crypto price of the crypto currencies" do
    expect(crypto_price()).to include(1.0)
  end
end