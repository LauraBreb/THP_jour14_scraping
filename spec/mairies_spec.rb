require_relative '../lib/mairies'

describe "#get_townhall_urls" do
  it "returns url adress of each town directory for the 185towns of Val d'Oise" do
    expect(get_townhall_urls().size).to eq(185)
  end
end

describe "#get_townhall_name" do
  it "returns the town list of at least the 185 town of Val d'Oise" do
    expect(get_townhall_name().size).to eq(185)
  end

  it "returns the name of the town based on the town directory website" do
    expect(get_townhall_name()).to include("ABLEIGES")
  end
end

describe "#get_townhall_email" do
  it "returns the email of the town based on the URL of the town directory website" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/ableiges.html")).to eq("mairie.ableiges95@wanadoo.fr")
  end
end

describe "#get_email_list" do
  it "returns email adress for the 185towns of Val d'Oise" do
    expect(get_email_list().size).to eq(185)
  end
end