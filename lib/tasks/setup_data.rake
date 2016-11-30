task :setup_data => :environment do 
	# Create Roles
	Role.create(name: "admin")
	Role.create(name: "host")
	Role.create(name: "guest")
	Role.create(name: "user")

	# Create Users & Assign Roles
	user = User.create(email: "admin@gmail.com", password: "secret123")
	user.roles.push(Role.first) #assign admin role
	user.roles.push(Role.last)  #assign user role

	user = User.create(email: "host@gmail.com", password: "secret123")
	user.roles.push(Role.second)
	user.roles.push(Role.last)

	user1 = User.create(email: "guest@gmail.com", password: "secret123")
	user1.roles.push(Role.third)
	user1.roles.push(Role.last)

	user = User.create(email: "1@gmail.com", password: "secret123")
	user.roles.push(Role.last)

	

end