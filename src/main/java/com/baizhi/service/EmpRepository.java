package com.baizhi.service;

import com.baizhi.entity.Emp;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface EmpRepository extends ElasticsearchRepository<Emp,String> {
}
