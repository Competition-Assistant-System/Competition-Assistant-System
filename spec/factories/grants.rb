FactoryBot.define do
  factory :grant do
    group_name { "MyString" }
    sys_admin { false }
    sys_read { false }
    sys_download { false }
    sys_upload { false }
  end
end
