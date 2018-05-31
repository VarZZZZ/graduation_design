package entity;

/**
 * Created by Liangying on 2018/5/31.
 */
public class ConstructItem {
    private int id;
    private int cuid;
    private String imageurl;
    private String info;
    private String date;

    private Construct construct;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCuid() {
        return cuid;
    }

    public void setCuid(int cuid) {
        this.cuid = cuid;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
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

    public Construct getConstruct() {
        return construct;
    }

    public void setConstruct(Construct construct) {
        this.construct = construct;
    }
}
