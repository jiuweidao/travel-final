package com.travel.dao;

import com.travel.pojo.ScoreUser;

public interface ScoreUserMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    int insert(ScoreUser record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    int insertSelective(ScoreUser record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    ScoreUser selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    int updateByPrimaryKeySelective(ScoreUser record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-28 09:57:49
     */
    int updateByPrimaryKey(ScoreUser record);
    
    Integer selectTotalByUid(int uid);
}