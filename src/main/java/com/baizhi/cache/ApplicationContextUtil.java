package com.baizhi.cache;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component      //交给工厂管理
public class ApplicationContextUtil implements ApplicationContextAware {
    private static ApplicationContext applicationContext;
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext=applicationContext;
    }
    //1、根据名称获得对应的bean
    public static Object getBean(String name){
        return applicationContext.getBean(name);
    }
    //2、根据类型获得对应的bean
    public static Object getBean(Class clazz){
        return applicationContext.getBean(clazz);
    }
    //3、根据名称和类型获得bean
    public static Object getBean(String name,Class clazz){
        return applicationContext.getBean(name,clazz);
    }
}
