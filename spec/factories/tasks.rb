FactoryBot.define do
  factory :task do
    title {"title"}
    content {"test_content"}
    status {:todo}
  end
end
