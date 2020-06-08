package com.baizhi.cache;

import org.apache.ibatis.cache.Cache;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.util.ObjectUtils;

public class RedisCache implements Cache {

    private String id;

    public RedisCache(String id){
        this.id =id;
    }
    //返回当前的namespace
    @Override
    public String getId() {
        return id;
    }
    //添加缓存
    @Override
    public void putObject(Object o, Object o1) {
        System.out.println("id=============="+id);
        System.out.println("添加缓存");
        StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) ApplicationContextUtil.getBean(StringRedisTemplate.class);
        if(!ObjectUtils.isEmpty(o1)){
            String s = SerializeUtils.serialize(o1);
            stringRedisTemplate.opsForHash().put(id,o.toString(),s);
        }
    }

    @Override
    public Object getObject(Object o) {
        System.out.println("id=============="+id);
        System.out.println("获取缓存");
        StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) ApplicationContextUtil.getBean(StringRedisTemplate.class);
        Boolean aBoolean = stringRedisTemplate.hasKey(o.toString());
        if (aBoolean){
            String s = stringRedisTemplate.opsForValue().get(o.toString());
            return SerializeUtils.serializeToObject(s);
        }
        return null;
    }

    @Override
    public Object removeObject(Object o) {
        return null;
    }

    @Override
    public void clear() {
        System.out.println("id================"+id);
        StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) ApplicationContextUtil.getBean(StringRedisTemplate.class);
        stringRedisTemplate.delete(id);
        System.out.println("清除缓存");
    }

    @Override
    public int getSize() {
        StringRedisTemplate stringRedisTemplate = (StringRedisTemplate) ApplicationContextUtil.getBean(StringRedisTemplate.class);
        Long size = stringRedisTemplate.opsForHash().size(id);
        return size.intValue();
    }
}
