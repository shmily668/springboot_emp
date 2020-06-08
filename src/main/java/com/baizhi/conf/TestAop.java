package com.baizhi.conf;


import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component      //交给工厂管理
@Aspect         //声明当前类为一个切面
public class TestAop {

    @Pointcut(value = "execution(* com.baizhi.service.*.*(..))")   //切入点
    public void test(){

    }

    /*@Before(value = "execution(* com.baizhi.service.*.*(..))")
    public void before(){
        System.out.println("前置通知执行+++++++");
    }
    @After(value = "execution(* com.baizhi.service.*.*(..))")
    public void after(){
        System.out.println("后置通知执行++++++");
    }*/

    /*
    * 环绕通知
    * */
    /*@Around("test()")
    public Object interceptor(ProceedingJoinPoint proceedingJoinPoint){
        System.out.println("----前置------");
        Object proceed = null;
        try {
            proceed = proceedingJoinPoint.proceed();
            System.out.println(proceed);
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        System.out.println("-----后置-----");
        return proceed;
    }*/
}
