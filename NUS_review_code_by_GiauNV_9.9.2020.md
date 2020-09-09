NUS REVIEW CODE BY GIAUNV 9.9.2020
----------------------

1. `./app/controllers/albums_controller.rb`

```
@album = Album.new(album_detail)
--> the album has not saved into database yet

good:
@album = Album.create(album_detail)

```

2. `./app/controllers/home_controller.rb`

```
xxx.where(shared:true)
--> should be moved to scope https://guides.rubyonrails.org/active_record_querying.html#scopes
```

3.

```
<%=render "navbar/authenticated_navbar" %>
--> loop, should be moved to layout
```

4. `./app/views/home/discover_photo.html.erb`

```
<% if Like.where(user_id:current_user, likeable_type: "Photo", likeable_id:photo.id).present? %>
--> should not query in view, move to helper ./app/helpers/photos_helper.rb
```

5. `./app/views/home/feed_album.html.erb`

```
<img src="https://www.islandair.com/wp-content/uploads/2018/07/ellie-adams-247024-unsplash.jpg" class="rotate5 " data-toggle="modal" data-target="#modal-album" title="<%=album.title%>" desc="<%=album.description%>">
--> use image_tag instead of <img> https://guides.rubyonrails.org/layouts_and_rendering.html#linking-to-images-with-the-image-tag
```

Please fix above issues and all places with the same.