Transaction.delete_all
User.delete_all

# Add roles
['admin', 'owner', 'member'].each do |role_name|
  Role.create(name: role_name)
end

# Add admin User
admin = User.find_by_email("admin@admin.com")
admin = User.new if admin.nil?
admin.email = "farm.aralikatti@gmail.com"
admin.password = "123456"
admin.user_roles.build(role_id: Role.find_by_name('admin').id)
admin.save

# Add Owner K S ARALIKATTI
owner = User.find_by_email("ksaralikatti@hotmail.com")
owner = User.new(email: 'ksaralikatti@hotmail.com', password: '123456') if owner.nil?
owner.user_roles.build(role_id: Role.find_by_name('owner').id)
owner.save

# Add Members
['raju.aralikatti@gmail.com', 'drsuchi22@gmail.com', 'vinay.aralikatti@gmail.com', 'chaya.aralikatti@gmail.com'].each do |email|
  member = User.find_by_email(email)
  member = User.new(email: email, password: '123456') if member.nil?
  member.user_roles.build(role_id: Role.find_by_name('member').id)
  member.save
end