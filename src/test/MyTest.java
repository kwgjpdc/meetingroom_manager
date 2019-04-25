import com.bcsd.dao.MeetDeptDao;
import com.bcsd.dao.MeetRoomDao;
import com.bcsd.dao.MeetUserDao;
import com.bcsd.entity.MeetDept;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.MeetUser;
import com.bcsd.service.MeetRoomService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-application.xml")
public class MyTest {

    @Autowired
    private MeetDeptDao meetDeptDao;
    @Autowired
    private MeetUserDao meetUserDao;
    @Test
    public void findAll()  {
       // List<MeetRoom> all = meetRoomService.findAll();

       List<MeetDept> ss=meetDeptDao.findAll();

        System.out.println(ss);

    }
    @Test
    public void findByid(){
        MeetDept meetDept=meetDeptDao.findByid("1");
        System.out.println(meetDept);
    }
    @Test
    public void update(){
        MeetDept meetDept=new MeetDept();
        meetDept.setDeptid("6482");
        meetDept.setDeptname("外交部");
        meetDept.setDeptaddr("武汉");
        meetDept.setDepttel("88888888");
        meetDept.setEmail("123@123.com");
        meetDept.setSubid(1);
        meetDeptDao.update(meetDept);
    }
    @Test
    public void findUser(){
        List<MeetUser> all = meetUserDao.findAll();
        System.out.println(all);
    }
    @Test
    public void add(){
        MeetUser meetUser=new MeetUser();


    }
}
