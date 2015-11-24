{"filter":false,"title":"static_pages_controller.rb","tooltip":"/app/controllers/static_pages_controller.rb","undoManager":{"stack":[[{"start":{"row":23,"column":125},"end":{"row":23,"column":126},"action":"insert","lines":["m"]}],[{"start":{"row":23,"column":126},"end":{"row":23,"column":127},"action":"insert","lines":["s"]}],[{"start":{"row":23,"column":127},"end":{"row":23,"column":128},"action":"insert","lines":["."]}],[{"start":{"row":23,"column":128},"end":{"row":23,"column":129},"action":"insert","lines":["/"]}],[{"start":{"row":23,"column":128},"end":{"row":23,"column":129},"action":"remove","lines":["/"]}],[{"start":{"row":23,"column":72},"end":{"row":23,"column":73},"action":"remove","lines":[" "]},{"start":{"row":23,"column":72},"end":{"row":24,"column":0},"action":"insert","lines":["",""]},{"start":{"row":24,"column":0},"end":{"row":24,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":24,"column":8},"end":{"row":24,"column":10},"action":"insert","lines":["  "]}],[{"start":{"row":33,"column":8},"end":{"row":33,"column":43},"action":"remove","lines":["marker.infowindow feed_item.address"]},{"start":{"row":33,"column":8},"end":{"row":34,"column":109},"action":"insert","lines":["marker.infowindow render_to_string(partial: '/shared/feed_item',","          collection: @feed_items.select{|feed_items| feed_items.origin_address == feed_item.origin_address})"]}],[{"start":{"row":34,"column":71},"end":{"row":34,"column":72},"action":"remove","lines":["_"]}],[{"start":{"row":34,"column":70},"end":{"row":34,"column":71},"action":"remove","lines":["n"]}],[{"start":{"row":34,"column":69},"end":{"row":34,"column":70},"action":"remove","lines":["i"]}],[{"start":{"row":34,"column":68},"end":{"row":34,"column":69},"action":"remove","lines":["g"]}],[{"start":{"row":34,"column":67},"end":{"row":34,"column":68},"action":"remove","lines":["i"]}],[{"start":{"row":34,"column":66},"end":{"row":34,"column":67},"action":"remove","lines":["r"]}],[{"start":{"row":34,"column":65},"end":{"row":34,"column":66},"action":"remove","lines":["o"]}],[{"start":{"row":34,"column":92},"end":{"row":34,"column":93},"action":"remove","lines":["_"]}],[{"start":{"row":34,"column":91},"end":{"row":34,"column":92},"action":"remove","lines":["n"]}],[{"start":{"row":34,"column":90},"end":{"row":34,"column":91},"action":"remove","lines":["i"]}],[{"start":{"row":34,"column":89},"end":{"row":34,"column":90},"action":"remove","lines":["g"]}],[{"start":{"row":34,"column":88},"end":{"row":34,"column":89},"action":"remove","lines":["i"]}],[{"start":{"row":34,"column":87},"end":{"row":34,"column":88},"action":"remove","lines":["r"]}],[{"start":{"row":34,"column":86},"end":{"row":34,"column":87},"action":"remove","lines":["o"]}],[{"start":{"row":28,"column":0},"end":{"row":29,"column":0},"action":"insert","lines":["",""]}],[{"start":{"row":29,"column":0},"end":{"row":29,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":29,"column":2},"end":{"row":29,"column":4},"action":"insert","lines":["  "]}],[{"start":{"row":29,"column":4},"end":{"row":29,"column":6},"action":"insert","lines":["  "]}],[{"start":{"row":29,"column":6},"end":{"row":29,"column":8},"action":"insert","lines":["  "]}],[{"start":{"row":29,"column":8},"end":{"row":29,"column":93},"action":"insert","lines":[" @feed_items = current_user.driver_wait.paginate(page: params[:page], :per_page => 3)"]}],[{"start":{"row":29,"column":8},"end":{"row":29,"column":9},"action":"remove","lines":[" "]}],[{"start":{"row":29,"column":92},"end":{"row":30,"column":0},"action":"insert","lines":["",""]},{"start":{"row":30,"column":0},"end":{"row":30,"column":8},"action":"insert","lines":["        "]}],[{"start":{"row":29,"column":47},"end":{"row":29,"column":92},"action":"remove","lines":["paginate(page: params[:page], :per_page => 3)"]}],[{"start":{"row":29,"column":46},"end":{"row":29,"column":47},"action":"remove","lines":["."]}],[{"start":{"row":29,"column":46},"end":{"row":29,"column":47},"action":"insert","lines":["."]}],[{"start":{"row":29,"column":47},"end":{"row":29,"column":48},"action":"insert","lines":["p"]}],[{"start":{"row":29,"column":48},"end":{"row":29,"column":49},"action":"insert","lines":["a"]}],[{"start":{"row":29,"column":49},"end":{"row":29,"column":50},"action":"insert","lines":["g"]}],[{"start":{"row":29,"column":50},"end":{"row":29,"column":51},"action":"insert","lines":["i"]}],[{"start":{"row":29,"column":51},"end":{"row":29,"column":52},"action":"insert","lines":["n"]}],[{"start":{"row":29,"column":52},"end":{"row":29,"column":53},"action":"insert","lines":["a"]}],[{"start":{"row":29,"column":53},"end":{"row":29,"column":54},"action":"insert","lines":["r"]}],[{"start":{"row":29,"column":53},"end":{"row":29,"column":54},"action":"remove","lines":["r"]}],[{"start":{"row":29,"column":53},"end":{"row":29,"column":54},"action":"insert","lines":["t"]}],[{"start":{"row":29,"column":54},"end":{"row":29,"column":55},"action":"insert","lines":["e"]}],[{"start":{"row":29,"column":55},"end":{"row":29,"column":57},"action":"insert","lines":["()"]}],[{"start":{"row":29,"column":56},"end":{"row":29,"column":57},"action":"insert","lines":["p"]}],[{"start":{"row":29,"column":57},"end":{"row":29,"column":58},"action":"insert","lines":["a"]}],[{"start":{"row":29,"column":58},"end":{"row":29,"column":59},"action":"insert","lines":["g"]}],[{"start":{"row":29,"column":59},"end":{"row":29,"column":60},"action":"insert","lines":["e"]}],[{"start":{"row":29,"column":60},"end":{"row":29,"column":61},"action":"insert","lines":[":"]}],[{"start":{"row":29,"column":61},"end":{"row":29,"column":62},"action":"insert","lines":[" "]}],[{"start":{"row":29,"column":62},"end":{"row":29,"column":63},"action":"insert","lines":["p"]}],[{"start":{"row":29,"column":63},"end":{"row":29,"column":64},"action":"insert","lines":["a"]}],[{"start":{"row":29,"column":64},"end":{"row":29,"column":65},"action":"insert","lines":["r"]}],[{"start":{"row":29,"column":65},"end":{"row":29,"column":66},"action":"insert","lines":["a"]}],[{"start":{"row":29,"column":66},"end":{"row":29,"column":67},"action":"insert","lines":["m"]}],[{"start":{"row":29,"column":67},"end":{"row":29,"column":68},"action":"insert","lines":["s"]}],[{"start":{"row":29,"column":68},"end":{"row":29,"column":70},"action":"insert","lines":["[]"]}],[{"start":{"row":29,"column":69},"end":{"row":29,"column":70},"action":"insert","lines":[":"]}],[{"start":{"row":29,"column":70},"end":{"row":29,"column":71},"action":"insert","lines":["p"]}],[{"start":{"row":29,"column":71},"end":{"row":29,"column":72},"action":"insert","lines":["a"]}],[{"start":{"row":29,"column":72},"end":{"row":29,"column":73},"action":"insert","lines":["g"]}],[{"start":{"row":29,"column":73},"end":{"row":29,"column":74},"action":"insert","lines":["e"]}],[{"start":{"row":29,"column":8},"end":{"row":29,"column":76},"action":"remove","lines":["@feed_items = current_user.driver_wait.paginate(page: params[:page])"]}],[{"start":{"row":29,"column":6},"end":{"row":29,"column":8},"action":"remove","lines":["  "]}],[{"start":{"row":29,"column":4},"end":{"row":29,"column":6},"action":"remove","lines":["  "]}],[{"start":{"row":29,"column":2},"end":{"row":29,"column":4},"action":"remove","lines":["  "]}],[{"start":{"row":29,"column":0},"end":{"row":29,"column":2},"action":"remove","lines":["  "]}],[{"start":{"row":28,"column":0},"end":{"row":29,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":27,"column":10},"end":{"row":28,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":17,"column":90},"end":{"row":17,"column":91},"action":"remove","lines":["3"]}],[{"start":{"row":17,"column":90},"end":{"row":17,"column":91},"action":"insert","lines":["4"]}],[{"start":{"row":17,"column":90},"end":{"row":17,"column":91},"action":"remove","lines":["4"]}],[{"start":{"row":17,"column":90},"end":{"row":17,"column":91},"action":"insert","lines":["3"]}],[{"start":{"row":17,"column":90},"end":{"row":17,"column":91},"action":"remove","lines":["3"]}],[{"start":{"row":17,"column":90},"end":{"row":17,"column":91},"action":"insert","lines":["1"]}],[{"start":{"row":17,"column":91},"end":{"row":17,"column":92},"action":"insert","lines":["0"]}],[{"start":{"row":17,"column":47},"end":{"row":17,"column":93},"action":"remove","lines":["paginate(page: params[:page], :per_page => 10)"]}],[{"start":{"row":17,"column":46},"end":{"row":17,"column":47},"action":"remove","lines":["."]}],[{"start":{"row":7,"column":48},"end":{"row":7,"column":94},"action":"remove","lines":[".paginate(page: params[:page], :per_page => 3)"]}],[{"start":{"row":51,"column":10},"end":{"row":51,"column":52},"action":"remove","lines":["marker.infowindow feed_item.origin_address"]},{"start":{"row":51,"column":10},"end":{"row":52,"column":109},"action":"insert","lines":["marker.infowindow render_to_string(partial: '/shared/feed_item',","          collection: @feed_items.select{|feed_items| feed_items.origin_address == feed_item.origin_address})"]}],[{"start":{"row":45,"column":45},"end":{"row":45,"column":90},"action":"remove","lines":["paginate(page: params[:page], :per_page => 3)"]}],[{"start":{"row":45,"column":44},"end":{"row":45,"column":45},"action":"remove","lines":["."]}],[{"start":{"row":73,"column":10},"end":{"row":73,"column":45},"action":"remove","lines":["marker.infowindow feed_item.address"]},{"start":{"row":73,"column":10},"end":{"row":74,"column":109},"action":"insert","lines":["marker.infowindow render_to_string(partial: '/shared/feed_item',","          collection: @feed_items.select{|feed_items| feed_items.origin_address == feed_item.origin_address})"]}],[{"start":{"row":74,"column":71},"end":{"row":74,"column":72},"action":"remove","lines":["_"]}],[{"start":{"row":74,"column":70},"end":{"row":74,"column":71},"action":"remove","lines":["n"]}],[{"start":{"row":74,"column":69},"end":{"row":74,"column":70},"action":"remove","lines":["i"]}],[{"start":{"row":74,"column":68},"end":{"row":74,"column":69},"action":"remove","lines":["g"]}],[{"start":{"row":74,"column":67},"end":{"row":74,"column":68},"action":"remove","lines":["i"]}],[{"start":{"row":74,"column":66},"end":{"row":74,"column":67},"action":"remove","lines":["r"]}],[{"start":{"row":74,"column":65},"end":{"row":74,"column":66},"action":"remove","lines":["o"]}],[{"start":{"row":74,"column":92},"end":{"row":74,"column":93},"action":"remove","lines":["_"]}],[{"start":{"row":74,"column":91},"end":{"row":74,"column":92},"action":"remove","lines":["n"]}],[{"start":{"row":74,"column":90},"end":{"row":74,"column":91},"action":"remove","lines":["i"]}],[{"start":{"row":74,"column":89},"end":{"row":74,"column":90},"action":"remove","lines":["g"]}],[{"start":{"row":74,"column":88},"end":{"row":74,"column":89},"action":"remove","lines":["i"]}],[{"start":{"row":74,"column":87},"end":{"row":74,"column":88},"action":"remove","lines":["r"]}],[{"start":{"row":74,"column":86},"end":{"row":74,"column":87},"action":"remove","lines":["o"]}],[{"start":{"row":64,"column":46},"end":{"row":64,"column":91},"action":"remove","lines":["paginate(page: params[:page], :per_page => 3)"]}],[{"start":{"row":64,"column":45},"end":{"row":64,"column":46},"action":"remove","lines":["."]}],[{"start":{"row":66,"column":50},"end":{"row":66,"column":95},"action":"remove","lines":["paginate(page: params[:page], :per_page => 3)"]}],[{"start":{"row":66,"column":49},"end":{"row":66,"column":50},"action":"remove","lines":["."]}]],"mark":-1,"position":100},"ace":{"folds":[],"scrolltop":240,"scrollleft":0,"selection":{"start":{"row":66,"column":49},"end":{"row":66,"column":49},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":{"row":15,"state":"start","mode":"ace/mode/ruby"}},"timestamp":1423328474000,"hash":"ec174691786b3059904c7343cf9c78c4576e7cd2"}