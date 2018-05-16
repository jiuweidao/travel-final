package com.travel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.pojo.Planmembers;

public interface PlanmembersMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    int insert(Planmembers record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    int insertSelective(Planmembers record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    Planmembers selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    int updateByPrimaryKeySelective(Planmembers record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2017-07-05 13:41:32
     */
    int updateByPrimaryKey(Planmembers record);
    
    
    
    int selectIdByUidAndPid(@Param("uid")String uid,@Param("pid")String  pid);
    
    int selectCountByPid (String pid);
    
    List<Integer>selectIdByUid(String uid);
    
    /**
     * planid 查询成员id 
     * @param pid
     * @return
     */
    List<Integer> selectUserIdByPid(String pid);
    
    int deleteByPid(String pid);
}