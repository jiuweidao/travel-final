package com.travel.dao;

import com.travel.pojo.Users;

public interface UsersMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    int insert(Users record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    int insertSelective(Users record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    Users selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    int updateByPrimaryKeySelective(Users record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2017-07-04 18:24:18
     */
    int updateByPrimaryKey(Users record);
    
    
    Integer selectByTelemoble(String key);
    
    Integer selectByUserName(String key);
    
    Integer selectByEmail(String key);
    
    Users selectByAll(String key);
    
}