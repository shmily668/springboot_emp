package com.baizhi.service.impl;

import com.baizhi.dao.EmpDao;
import com.baizhi.entity.Emp;
import com.baizhi.repository.CustomBookRepository;
import com.baizhi.service.EmpRepository;
import com.baizhi.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class EmpServiceImpl implements EmpService {
    //注入EmpDAO
    @Autowired
    private EmpDao empDAO;
    @Autowired
    private EmpRepository empRepository;

    @Autowired
    private CustomBookRepository customBookRepository;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Emp> queryAll() {           //查询所有员工
        List<Emp> emps = empDAO.queryAll();
        for (Emp emp : emps) {
            //将数据存入es
            empRepository.save(emp);
        }
        return emps;
    }

    @Override
    public void deleteEmp(String id) {      //删除员工
        empDAO.deleteEmp(id);
    }

    @Override
    public void addEmp(Emp emp) {       //添加员工
        emp.setId(UUID.randomUUID().toString().replace("-",""));
        empDAO.addEmp(emp);
    }

    @Override
    public void updateEmp(Emp emp) {    //修改员工信息
        empDAO.updateEmp(emp);
    }

    @Override
    public List<Emp> findLast(String content) {     //高亮查询
        List<Emp> higlightBuilder = customBookRepository.findHiglightBuilder(content);
        return higlightBuilder;
    }


}
