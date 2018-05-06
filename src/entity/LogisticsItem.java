package entity;

/**
 * Created by Liangying on 2018/5/6.
 */
public class LogisticsItem {
    private int id;
    private int loid;
    private String info;
    private String date;
    private Logistics logistics;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLoid() {
        return loid;
    }

    public void setLoid(int loid) {
        this.loid = loid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Logistics getLogistics() {
        return logistics;
    }

    public void setLogistics(Logistics logistics) {
        this.logistics = logistics;
    }
}
