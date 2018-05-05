package service.impl;

import dao.CustomizationMapper;
import entity.Customization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.CustomizationService;
import utils.OrderStatus;

import java.util.List;

/**
 * Created by Liangying on 2018/5/5.
 */
@Service
public class CustomizationServiceImpl implements CustomizationService {
    @Autowired
    CustomizationMapper customizationMapper;
    @Override
    public int add(Customization customization) {
        customization.setStatus(OrderStatus.ORDER_NOT_PRODUCE);
        return customizationMapper.add(customization);
    }

    @Override
    public int delete(int id) {
        return customizationMapper.delete(id);
    }

    @Override
    public Customization get(int id) {
        return customizationMapper.get(id);
    }

    @Override
    public int update(Customization customization) {
        return customizationMapper.update(customization);
    }

    @Override
    public List<Customization> list() {
        return customizationMapper.list();
    }

    @Override
    public List<Customization> listByUid(int uid) {
        return customizationMapper.listByUid(uid);
    }
}
