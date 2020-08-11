<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<!-- end header -->
		
<tiles:insertAttribute name="content"></tiles:insertAttribute>

<!--Hết góc bếp -->

<!--footer-->

<tiles:insertAttribute name="footer"></tiles:insertAttribute>

<!-- End Footer -->
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
						<input type="text" value="" name="query"  class="form-control simple" placeholder="Search ..." id="srch-term">
					</div>
				</form>
			</div>
		</li>
		
		
		<li><a href="index.html">Trang chủ</a></li>
		
		
		
		<li><a href="gioi-thieu.html">Giới thiệu</a></li>
		
		
		
		<li><a href="collections/all.html">Sản phẩm</a> 
			<!--sub sub category-->
			<ul>
				
				
				<li> <a href="banh-xiu-pao.html">Bánh xíu páo</a> </li>
				
			
				
			</ul>		
			
		
		
		<li><a href="blog.html">Blog</a> 
			<!--sub sub category-->
			<ul>
				
				
				<li> <a href="tong-hop-cach-lam-banh.html">Tổng hợp cách làm bánh</a> </li>
				
				
				
				<li> <a href="suc-khoe.html">Sức khỏe</a> </li>
				
				
				
				<li> <a href="goc-bep.html">Góc bếp</a> </li>
				
				
				
				
				<li> <a href="feedback-khach-hang.html">Feedback khách hàng</a> </li>
				
				
			</ul>		
			
		
		
		<li><a href="lien-he.html">Liên hệ</a></li>
		
		
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
				js.src = "../connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.5";
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

</html>