package com.travel.dao;

import com.travel.pojo.Contacts;

public interface ContactsMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    int insert(Contacts record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    int insertSelective(Contacts record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    Contacts selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    int updateByPrimaryKeySelective(Contacts record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-26 09:56:46
     */
    int updateByPrimaryKey(Contacts record);
}