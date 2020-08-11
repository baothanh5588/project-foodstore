<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer">
	<div class="footer-middle">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-10 col-xs-12 col-md-offset-2 col-sm-offset-1 contact-footer">
					<div class="contact_title col-md-5 col-sm-6">
						<a href="${pageContext.request.contextPath}/public/index"><img src="${defines.URL_PUBLIC}/assets/logothanhtruong.png?1494485291817" alt="Bếp nhà Du"/></a>
					</div>
					<ul class="links-contact col-md-7 col-sm-6">
						<li>Food store Thạnh Trương</li>
						<li>Address: </li>
						<li>Phone: </li>
						<li>Open: 8:00 AM - 21.00 PM</li>
						<li>
							<a href="#"><i class="fa fa-facebook-official"></i></a>
							<a href="#"><i class="fa fa-youtube-square"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-xs-12 coppyright"><p><a href="#" class="published">Thiết kế website</a> bởi Trương Thạnh</p></div>
			</div>
		</div>
	</div>

</footer>
<!-- End Footer -->
<!-- 	

</div>
	<div id="mobile-menu">
	<ul>
		<li>
			<div class="mm-search">
				<form  action="https://bepnhadu.com/search" id="search" name="search" method="get" class="navbar-form form_search_index">
					<div class="input-group">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit"><i class="icon-search"></i></button>
						</div>
						<input type="text" value="" name="query" class="form-control simple" placeholder="Search ..." id="srch-term">
					</div>
				</form>
			</div>
		</li>
		<li><a href="../index.html">Trang chủ</a></li>
		
		<li><a href="../gioi-thieu.html">Giới thiệu</a></li>
		
		<li><a href="all.html">Sản phẩm</a> 
			sub sub category
			<ul>
				<li> <a href="../banh-xiu-pao.html">Bánh xíu páo</a> </li>
				
				<li> <a href="../com-chay-du-du.html">Cơm cháy</a> </li>
				
				<li> <a href="../kim-chi-du-du.html">Kim chi</a> </li>
				
				<li> <a href="../tra-sua-thai-du-du-1.html">Trà sữa thái Du Du</a> </li>
			</ul>		
			
		
		
		<li><a href="../blog.html">Blog</a> 
			sub sub category
			<ul>
				
				
				<li> <a href="../tong-hop-cach-lam-banh.html">Tổng hợp cách làm bánh</a> </li>
				
				
				
				<li> <a href="../suc-khoe.html">Sức khỏe</a> </li>
				
				
				
				<li> <a href="../goc-bep.html">Góc bếp</a> </li>
				
				
				
				<li> <a href="../banh-xiu-pao-di-du-event-1.html">Bánh xíu páo đi dự event</a> </li>
				
				
				
				<li> <a href="../banh-xiu-pao-di-lien-hoan-1.html">Bánh xíu páo đi liên hoan</a> </li>
				
				
				
				<li> <a href="../banh-xiu-pao-du-tiec-cuoi.html">Bánh xíu páo dự tiệc cưới</a> </li>
				
				
				
				<li> <a href="../feedback-khach-hang.html">Feedback khách hàng</a> </li>
				
				
			</ul>		
			
		
		
		<li><a href="../lien-he.html">Liên hệ</a></li>
		
		
	</ul>
