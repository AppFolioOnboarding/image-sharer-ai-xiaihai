# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

image_list = [
  {
    link: 'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',
    tags: 'hand, blue'
  },
  {
    link: 'https://images.unsplash.com/photo-1564666577913-f524024e26a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
    tags: 'yellow, tent, photographer, nature'
  },
  {
    link: 'https://images.unsplash.com/photo-1564576605702-e2614255abc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
    tags: 'sky, hat, nature'
  },
  {
    link: 'https://images.unsplash.com/photo-1564429701046-9bcd1912a801?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
    tags: 'stair, blue, red'
  },
  {
    link: 'https://images.unsplash.com/photo-1564756885597-f30768b422b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=976&q=80',
    tags: 'sky, nature, ocean'
  },
  {
    link: 'https://images.unsplash.com/photo-1564647318295-30ec5f4c7c13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    tags: 'tree, yellow, photographer, nature'
  },
  {
    link: 'https://images.unsplash.com/photo-1564697362245-3777f9483805?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1001&q=80',
    tags: 'pink, hand, drink'
  }
]

image_list.each do |image|
  Image.create(link: image[:link], tag_list: image[:tags])
end
