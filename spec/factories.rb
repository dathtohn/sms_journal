FactoryGirl.define do
  factory :user do
    name			"Eric Liu"
    email			"eric@example.com"
    phone			"123-456-7890"
    password 	"foobar"
    password_confirmation "foobar"
  end
end