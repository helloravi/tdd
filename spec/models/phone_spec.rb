require "spec_helper"

describe Phone do

  it "does not allow duplicate phone numbers per contact" do
    contact = Contact.create(firstname: "ravi",
                             lastname: "kanth",
                             email: "ravi@helloravi.com")
    contact.phones.create(phone_type: "home",
                         phone: "7386316739")
    phone = contact.phones.build(phone_type: "mobile",
                               phone: "7386316739")
    phone.valid?
    expect(phone.errors[:phone]).to include("has already been taken")
  end

  it "allows two contacts to share a phone number" do
    ravi = Contact.create(firstname: "ravi",
                             lastname: "kanth",
                             email: "ravi@helloravi.com")
    radhi = Contact.create(firstname: "radhi",
                             lastname: "ka",
                             email: "radhi@helloravi.com")
    ravi.phones.create(phone_type: "home", phone: "9985622402")
    radhi_phone = radhi.phones.build(phone_type: "home", phone: "9985622402")
    expect(radhi_phone).to be_valid
  end

end
