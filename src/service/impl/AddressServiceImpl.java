package service.impl;

import dao.AddressMapper;
import entity.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.AddressService;

import java.util.List;

/**
 * Created by Liangying on 2017/11/23.
 */
@Service
public class AddressServiceImpl implements AddressService {
    @Autowired(required = false)
    AddressMapper addressMapper;

    @Override
    public int add(Address address) {
        return addressMapper.add(address);
    }

    @Override
    public int delete(int id) {
        return addressMapper.delete(id);
    }

    @Override
    public int update(Address address) {
        return addressMapper.update(address);
    }

    @Override
    public Address get(int id) {
        return addressMapper.get(id);
    }

    @Override
    public List<Address> list() {
        return addressMapper.list();
    }

    @Override
    public Address getByUid(int uid) {
        return addressMapper.getByUid(uid);
    }
}
