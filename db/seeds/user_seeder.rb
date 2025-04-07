module Seeds
  class UserSeeder
    def self.create_admin_user
      admin_email = 'admin@example.com'
      admin_password = 'password123'

      if User.exists?(email: admin_email)
        puts "Admin user already exists."
      else
        User.create!(
          email: admin_email,
          password: admin_password,
          password_confirmation: admin_password,
          is_admin: 1
        )
        puts "✅ Admin user created successfully!"
      end
    end
  end
end
