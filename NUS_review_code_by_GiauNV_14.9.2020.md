NUS REVIEW CODE BY GIAUNV 14.9.2020
----------------------


### The issues have not been fixed yet

1. `./app/views/home/feed_album.html.erb`

```
<img src="https://www.islandair.com/wp-content/uploads/2018/07/ellie-adams-247024-unsplash.jpg" class="rotate5 " data-toggle="modal" data-target="#modal-album" title="<%=album.title%>" desc="<%=album.description%>">
--> use image_tag instead of <img> https://guides.rubyonrails.org/layouts_and_rendering.html#linking-to-images-with-the-image-tag
```

Please fix above issues and all places with the same.

### New issues

1. `./app/controllers/photos_controller.rb`

```
   if update_attributes(photo_detail)
--> where is `update_attributes` defined?
```

Please fix above issues and all places with the same.

2. `./app/models/album.rb`

```
   scope :feed_album, -> (current_user) { where(user_id:current_user.followees, shared:true).or(Album.where(user_id:current_user)).order(created_at: :desc) }
--> should not put complex query in scope
```