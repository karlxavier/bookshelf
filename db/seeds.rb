# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create!(
  [
    {
      title: 'Hunt for Red October',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'Tom Clancy',
      image: 'http://localhost:3001/images/img1.jpeg'
    },
    {
      title: 'Shawshank Redemption',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'Stephen King',
      image: 'http://localhost:3001/images/img1.jpeg'
    },
    {
      title: 'Lord of the Ring',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'J. R. R. Tolkien',
      image: 'http://localhost:3001/images/img1.jpeg'
    },
    {
      title: 'The Hobbit',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'J. R. R. Tolkien',
      image: 'http://localhost:3001/images/img1.jpeg'
    },
    {
      title: 'The Godfather',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'Mario Puzo',
      image: 'http://localhost:3001/images/img1.jpeg'
    },
    {
      title: 'Clear and Present Danger',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'Tom Clancy',
      image: 'http://localhost:3001/images/img1.jpeg'
    },
    {
      title: 'Bourne Identity',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'Robert Ludlum',

    },
    {
      title: 'Bourne Ultimatum',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      author: 'Robert Ludlum',
      image: 'http://localhost:3001/images/img1.jpeg'
    }
  ]
)

# User.create!(  
#   email: 'karl@test.com',
#   name: 'Karl Test',
#   password: 'password'
# )