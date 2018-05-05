package service;

import entity.Customization;

import java.util.List;

/**
 * Created by Liangying on 2018/5/5.
 */
public interface CustomizationService {
    public int add(Customization customization);

    public int delete(int id);

    public Customization get(int id);

    public int update(Customization customization);

    public List<Customization> list();

    public List<Customization> listByUid(int uid);
}
