package service;

import entity.Address;

import java.util.List;

/**
 * Created by Liangying on 2017/11/23.
 */
public interface AddressService {
    int add(Address address);
    int delete(int id);
    int update(Address address);
    Address get(int id);
    List<Address> list();
    Address getByUid(int uid);
}
