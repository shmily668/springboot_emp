package com.baizhi.service;

import com.baizhi.entity.Emp;

import java.util.List;

public interface EmpService {
    //查询所有员工
    List<Emp> queryAll();
    //删除员工
    void deleteEmp(String id);
    //添加员工
    void addEmp(Emp emp);
    //修改员工
    void updateEmp(Emp emp);
    //高亮查询
    List<Emp> findLast(String content);
}
