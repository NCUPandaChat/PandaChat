import com.chat.pojo.User;
import com.chat.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestOne {
    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userServiceImpl =(UserService) context.getBean("UserServiceImpl");
        User user=userServiceImpl.selectById("M1");
            System.out.println(user);

    }
}