</div>
	<script type="text/javascript">
  Bizweb.updateCartFromForm = function(cart, cart_summary_id, cart_count_id) {
    
    if ((typeof cart_summary_id) === 'string') {
      var cart_summary = jQuery(cart_summary_id);
      if (cart_summary.length) {
        // Start from scratch.
        cart_summary.empty();
        // Pull it all out.        
        jQuery.each(cart, function(key, value) {
          if (key === 'items') {
            
            var table = jQuery(cart_summary_id);           
            if (value.length) {  
              
              jQuery('<div class="animated_item"><p>Sản phẩm đã cho vào giỏ hàng</p></div>').appendTo(table);       
              jQuery.each(value, function(i, item) {
                jQuery('<li class="item even"><a class="product-image" href="'+ item.url +'"><img src="' + Bizweb.resizeImage(item.image, 'small') + '" width="80"></a><div class="detail-item"><div class="product-details"> <a href="javascript:void(0);" onclick="Bizweb.removeItem(' + item.variant_id + ')" title="Remove This Item" class="btn-remove1">Remove This Item</a><p class="product-name"> <a href="'+ item.url +'" title="' + item.name + '">' + item.name + '</a> </p></div><div class="product-details-bottom"> <span class="price">' + Bizweb.formatMoney(item.price, "{{amount_no_decimals_with_comma_separator}}₫") + '</span> <span class="title-desc">Số lượng:</span> <strong>' + item.quantity + '</strong> </div></div></li>').appendTo(table);
              });                       
                jQuery('<div class="top-subtotal">Tổng tiền: <span class="price total_price">0₫</span></div><div class="animated_item actions"><a href="/cart\" class=" view-cart">Giỏ hàng</a><a href="/checkout\" class=" btn-checkout">Thanh toán</a></div>').appendTo(table); 
            }
            else {
              jQuery('<div class="animated_item"><p>Không có sản phẩm nào trong giỏ hàng.</p></div>').appendTo(table);
            }
          }
        });
      }
    }
	  updateCartDesc(cart);
  }

  
  function updateCartDesc(data){
    var $cartLinkText = $('#open_shopping_cart'),
		$cartCount = $('#cart-total'),
	    $cartPrice = Bizweb.formatMoney(data.total_price, "{{amount_no_decimals_with_comma_separator}}₫");		
    switch(data.item_count){
      case 0:
        $cartLinkText.attr('data-amount','0');
		$cartCount.text('0');
        break;
      case 1:
        $cartLinkText.attr('data-amount','1');
		$cartCount.text('1');
        break;
      default:
        $cartLinkText.attr('data-amount', data.item_count);
		$cartCount.text(data.item_count);
        break;
    }
	 $('.open_button .total_price').html($cartPrice);
  }  
  Bizweb.onCartUpdate = function(cart) {
    Bizweb.updateCartFromForm(cart, '.shopping_cart', 'shopping-cart');
  };  
  $(window).load(function() {
    // Let's get the cart and show what's in it in the cart box.  
    Bizweb.getCart(function(cart) {      
      Bizweb.updateCartFromForm(cart, '.shopping_cart');    
    });
  });
</script>
	

<style>
	#facebook-inbox {
		position: fixed;
		bottom: 0px;
		z-index: 110000;
		text-align: center;
		display: none;
		right: 0px !important
	}

	.facebook-inbox-tab-icon {
		float: left;
	}

	.facebook-inbox-tab-title {
		float: left;
		margin-left: 10px;
		line-height: 25px;
	}

	#facebook-inbox-frame {
		display: none;
		width: 100%;
		min-height: 200px;
		overflow: hidden;
		position: relative;
		background-color: #f5f5f5;
	}

	#fb-root {
		height: 0px;
	}

	.facebook-inbox-tab {
		top: 0px;
		bottom: 0px;
		margin: -40px 0px 0px 0px;
		position: relative;
		height: 40px;
		width: 250px;
		border: 1px solid;
		border-radius: 0px 0px 0px 0px;
		text-align: center;
		background-color: #19a3dd;
		color: #ffffff;
	}
</style>
<script>
(function (d, s, id) {
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) return;
				js = d.createElement(s); js.id = id;
				js.src = "../../connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.5";
				fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	window.facebookParse = function facebookParse(){
		FB.XFBML.parse();
	}
</script> </body>
	<div class="hotline_fix hidden-lg hidden-md hidden-sm">
	<a href="tel:094.448.4988"><i class="fa fa-phone"></i></a>
</div>
<style>
	.hotline_fix{
		position: fixed;
		bottom: 5px;
		left: 10px;
		top: auto !important;
		z-index: 999;
		background-color: #942C61;
		border-radius: 100%;
	}
	.hotline_fix a{
		padding: 5px 12px;
		font-size: 18px;
		color: #fff;
		display: block;
		
	}
</style>

Mirrored from bepnhadu.com/collections/all by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 27 May 2017 02:09:29 GMT
</html> 

-->