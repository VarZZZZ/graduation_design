package service.impl;

import dao.LogisticsItemMapper;
import entity.LogisticsItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.LogisticsItemService;

/**
 * Created by Liangying on 2018/5/6.
 */
@Service
public class LogisticsItemServiceImpl implements LogisticsItemService {
    @Autowired
    LogisticsItemMapper logisticsItemMapper;
    @Override
    public int add(LogisticsItem logisticsItem) {
        return logisticsItemMapper.add(logisticsItem);
    }
}
