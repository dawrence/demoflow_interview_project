# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

demo1 = Demo.create(title: 'First Demo')
demo2 = Demo.create(title: 'Second Demo')
Demo.create(title: 'Void Demo')

HtmlSlide.create(content: 'Slide HTML 1', demo_id: demo1.id)
WebSlide.create(content: 'Slide Web 2', demo_id: demo1.id)
ImageSlide.create(content: 'Slide Image 3', demo_id: demo1.id)
ImageSlide.create(content: 'Slide Image 4', demo_id: demo1.id)

HtmlSlide.create(content: 'Slide HTML 1', demo_id: demo2.id)
WebSlide.create(content: 'Slide Web 2', demo_id: demo2.id)
ImageSlide.create(content: 'Slide Image 3', demo_id: demo2.id)
WebSlide.create(content: 'Slide Web 4', demo_id: demo2.id)
