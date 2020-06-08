package com.baizhi.controller;


import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("emp")
public class EmpController {
    //注入EmpService
    @Autowired
    private EmpService empService;

    /*@ResponseBody
    @RequestMapping("queryAll")
    public Map<String,Object> queryAll(){        //查询所有
        System.out.println("查询所有进入————————————————");
        HashMap<String, Object> map = new HashMap<>();
        //调用业务方法
        List<Emp> emps = empService.queryAll();
        map.put("emps",emps);
        System.out.println(emps);
        System.out.println("查询结束——————————————");
        User user = new User(new Date());
        map.put("user",user);
        return map;
    }*/
    @ResponseBody
    @RequestMapping("selectAll")
    public List<Emp> selectAll(){       //查询所有
        List<Emp> emps = empService.queryAll();
        return emps;
    }

    /*@ResponseBody
    @RequestMapping("deleteEmp")
    public void deleteEmp(String id){
        //调用业务方法
        empService.deleteEmp(id);
    }*/

    @ResponseBody
    @RequestMapping("zsg")
    public void zsg(Emp emp,String oper){       //增删改
        //判断操作
        if ("add".equals(oper)){
            empService.addEmp(emp);
        }
        if ("del".equals(oper)){
            empService.deleteEmp(emp.getId());
        }
        if ("edit".equals(oper)){
            empService.updateEmp(emp);
        }
    }

    @ResponseBody
    @RequestMapping("higlight")
    public List<Emp> findHiglight(String content){
        System.out.println("content=========="+content);
        System.out.println("empService======"+empService);
        List<Emp> last = empService.findLast(content);
        System.out.println("last======"+last);

        for (Emp emp : last) {
            System.out.println(emp);
        }
        return last;
    }

    @ResponseBody
    @RequestMapping("upload")
    public String upload(MultipartFile file, HttpSession session){      //文件上传
        //获取上传路径
        String realPath = session.getServletContext().getRealPath("/upload");
        File file1 = new File(realPath);
        //判断文件夹是否存在
        if (!file1.exists()){
            file1.mkdirs();     //创建文件夹
        }
        //获取上传文件名
        String originalFilename = file.getOriginalFilename();
        //防止文件重名  设置时间戳
        String name = new Date().getTime()+ originalFilename;
        //文件上传
        try {
            file.transferTo(new File(realPath,name));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "上传成功";
    }

    @ResponseBody
    @RequestMapping("add")
    public String add(Date bir){
        System.out.println(bir);
        return "ok";
    }
}
