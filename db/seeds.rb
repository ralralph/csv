User.create!(
  [
    {
      id: 1,
      name: 'hoge1',
      age: 24
    },
    {
      id: 2,
      name: 'hoge2',
      age: 31
    },
    {
      id: 3,
      name: 'hoge3',
      age: 30
    }
  ]
)
AdminUser.create!(
  email: 'admin@example.com', password: 'password', password_confirmation: 'password'
  ) if Rails.env.development?