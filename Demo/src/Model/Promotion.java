package Model;

public class Promotion {
    private int id;
    private int type;
    private String code;
    private double priceCondition, amount;

    public Promotion() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getPriceCondition() {
        return priceCondition;
    }

    public void setPriceCondition(double priceCondition) {
        this.priceCondition = priceCondition;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
}
