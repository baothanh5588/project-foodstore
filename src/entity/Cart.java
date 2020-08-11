package entity;

public class Cart {

    private Product product;
    private int soluong;
    
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public Cart(Product product, int soluong) {
		super();
		this.product = product;
		this.soluong = soluong;
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

}


