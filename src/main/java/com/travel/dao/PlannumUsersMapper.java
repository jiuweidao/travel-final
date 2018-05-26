package com.travel.dao;

import java.util.List;

import com.travel.pojo.PlannumUsers;

public interface PlannumUsersMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    int insert(PlannumUsers record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    int insertSelective(PlannumUsers record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    PlannumUsers selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    int updateByPrimaryKeySelective(PlannumUsers record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-23 16:05:49
     */
    int updateByPrimaryKey(PlannumUsers record);
    
    List<PlannumUsers> selectUserTop(int topNum);
    
    int updateByUidSelective(PlannumUsers record);
    
    /**
     * 根据用户id查询PlannumUsers
     * @param uid
     * @return
     */
    PlannumUsers selectByUid(int uid);
}