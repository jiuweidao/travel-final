package com.travel.dao;

import com.travel.pojo.Strategies;

public interface StrategiesMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    int insert(Strategies record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    int insertSelective(Strategies record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    Strategies selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    int updateByPrimaryKeySelective(Strategies record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-04-30 22:37:42
     */
    int updateByPrimaryKey(Strategies record);
}