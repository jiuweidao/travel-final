package com.travel.dao;

import java.util.List;

import com.travel.pojo.Plans;

public interface PlansMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2017-07-05 18:44:31
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2017-07-05 18:44:31
     */
    int insert(Plans record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2017-07-05 18:44:31
     */
    int insertSelective(Plans record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2017-07-05 18:44:31
     */
    Plans selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2017-07-05 18:44:31
     */
    int updateByPrimaryKeySelective(Plans record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2017-07-05 18:44:31
     */
    int updateByPrimaryKey(Plans record);
    
    
    List<Plans> selectAllPlansByUid(String uid);
}