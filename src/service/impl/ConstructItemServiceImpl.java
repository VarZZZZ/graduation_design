package service.impl;

import dao.ConstructItemMapper;
import entity.Construct;
import entity.ConstructItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ConstructItemService;
import service.ConstructService;

import java.util.List;

/**
 * Created by Liangying on 2018/5/31.
 */
@Service
public class ConstructItemServiceImpl implements ConstructItemService {
    @Autowired
    ConstructItemMapper constructItemMapper;

    @Override
    public int add(ConstructItem constructItem) {
        return constructItemMapper.add(constructItem);
    }
}
