# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed grant
Grant.destroy_all
Grant.create(id: 0, group_name:"Admin",sys_admin: true, sys_read: true, sys_download: true, sys_upload: true)
Grant.create(id: 1, group_name:"User",sys_admin: false, sys_read: true, sys_download: true, sys_upload: true)
Grant.create(id: 2, group_name:"Not verified User",sys_admin: false, sys_read: false, sys_download: false, sys_upload: false)
Grant.create(id: 3, group_name:"Verified not pass User",sys_admin: false, sys_read: false, sys_download: false, sys_upload: false)
# seed admin
user = User.create(username: "admin", email: "admin@admin.com", password: "admin", grant_id: 0)
UserInformation.create(user_id: user.id, nickname: "admin", school: "none")

