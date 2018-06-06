package com.travel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.travel.pojo.Reports;

public interface ReportsMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    int insert(Reports record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    int insertSelective(Reports record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    Reports selectByPrimaryKey(Integer id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    int updateByPrimaryKeySelective(Reports record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2018-05-29 17:16:40
     */
    int updateByPrimaryKey(Reports record);
    
    List<Reports> selectByPage(@Param("id")int id,@Param("page")int page,@Param("pageNum")int  pageNum);
    
    int selectCount(@Param("id")int id);
}