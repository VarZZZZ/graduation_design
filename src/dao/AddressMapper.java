package dao;

import entity.Address;

import java.util.List;

/**
 * Created by Liangying on 2017/11/23.
 */
public interface AddressMapper {
    public int add(Address address);

    public int delete(int id);

    public Address get(int id);

    public int update(Address address);

    public List<Address> list();

    public Address getByUid(int uid);
}
