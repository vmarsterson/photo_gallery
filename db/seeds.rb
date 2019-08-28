require_relative '../lib/photo_gallery.rb'

gallery = Gallery.create(title: 'first_gallery', keywords: 'summer|bees')

photographer_1 = Photographer.create(name: 'John', avatar: '//randomuser.me/api/portraits/men/63.jpg')
photographer_2 = Photographer.create(name: 'Jane', avatar: '//randomuser.me/api/portraits/women/65.jpg')

photo_1 = Photo.create(likes: 20, url: 'https://via.placeholder.com/150', gallery_id: gallery.id, photographer_id: photographer_1.id)
photo_2 = Photo.create(likes: 45, url: 'https://via.placeholder.com/150', gallery_id: gallery.id, photographer_id: photographer_1.id)
photo_3 = Photo.create(likes: 12, url: 'https://via.placeholder.com/150', gallery_id: gallery.id, photographer_id: photographer_2.id)


