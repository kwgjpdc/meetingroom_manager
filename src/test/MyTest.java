import com.bcsd.dao.AppointmentMeetDao;
import com.bcsd.dao.MeetRoomDao;
import com.bcsd.dao.MeetUserDao;
import com.bcsd.dao.ReMeetRoomDao;
import com.bcsd.entity.Appointment_Meeting;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.MeetUser;
import com.bcsd.service.MeetRoomService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-application.xml")
public class MyTest {

    @Autowired
    private MeetRoomService ss;

    @Autowired
    private MeetUserDao meetUserDao;

    @Autowired
    private ReMeetRoomDao remeetRoom;
    @Autowired
    private AppointmentMeetDao appointmentMeetDao;
    @Test
    public void findAll()  {
       // List<MeetRoom> all = meetRoomService.findAll();
        //MeetRoom one = ss.findOne("00585598-6019-4C51-A881-A050CEBCF6CB");
        //System.out.println(one);

//        System.out.println(remeetRoom.findByDate("2019-01-01 11:22","2019-04-26 12:22"));
//        MeetUser user =new MeetUser();
//        List<MeetUser> users=new ArrayList<MeetUser>();
//        users.set(1,user);
         List<MeetUser> user= meetUserDao.findAll();
         System.out.println(user);
        appointmentMeetDao.addUser(user);


    }
}
