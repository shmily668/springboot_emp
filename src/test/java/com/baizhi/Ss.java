package com.baizhi;

import com.baizhi.dao.EmpDao;
import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest
@RunWith(SpringRunner.class)
public class Ss {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private EmpDao dao;

    @Autowired
    private EmpService empService;

    @Test
    public void ss()        //查询所有
    {
        List<Emp> emps = dao.queryAll();
        for (Emp emp : emps) {
            System.out.println(emp);
        }
    }
    @Test
    public void b(){
        dao.deleteEmp("3f43f30c-9c79-4011-b989-5b7e02ccc556");
        System.out.println("删除成功");
    }

    @Test
    public void a(){
        List<Emp> emps = empService.queryAll();
        for (Emp emp : emps) {
            System.out.println(emp);
        }
    }
    @Test
    public void c(){
        List<Emp> q = empService.findLast("刘帆");
        System.out.println(q);
    }
}
