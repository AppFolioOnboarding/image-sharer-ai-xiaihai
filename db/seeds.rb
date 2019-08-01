# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

image_link_list = [
  'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',
  'https://images.unsplash.com/photo-1564666577913-f524024e26a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564576605702-e2614255abc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',
  'https://images.unsplash.com/photo-1564666577913-f524024e26a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564576605702-e2614255abc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',
  'https://images.unsplash.com/photo-1564666577913-f524024e26a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564576605702-e2614255abc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',
  'https://images.unsplash.com/photo-1564666577913-f524024e26a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564576605702-e2614255abc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',
  'https://images.unsplash.com/photo-1564666577913-f524024e26a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564576605702-e2614255abc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80',
  'https://images.unsplash.com/photo-1564666577913-f524024e26a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564576605702-e2614255abc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564429701046-9bcd1912a801?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  'https://images.unsplash.com/photo-1564664044569-a0c916520f15?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80'
]

image_link_list.each do |image_link|
  Image.create(link: image_link)
end
