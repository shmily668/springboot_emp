package com.baizhi.repository;

import com.baizhi.entity.Emp;
import lombok.SneakyThrows;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.SearchResultMapper;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.data.elasticsearch.core.aggregation.impl.AggregatedPageImpl;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class CustomBookReqositoryImpl implements CustomBookRepository{

    @Autowired
    private ElasticsearchTemplate elasticsearchTemplate;

    HighlightBuilder.Field field = new HighlightBuilder
                                        .Field("*")
                                        .preTags("<font color='red'>")
                                        .postTags("</font>")
                                        .requireFieldMatch(false);
    @Override
    public List<Emp> findHiglightBuilder(String content) {
        NativeSearchQuery build = new NativeSearchQueryBuilder()
                                        .withQuery(QueryBuilders.termQuery("name",content))
                                        .withHighlightFields(field)
                                        .build();
        AggregatedPage aggregatedPage = elasticsearchTemplate.queryForPage(build, Emp.class, new SearchResultMapper() {
            @SneakyThrows
            @Override
            public <T> AggregatedPage<T> mapResults(SearchResponse searchResponse, Class<T> aClass, Pageable pageable) {
                ArrayList<Emp> emps = new ArrayList<>();
                SearchHit[] hits = searchResponse.getHits().getHits();
                for (SearchHit hit : hits) {
                    Emp emp = new Emp();
                    Map<String, Object> sourceAsMap = hit.getSourceAsMap();
                    //获取有高亮的集合
                    Map<String, HighlightField> highlightFields = hit.getHighlightFields();
                    //判断有无高亮的集合  展示高亮数据
                    if (sourceAsMap.get("id").toString()!=null){
                        emp.setId(sourceAsMap.get("id").toString());
                    }
                    if (sourceAsMap.get("name").toString()!=null){
                        if(highlightFields.get("name").toString()!=null)
                        emp.setName(highlightFields.get("name").toString());
                    }
                    if (sourceAsMap.get("password").toString()!=null){
                        emp.setPassword(sourceAsMap.get("password").toString());
                    }
                    if (sourceAsMap.get("birthday").toString()!=null){
                        emp.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(sourceAsMap.get("birthday").toString()));
                    }
                    if (sourceAsMap.get("mobile").toString()!=null){
                        emp.setMobile(sourceAsMap.get("mobile").toString());
                    }
                    if (sourceAsMap.get("state").toString()!=null){
                        emp.setState(sourceAsMap.get("state").toString());
                    }
                    emps.add(emp);
                }
                return new AggregatedPageImpl<T>((List<T>) emps);
            }
        });
        return aggregatedPage.getContent();
    }
}
