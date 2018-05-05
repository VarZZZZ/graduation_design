package viewmodel;

import entity.OnlineMsg;
import entity.User;

/**
 * Created by Liangying on 2018/5/3.
 */
public class OnlineMsgVM {
    private OnlineMsg onlineMsg;
    private User user;

    public OnlineMsg getOnlineMsg() {
        return onlineMsg;
    }

    public void setOnlineMsg(OnlineMsg onlineMsg) {
        this.onlineMsg = onlineMsg;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
