package com.baizhi.repository;

import com.baizhi.entity.Emp;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomBookRepository {
    //高亮查询
    List<Emp> findHiglightBuilder(String content);
}
