package entity;

/**
 * Created by Liangying on 2018/5/3.
 */
public class OnlineMsg {
    private int id;
    private String theme;
    private String content;
    private String date;
    private OnlineReply olReply;
    private int uid;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public OnlineReply getOlReply() {
        return olReply;
    }

    public void setOlReply(OnlineReply olReply) {
        this.olReply = olReply;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
