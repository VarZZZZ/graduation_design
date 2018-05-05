package viewmodel;

import entity.Customization;
import entity.Product;
import entity.User;

/**
 * Created by Liangying on 2018/5/5.
 */
public class CustomizationVM {
    private Customization customization;
    private User user;
    private Product product;

    public Customization getCustomization() {
        return customization;
    }

    public void setCustomization(Customization customization) {
        this.customization = customization;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
