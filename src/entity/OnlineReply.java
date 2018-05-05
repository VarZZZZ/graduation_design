package entity;

/**
 * Created by Liangying on 2018/5/3.
 */
public class OnlineReply {
    private int id;
    private String recontent;
    private String redate;
    private OnlineMsg olMsg;
    private int mid;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRecontent() {
        return recontent;
    }

    public void setRecontent(String recontent) {
        this.recontent = recontent;
    }

    public String getRedate() {
        return redate;
    }

    public void setRedate(String redate) {
        this.redate = redate;
    }

    public OnlineMsg getOlMsg() {
        return olMsg;
    }

    public void setOlMsg(OnlineMsg olMsg) {
        this.olMsg = olMsg;
    }


    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }
}
